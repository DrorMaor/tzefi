
<?php

	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);


	include("../DbConn.php");
	Get_MLB_Picks($conn);

	class MLB_TeamData {
		public $team;

		// batting stats
		public $b_RSPG;
		public $b_PA;
		public $b_AB;
		public $b_R;
		public $b_H;
		public $b_DBL;
		public $b_TRPL;
		public $b_HR;
		public $b_RBI;
		public $b_SB;
		public $b_CS;
		public $b_BB;
		public $b_SO;
		public $b_BA;
		public $b_OBP;
		public $b_SLG;
		public $b_OPS;
		public $b_OPSP;
		public $b_TB;
		public $b_GDP;
		public $b_HBP;
		public $b_SH;
		public $b_SF;
		public $b_IBB;
		public $b_LOB;

		// pitching stats
		public $p_RGPG;
		public $p_W;
		public $p_L;
		public $p_WLP;
		public $p_ERA;
		public $p_G;
		public $p_GS;
		public $p_GF;
		public $p_CG;
		public $p_tSho;
		public $p_cSho;
		public $p_SV;
		public $p_IP;
		public $p_H;
		public $p_R;
		public $p_ER;
		public $p_HR;
		public $p_BB;
		public $p_IBB;
		public $p_SO;
		public $p_HBP;
		public $p_BK;
		public $p_WP;
		public $p_BF;
		public $p_ERAP;
		public $p_FIP;
		public $p_WHIP;
		public $p_H9;
		public $p_HR9;
		public $p_BB9;
		public $p_SO9;
		public $p_SOW;
		public $p_LOB;

		function __construct ($team, $b_RSPG, $b_PA, $b_AB, $b_R, $b_H, $b_DBL, $b_TRPL, $b_HR, $b_RBI, $b_SB, $b_CS, $b_BB, $b_SO, $b_BA, $b_OBP, $b_SLG, $b_OPS, $b_OPSP, $b_TB, $b_GDP, $b_HBP, $b_SH, $b_SF, $b_IBB, $b_LOB, $p_RGPG, $p_W, $p_L, $p_WLP, $p_ERA, $p_G, $p_GS, $p_GF, $p_CG, $p_tSho, $p_cSho, $p_SV, $p_IP, $p_H, $p_R, $p_ER, $p_HR, $p_BB, $p_IBB, $p_SO, $p_HBP, $p_BK, $p_WP, $p_BF, $p_ERAP, $p_FIP, $p_WHIP, $p_H9, $p_HR9, $p_BB9, $p_SO9, $p_SOW, $p_LOB)
		{
			$this->team = $team;
			// batting stats
			$this->b_RSPG = $b_RSPG;
			$this->b_PA = $b_PA;
			$this->b_AB = $b_AB;
			$this->b_R = $b_R;
			$this->b_H = $b_H;
			$this->b_DBL = $b_DBL;
			$this->b_TRPL = $b_TRPL;
			$this->b_HR = $b_HR;
			$this->b_RBI = $b_RBI;
			$this->b_SB = $b_SB;
			$this->b_CS = $b_CS;
			$this->b_BB = $b_BB;
			$this->b_SO = $b_SO;
			$this->b_BA = $b_BA;
			$this->b_OBP = $b_OBP;
			$this->b_SLG = $b_SLG;
			$this->b_OPS = $b_OPS;
			$this->b_OPSP = $b_OPSP;
			$this->b_TB = $b_TB;
			$this->b_GDP = $b_GDP;
			$this->b_HBP = $b_HBP;
			$this->b_SH = $b_SH;
			$this->b_SF = $b_SF;
			$this->b_IBB = $b_IBB;
			$this->b_LOB = $b_LOB;

			// pitching stats
			$this->p_RGPG = $p_RGPG;
			$this->p_W = $p_W;
			$this->p_L = $p_L;
			$this->p_WLP = $p_WLP;
			$this->p_ERA = $p_ERA;
			$this->p_G = $p_G;
			$this->p_GS = $p_GS;
			$this->p_GF = $p_GF;
			$this->p_CG = $p_CG;
			$this->p_tSho = $p_tSho;
			$this->p_cSho = $p_cSho;
			$this->p_SV = $p_SV;
			$this->p_IP = $p_IP;
			$this->p_H = $p_H;
			$this->p_R = $p_R;
			$this->p_ER = $p_ER;
			$this->p_HR = $p_HR;
			$this->p_BB = $p_BB;
			$this->p_IBB = $p_IBB;
			$this->p_SO = $p_SO;
			$this->p_HBP = $p_HBP;
			$this->p_BK = $p_BK;
			$this->p_WP = $p_WP;
			$this->p_BF = $p_BF;
			$this->p_ERAP = $p_ERAP;
			$this->p_FIP = $p_FIP;
			$this->p_WHIP = $p_WHIP;
			$this->p_H9 = $p_H9;
			$this->p_HR9 = $p_HR9;
			$this->p_BB9 = $p_BB9;
			$this->p_SO9 = $p_SO9;
			$this->p_SOW = $p_SOW;
			$this->p_LOB = $p_LOB;
		}
	}

	function Get_MLB_Grade($team)
	{
		// batting
		$grade =  ($team->b_RSPG * 100);
		$grade += ($team->b_R);
		$grade += ($team->b_H);
		$grade += ($team->b_DBL * 10);
		$grade += ($team->b_TRPL * 20);
		$grade += ($team->b_HR * 50);
		$grade += ($team->b_RBI);
		$grade += ($team->b_SB * 10);
		$grade -= ($team->b_CS * 10);
		$grade += $team->b_BB;
		$grade -= $team->b_SO;
		$grade += ($team->b_BA * 1000);
		$grade += ($team->b_OBP * 1000);
		$grade += ($team->b_SLG * 1000);
		$grade += ($team->b_TB);
		$grade -= ($team->b_GDP * 25);
		$grade += ($team->b_HBP * 10);
		$grade += ($team->b_SH * 10);
		$grade += ($team->b_SF * 10);
		$grade += ($team->b_IBB * 10);
		$grade -= $team->b_LOB;

		// pitching
		$grade -= ($team->p_RGPG * 100);
		$grade += ($team->p_W * 20);
		$grade -= ($team->p_L * 20);
		$grade += ((1.00 - $team->p_ERA) * 100);
		$grade += ($team->p_CG * 20);
		$grade += ($team->p_tSho * 50);
		$grade += ($team->p_cSho * 75);
		$grade += ($team->p_SV * 10);
		$grade -= ($team->p_H);
		$grade -= ($team->p_R);
		$grade -= ($team->p_HR * 50);
		$grade -= $team->p_BB;
		$grade -= $team->p_IBB;
		$grade += $team->p_SO;
		$grade -= ($team->p_HBP * 5);
		$grade -= ($team->p_BK * 10);
		$grade -= ($team->p_WP * 10);
		$grade -= ($team->p_FIP * 100);
		$grade -= ($team->p_WHIP * 100);
		$grade += $team->p_LOB;

		return ceil($grade);
	}

	function Get_MLB_Score ($team)
	{
		$runFactor = (rand(0, 1) == 0) ? 8 : 7;
		$runs = ceil($team->b_RSPG + rand(0, $runFactor) * $team->p_WLP);
		$runs += ceil(rand(-$runFactor, 0) * (1.00 - $team->p_WLP) );
		if ($runs < 0)
			$runs = 0;
		return $runs;
	}

	function getData($url) 
	{
		$html = file_get_contents($url);
		$start = strpos($html, '<tbody>');
		$end = strpos($html, '</tbody');
		$all = substr($html, $start, $end - $start);
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
		case 'Arizona Diamondbacks': $code = 'ARI'; break;
		case 'Atlanta Braves': $code = 'ATL'; break;
		case 'Baltimore Orioles': $code = 'BAL'; break;
		case 'Boston Red Sox': $code = 'BOS'; break;
		case 'Chicago Cubs': $code = 'CHC'; break;
		case 'Chicago White Sox': $code = 'CHW'; break;
		case 'Cincinnati Reds': $code = 'CIN'; break;
		case 'Cleveland Indians': $code = 'CLE'; break;
		case 'Colorado Rockies': $code = 'COL'; break;
		case 'Detroit Tigers': $code = 'DET'; break;
		case 'Houston Astros': $code = 'HOU'; break;
		case 'Kansas City Royals': $code = 'KCR'; break;
		case 'Los Angeles Angels': $code = 'LAA'; break;
		case 'Los Angeles Dodgers': $code = 'LAD'; break;
		case 'Miami Marlins': $code = 'MIA'; break;
		case 'Milwaukee Brewers': $code = 'MIL'; break;
		case 'Minnesota Twins': $code = 'MIN'; break;
		case 'New York Mets': $code = 'NYM'; break;
		case 'New York Yankees': $code = 'NYY'; break;
		case 'Oakland Athletics': $code = 'OAK'; break;
		case 'Philadelphia Phillies': $code = 'PHI'; break;
		case 'Pittsburgh Pirates': $code = 'PIT'; break;
		case 'San Diego Padres': $code = 'SDP'; break;
		case 'Seattle Mariners': $code = 'SEA'; break;
		case 'San Francisco Giants': $code = 'SFG'; break;
		case 'St. Louis Cardinals': $code = 'STL'; break;
		case 'Tampa Bay Rays': $code = 'TBR'; break;
		case 'Texas Rangers': $code = 'TEX'; break;
		case 'Toronto Blue Jays': $code = 'TOR'; break;
		case 'Washington Nationals': $code = 'WSN'; break;
	}
	return $code;
}

