<?php

	 ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

	class NFL_TeamData
	{
		public $team;
		public $G;	// games played

		// offense stats
		public $o_P;	// points (3)
		public $o_Y;	// total yards (4)
		public $o_TO;	// turnovers (7)
		public $o_FD;	// first downs (9)
		public $o_CMP;	// complete passes (10)
		public $o_PTD;	// passing TDs (13)
		public $o_RTD;	// rushing TDs (19)
		public $o_PY;	// penalty yards (23)

		// defense stats
		public $d_P;	// points (3)
		public $d_Y;	// total yards (4)
		public $d_TO;	// turnovers (7)
		public $d_FD;	// first downs (9)
		public $d_CMP;	// complete passes (10)
		public $d_PTD;	// passing TDs (13)
		public $d_RTD;	// rushing TDs (19)
		public $d_PY;	// penalty yards (23)

		function __construct ($team, $G, $o_P, $o_Y, $o_TO, $o_FD, $o_CMP, $o_PTD, $o_RTD, $o_PY, $d_P, $d_Y, $d_TO, $d_FD, $d_CMP, $d_PTD, $d_RTD, $d_PY)
		{
			$this->team = $team;
			$this->G = $G;

			// offense stats
			$this->o_P = $o_P;
			$this->o_Y = $o_Y;
			$this->o_TO = $o_TO;
			$this->o_FD = $o_FD;
			$this->o_CMP = $o_CMP;
			$this->o_PTD = $o_PTD;
			$this->o_RTD = $o_RTD;
			$this->o_PY = $o_PY;

			// defense stats
			$this->d_P = $d_P;
			$this->d_Y = $d_Y;
			$this->d_TO = $d_TO;
			$this->d_FD = $d_FD;
			$this->d_CMP = $d_CMP;
			$this->d_PTD = $d_PTD;
			$this->d_RTD = $d_RTD;
			$this->d_PY = $d_PY;
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

	function getTeamCode($team)
	{
		$code = "";
		switch ($team)
		{
			case 'Los Angeles Rams': $code = 'LAR'; break;
			case 'Baltimore Ravens': $code = 'BAL'; break;
			case 'Pittsburgh Steelers': $code = 'PIT'; break;
			case 'Washington Football Team': $code = 'WAS'; break;
			case 'New Orleans Saints': $code = 'NOR'; break;
			case 'Miami Dolphins': $code = 'MIA'; break;
			case 'New England Patriots': $code = 'NWE'; break;
			case 'Tampa Bay Buccaneers': $code = 'TAM'; break;
			case 'New York Giants': $code = 'NYG'; break;
			case 'Indianapolis Colts': $code = 'IND'; break;
			case 'Kansas City Chiefs': $code = 'KAN'; break;
			case 'Arizona Cardinals': $code = 'ARI'; break;
			case 'Green Bay Packers': $code = 'GNB'; break;
			case 'Chicago Bears': $code = 'CHI'; break;
			case 'Seattle Seahawks': $code = 'SEA'; break;
			case 'Buffalo Bills': $code = 'BUF'; break;
			case 'San Francisco 49ers': $code = 'SFO'; break;
			case 'Carolina Panthers': $code = 'CAR'; break;
			case 'Atlanta Falcons': $code = 'ATL'; break;
			case 'Philadelphia Eagles': $code = 'PHI'; break;
			case 'Cleveland Browns': $code = 'CLE'; break;
			case 'Cincinnati Bengals': $code = 'CIN'; break;
			case 'Los Angeles Chargers': $code = 'LAC'; break;
			case 'Tennessee Titans': $code = 'TEN'; break;
			case 'Denver Broncos': $code = 'DEN'; break;
			case 'New York Jets': $code = 'NYJ'; break;
			case 'Houston Texans': $code = 'HOU'; break;
			case 'Dallas Cowboys': $code = 'DAL'; break;
			case 'Minnesota Vikings': $code = 'MIN'; break;
			case 'Las Vegas Raiders': $code = 'LVG'; break;
			case 'Jacksonville Jaguars': $code = 'JAX'; break;
			case 'Detroit Lions': $code = 'DET'; break;
		}
		return $code;
	}

	function Get_NFL_Stats() 
	{
		$offense = getData("https://www.pro-football-reference.com/years/2020/", "Tot Yds &amp; TO", "League Total");
		$defense = getData("https://www.pro-football-reference.com/years/2020/opp.htm", "Team Defense", "Team Advanced Defense");
		$teams = [];

		for ($i=0; $i<count($offense); $i++)
        	{
			$team = new NFL_TeamData("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
			$team->team = getTeamCode($offense[$i][1]);
			$team->G = $offense[$i][2];

			// offensive stats
			$team->o_P = $offense[$i][3];
			$team->o_Y = $offense[$i][4];
			$team->o_TO = $offense[$i][7];
			$team->o_FD = $offense[$i][9];
			$team->o_CMP = $offense[$i][10];
			$team->o_PTD = $offense[$i][13];
			$team->o_RTD = $offense[$i][19];
			$team->o_PY = $offense[$i][23];

			// defense stats
			$team->d_P = $defense[$i][3];
			$team->d_Y = $defense[$i][4];
			$team->d_TO = $defense[$i][7];
			$team->d_FD = $defense[$i][9];
			$team->d_CMP = $defense[$i][10];
			$team->d_PTD = $defense[$i][13];
			$team->d_RTD = $defense[$i][19];
			$team->d_PY = $defense[$i][23];

			array_push($teams, $team);
		}
		return $teams;
	}

	function Get_NFL_Grade($team)
	{
		// offense
		$grade = $team->o_P * 10;
		$grade += $team->o_Y;
		$grade -= ($team->o_TO * 5);
		$grade += ($team->o_FD * 2.5);
		$grade += ($team->o_CMP * 2);
		$grade += ($team->o_PTD * 7);
		$grade += ($team->o_RTD * 7);
		$grade -= $team->o_PY;

		// defense
		$grade -= $team->d_P * 10;
		$grade -= $team->d_Y;
		$grade += ($team->d_TO * 5);
		$grade -= ($team->d_FD * 2.5);
		$grade -= ($team->d_CMP * 2);
		$grade -= ($team->d_PTD * 7);
		$grade -= ($team->d_RTD * 7);
		$grade += $team->d_PY;

		return ceil($grade);
	}

	function Get_NFL_Score ($team, $grade)
	{
		$score = $team->o_P / $team->G;
		if ($grade >=0)
			$score = (rand(85, 125) / 100) * $score;
		else
			$score = (rand(65, 105) / 100) * $score;
		$score = ceil($score);
		// take care of "unusual/irregular" scores
		if ($score >=50)
			$score = 49;
		switch ($score)
		{
			case 1:
			case 2:
				$score = 0;
				break;
			case 4:
			case 5:
				$score = 3;
				break;
		}
		return $score;
	}

	// get stats of all teams
	$teams = Get_NFL_Stats();

	// get this week's games
	include ("../DbConn.php");
	$sql = "
		select g.id, AwayTeam.code AwayTeam, HomeTeam.code HomeTeam from games g 
			inner join NFLweeks w 
				on (g.GameDate >= w.StartDate and g.GameDate <= w.EndDate) 
			inner join (select league, code from teams) AwayTeam 
				on AwayTeam.code = g.AwayTeam
			inner join (select league, code from teams) HomeTeam 
				on HomeTeam.code = g.HomeTeam
		where g.league = 'NFL' and AwayTeam.league = 'NFL' and HomeTeam.league = 'NFL'
			and w.week = ".$_GET["week"].";  ";
	$results = $conn->query($sql);

	$update_multi_sql = "";
	while ($row = $results->fetch_assoc())
	{
		$awayScore = -1;
		$homeScore = -1;
		foreach ($teams as $team)
		{
			if (trim($team->team) == trim($row["AwayTeam"]))
			{
				$awayGrade = Get_NFL_Grade($team);
				$awayScore = Get_NFL_Score($team, $awayGrade);
			}
			if (trim($team->team) == trim($row["HomeTeam"]))
			{
				$homeGrade = Get_NFL_Grade($team);
				$homeScore = Get_NFL_Score($team, $homeGrade);
			}
			if ($awayScore >=0 && $homeScore >=0)
			{
				// give an advantage to the stronger team
				if ($awayGrade > $homeGrade)
				{
					$awayScore += rand(0,7);
					$homeScore -= rand(0,7);
				}
				else
				{
					$homeScore += rand(0,7);
					$awayScore -= rand(0,7);
				}
				if ($awayScore < 0)
					$awayScore = 3;
				if ($homeScore < 0)
					$homeScore = 3;
				// don't have tie games (very rare)
				if ($awayScore == $homeScore)
				{
					if ($awayGrade > $homeGrade)
						$awayScore += rand(1,3);
					else
						$homeScore += rand(1,3);
				}
				$sql = " update games set AwayScore = " . $awayScore . ", HomeScore = " . $homeScore;
				$sql.= " where id = ".$row['id'];
				$sql.= " and AwayScore is null and HomeScore is null ;  ";
				$update_multi_sql .= $sql;
				break;
			}
		}
	}
	$conn->multi_query($update_multi_sql);
	echo "These NFL games have been updated:</br>";
	echo str_replace(';', ';</br>', $update_multi_sql);
	$conn->close();
?>

