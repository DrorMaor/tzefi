
<?php
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

	include("../DbConn.php");
	Get_NBA_Picks($conn);

        class NBA_TeamData {
                public $team;
		public $G;	// games
		public $P;	// total points
		public $P2;	// 2 point baskets
		public $P2A;	// 2 points avg
		public $P3;	// 3 point baskets
		public $P3A;	// 3 points avg
		public $FT;	// free throws (complete)
		public $FTA;	// free throw avg
		public $DRB;	// defensive rebounds
		public $STL;	// steals
		public $BLK;	// blocks
		public $TOV;	// turnovers
		public $PF;	// personal fouls

                function __construct ($team, $G, $P, $P2, $P2A, $P3, $P3A, $FT, $FTA, $DRB, $STL, $BLK, $TOV, $PF)
                {
                        $this->team = $team;
			$this->G = $G;
			$this->P = $P;
			$this->P2 = $P2;
			$this->P2A = $P2A;
			$this->P3 = $P3;
			$this->P3A = $P3A;
			$this->FT = $FT;
			$this->FTA = $FTA;
			$this->DRB = $DRB;
			$this->STL = $STL;
			$this->BLK = $BLK;
			$this->TOV = $TOV;
			$this->PF = $PF;
                }
        }

        function Get_NBA_Grade($team)
        {
		$grade = $team->P;
		// add averages
                $grade += ($team->P2A + $team->P3A + $team->FTA) * 1000;
		$grade += $team->DRB + $team->STL + $team->BLK - $team->TOV;
		// subtract personal fouls
		$grade -= ($team->PF * 2);
                return $grade;
        }

        function Get_NBA_Score ($team)
        {
		// points per game
		$PPG = ceil($team->P / $team->G);
		$PPG = rand($PPG * 0.9, $PPG * 1.1);
		return $PPG;
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

	function Get_NBA_Picks($conn)
	{
		$GameDate = date("Y-m-d");
		// get stats of all teams
		$url = "https://www.basketball-reference.com/leagues/NBA_2021.html";
		$fullData = getData($url, "<h2>Total Stats</h2>", "<h2>Per 100 Poss Stats</h2>");
		// [0] => 1 [1] => Milwaukee Bucks* [2] => 72 [3] => 17330 [4] => 3221 [5] => 6610 [6] => .487 [7] => 1038 [8] => 2669 [9] => .389 [10] => 2183 [11] => 3941 [12] => .554 [13] => 1169 [14] => 1539 [15] => .760 [16] => 741 [17] => 2724 [18] => 3465 [19] => 1834 [20] => 585 [21] => 334 [22] => 995 [23] => 1244 [24] => 8649 )
		$codes = array("Milwaukee Bucks" => "MIL", "Golden State Warriors" => "GSW", "New Orleans Pelicans" => "NOP", "Philadelphia 76ers" => "PHI", "Los Angeles Clippers" => "LAC", "Portland Trail Blazers" => "POR", "Oklahoma City Thunder" => "OKC", "Toronto Raptors" => "TOR", "Sacramento Kings" => "SAC", "Washington Wizards" => "WAS", "Houston Rockets" => "HOU", "Atlanta Hawks" => "ATL", "Minnesota Timberwolves" => "MIN", "Boston Celtics" => "BOS", "Brooklyn Nets" => "BRK", "Los Angeles Lakers" => "LAL", "Utah Jazz" => "UTA", "San Antonio Spurs" => "SAS", "Charlotte Hornets" => "CHO", "Denver Nuggets" => "DEN", "Dallas Mavericks" => "DAL", "Indiana Pacers" => "IND", "Phoenix Suns" => "PHO", "Orlando Magic" => "ORL", "Detroit Pistons" => "DET", "Miami Heat" => "MIA", "Chicago Bulls" => "CHI", "New York Knicks" => "NYK", "Cleveland Cavaliers" => "CLE", "Memphis Grizzlies" => "MEM");
		$teams = array();
		$RkCount = 0;  // this will tell us that the data set is finished
		foreach ($fullData as $team)
		{
			if ($team[1] == "Rk" && $team[3] == "Team")
				$RkCount ++;
			$fullTeamName = str_replace("*", "", $team[1]);
			if ($RkCount <= 1)
			{
				if (array_key_exists($fullTeamName, $codes))
               			{
					$stats = new NBA_TeamData($codes[$fullTeamName], $team[2], $team[24], $team[10], $team[12], $team[7], $team[9], $team[13], $team[15],$team[17], $team[20], $team[21], $team[22], $team[23]);
					array_push ($teams, $stats);
				}
			}
		}
		// get today's games
		$sql = "select * from games where GameDate = '" . $GameDate . "' and league = 'NBA'; ";
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
					$awayGrade = Get_NBA_Grade($team);
					$awayScore = Get_NBA_Score($team);
					$awayTeamFound = 1;
				}
				if (trim($team->team) == trim($row["HomeTeam"]))
				{
					$homeTeam = $team;
					$homeGrade = Get_NBA_Grade($team);
					$homeScore = Get_NBA_Score($team);
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