function Get_MLB_Picks($conn)
{
	$GameDate = date("Y-m-d");
	if (isset($_POST['submitMLBpicks']))
		$GameDate = $_POST["PickDate"];

	// get stats of all teams
	$batting = getData('https://www.baseball-reference.com/leagues/majors/' . date('Y') . '-standard-batting.shtml');
	$pitching = getData('https://www.baseball-reference.com/leagues/majors/' . date('Y') . '-standard-pitching.shtml');
	$teams = [];

	for ($i=0; $i<count($batting); $i++)
	{
		$team = new MLB_TeamData("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
		$team->team = getTeamCode($batting[$i][0]);
		$team->b_RSPG = $batting[$i][3];
		$team->b_PA = $batting[$i][5];
		$team->b_AB = $batting[$i][6];
		$team->b_R = $batting[$i][7];
		$team->b_H = $batting[$i][8];
		$team->b_DBL = $batting[$i][9];
		$team->b_TRPL = $batting[$i][10];
		$team->b_HR = $batting[$i][11];
		$team->b_RBI = $batting[$i][12];
		$team->b_SB = $batting[$i][13];
		$team->b_CS = $batting[$i][14];
		$team->b_BB = $batting[$i][15];
		$team->b_SO = $batting[$i][16];
		$team->b_BA = $batting[$i][17];
		$team->b_OBP = $batting[$i][18];
		$team->b_SLG = $batting[$i][19];
		$team->b_OPS = $batting[$i][20];
		$team->b_OPSP = $batting[$i][21];
		$team->b_TB = $batting[$i][22];
		$team->b_GDP = $batting[$i][23];
		$team->b_HBP = $batting[$i][24];
		$team->b_SH = $batting[$i][25];
		$team->b_SF = $batting[$i][26];
		$team->b_IBB = $batting[$i][27];
		$team->b_LOB = $batting[$i][28];

		// pitching
		$team->p_RGPG = $pitching[$i][3];
		$team->p_W = $pitching[$i][4];
		$team->p_L = $pitching[$i][5];
		$team->p_WLP = $pitching[$i][6];
		$team->p_ERA = $pitching[$i][7];
		$team->p_G = $pitching[$i][8];
		$team->p_GS = $pitching[$i][9];
		$team->p_GF = $pitching[$i][10];
		$team->p_CG = $pitching[$i][11];
		$team->p_tSho = $pitching[$i][12];
		$team->p_cSho = $pitching[$i][13];
		$team->p_SV = $pitching[$i][14];
		$team->p_IP = $pitching[$i][15];
		$team->p_H = $pitching[$i][16];
		$team->p_R = $pitching[$i][17];
		$team->p_ER = $pitching[$i][18];
		$team->p_HR = $pitching[$i][19];
		$team->p_BB = $pitching[$i][20];
		$team->p_IBB = $pitching[$i][21];
		$team->p_SO = $pitching[$i][22];
		$team->p_HBP = $pitching[$i][23];
		$team->p_BK = $pitching[$i][24];
		$team->p_WP = $pitching[$i][25];
		$team->p_BF = $pitching[$i][26];
		$team->p_ERAP = $pitching[$i][27];
		$team->p_FIP = $pitching[$i][28];
		$team->p_WHIP = $pitching[$i][29];
		$team->p_H9 = $pitching[$i][30];
		$team->p_HR9 = $pitching[$i][31];
		$team->p_BB9 = $pitching[$i][32];
		$team->p_SO9 = $pitching[$i][33];
		$team->p_SOW = $pitching[$i][34];
		$team->p_LOB = $pitching[$i][35];

		array_push ($teams, $team);
	}

	// get the date's scheduled GAMES
	$sql = "select id, GameDate, AwayTeam, HomeTeam from games where GameDate = '" . $GameDate . "' and league = 'MLB'; ";
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
					$awayGrade = Get_MLB_Grade($team);
					$awayScore = Get_MLB_Score($team);
					$awayTeamFound = 1;
			}
			if (trim($team->team) == trim($row["HomeTeam"]))
			{
					$homeTeam = $team;
					$homeGrade = Get_MLB_Grade($team);
					$homeScore = Get_MLB_Score($team);
					$homeTeamFound = 1;
			}
			if ($awayTeamFound == 1 && $homeTeamFound == 1)
			{
					// away team won (higher grade), but they have less runs in rand()
					if ($awayGrade > $homeGrade && $awayScore < $homeScore)
					{
							// final score should be the actual RSPG
							$awayScore = ceil($awayTeam->b_RSPG);
							$homeScore = floor($homeTeam->b_RSPG);
					}
					if ($awayGrade < $homeGrade && $awayScore > $homeScore)
					{
							$awayScore = floor($awayTeam->b_RSPG);
							$homeScore = ceil($homeTeam->b_RSPG);
					}

					// tie breaker
					if ($awayScore == $homeScore)
					{
							// how many extra runs
							$extraRuns = rand(1, 2);
							// who won?
							if (rand(0, 1) == 1)
									$awayScore += $extraRuns;
							else
									$homeScore += $extraRuns;
					}
			}
		}
		$sql = " update games set AwayScorePick = " . $awayScore . ", HomeScorePick = " . $homeScore;
		$sql.= " where id = " . $row["id"] ;
		$sql.= " and AwayScorePick is null and HomeScorePick is null ;  ";
		$update_multi_sql .= $sql;
	}
	$conn->multi_query($update_multi_sql);
	/*
	if (isset($_POST['submitMLBpicks']))
	{
		echo "These have been updated:</br>";
		echo str_replace(';', ';</br>', $update_multi_sql);
	}
	*/
	$conn->close();
}
?>
