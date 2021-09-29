
<?php
	include("../DbConn.php");
	Get_NHL_Picks($conn);

	class NHL_TeamData {
		public $team;
		public $GP;
		public $W;
		public $L;
		public $OL;
		public $P;
		public $G;
		public $GA;

		function __construct ($team, $GP, $W, $L, $OL, $P, $G, $GA)
		{
			$this->team = $team;	// (3 letter team code)
			$this->GP = $GP;	// games played
			$this->W = $W;		// wins
			$this->L = $L;		// losses
			$this->OL = $OL;	// overtime losses
			$this->P = $P;		// points
			$this->G = $G;		// goals (scored)
			$this->GA = $GA;	// goals against
		}
	}

	function Get_NHL_Grade($team)
	{
		$grade = $team->W * 10;
		$grade -= ($team->L * 10);
		$grade -= ($team->OL * 3);
		$grade += $team->P;
		$grade += ($team->G * 3);
		$grade -= ($team->GA * 3);
		return $grade;
	}

	function Get_NHL_Score ($team)
	{
		// average goals per game
		if (strlen(trim($team->team)) == 3)
		{
			$goals = ceil($team->G / $team->GP);
			$goals += rand(ceil(-$goals * 0.75), ceil($goals * 0.5) );
			return $goals;
		}
	}

	function getData($url, $startText, $endText)
	{
		$html = file_get_contents($url);
		$start = strpos($html, $startText);
		$end = strpos($html, $endText);
		$all = substr($html, $start, $end);
		preg_match_all("/<tr>(.*)<\\/tr>/", $all, $match);
		$DOM = new DOMDocument();
		$DOM->loadHTML($all);
		$rows = $DOM->getElementsByTagName('tr');
		$cells = array();
		foreach ($rows as $node)
			$cells[] = tdRows($node->childNodes);
		return $cells;
	}

	function tdRows($elements)
	{
		$cells = array();
		foreach ($elements as $element)
			$cells[] = $element->nodeValue;
		return $cells;
	}

	function Get_NHL_Picks($conn)
	{
		$GameDate = date("Y-m-d");
		// get stats of all teams
		$url = "https://www.hockey-reference.com/leagues/NHL_2021.html";
		$fullData = getData($url, "Team Statistics", "Team Analytics");

		// [0] => Carolina Hurricanes* [1] => 56 [2] => 36 [3] => 12 [4] => 8 [5] => 80 [6] => .714 [7] => 179 [8] => 136 [9] => 0.67 [10] => -0.10 [11] => .625 [12] => 27 [13] => 27-12-17 [14] => .634 ) 
		$codes = array("Anaheim Ducks" => "ANA", "Arizona Coyotes" => "ARI", "Boston Bruins" => "BOS", "Buffalo Sabres" => "BUF", "Calgary Flames" => "CGY", "Carolina Hurricanes" => "CAR", "Chicago Blackhawks" => "CHI", "Colorado Avalanche" => "COL", "Columbus Blue Jackets" => "CBJ", "Dallas Stars" => "DAL", "Detroit Red Wings" => "DET", "Edmonton Oilers" => "EDM", "Florida Panthers" => "FLA", "Los Angeles Kings" => "LAK", "Minnesota Wild" => "MIN", "Montreal Canadiens" => "MTL", "Nashville Predators" => "NSH", "New Jersey Devils" => "NJD", "New York Islanders" => "NYI", "New York Rangers" => "NYR", "Ottawa Senators" => "OTT", "Philadelphia Flyers" => "PHI", "Pittsburgh Penguins" => "PIT", "San Jose Sharks" => "SJS", "St. Louis Blues" => "STL", "Seattle Kraken" => "SEA", "Tampa Bay Lightning" => "TBL", "Toronto Maple Leafs" => "TOR", "Vancouver Canucks" => "VAN", "Vegas Golden Knights" => "VEG", "Washington Capitals" => "WSH", "Winnipeg Jets" => "WPG");
		$teams = array();
		foreach ($fullData as $team)
		{
			$fullTeamName = str_replace("*", "", $team[0]);
			if (array_key_exists($fullTeamName, $codes))
				array_push ($teams, new NHL_TeamData($codes[$fullTeamName], $team[1], $team[2], $team[3], $team[4], $team[5], $team[7], $team[8]) );
		}

		// get today's games
		$sql = "select * from games where GameDate = '" . $GameDate . "' and league = 'NHL'; ";
		$results = $conn->query($sql) or die($conn->error);
		$update_multi_sql = "";
		while ($row = $results->fetch_assoc())
		{
			$awayTeam = "";
			$awayScore = "";
			$homeTeam = 0;
			$homeScore = 0;
			$awayTeamFound = 0;
			$homeTeamFound = 0;
			foreach ($teams as $team)
			{
				if (trim($team->team) == trim($row["AwayTeam"]))
				{
					$awayTeam = $team;
					$awayGrade = Get_NHL_Grade($team);
					$awayScore = Get_NHL_Score($team);
					$awayTeamFound = 1;
				}
				if (trim($team->team) == trim($row["HomeTeam"]))
				{
					$homeTeam = $team;
					$homeGrade = Get_NHL_Grade($team);
					$homeScore = Get_NHL_Score($team);
					$homeTeamFound = 1;
				}
				if ($awayTeamFound == 1 && $homeTeamFound == 1)
				{
					if ($awayScore == $homeScore)
					{
						if ($awayGrade > $homeGrade)
							$awayScore ++;
						else
							$homeScore ++;
					}
					$sql = " update games set AwayScorePick = ".$awayScore.", HomeScorePick = ".$homeScore;
					$sql.= " where id = ".$row['id'];
					$sql.= " and AwayScorePick is null and HomeScorePick is null ;  ";
					$update_multi_sql .= $sql;
					break;
				}
			}
		}

		$result = $conn->multi_query($update_multi_sql);
		echo str_replace(';', ';</br>', $update_multi_sql);
	}
	$conn->close();
?>
