<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

	if ($_SERVER['REQUEST_URI'] != "/" && $_SERVER['REQUEST_URI'] != "/index1.php")
        	die();
?>

<html>
	<head>

		<title>Tzefi - Accurate Predictions</title>
		<link rel="shortcut icon" href="favicon.ico" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="styles.css">

		<!-- make responsive -->
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
		<script>
			function appendTab(title) {
			        var tab = "<tab id='tab" + title + "' class='tabs heading' ";
			        tab += "onclick='$(\".tabs\").removeClass(\"activeTab\"); ";
			        tab += "$(\"#tab" + title + "\").addClass(\"activeTab\"); ";
			        tab += "$(\".tabContent\").hide(); $(\"#" + title + "\").fadeIn(200);' ";
			        tab += ">" + title + "</tab> ";
			        $("#tabs").append(tab);
			}
		</script>
	</head>
	<body>
		<?php
			include "DbConn.php";
			$http_referer = ( isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '' );
			$traffic = "insert into traffic (IP, referer, URL) values ('". $_SERVER['REMOTE_ADDR'] . "', '" . $http_referer . "', '" . $_SERVER['REQUEST_URI'] . "');";
			$conn->query($traffic);
		?>
		<img src="images/tzefi.png" />
		<br>
		<div class="heading" style="padding-top:7px;">
			Computerized <span style="border:2px solid #0F1C46; border-radius:3px; padding:3px;">predictions</span> for
			<?php
				$NYdate = new DateTime("now", new DateTimeZone('America/New_York') );
				echo $NYdate->format("l, F jS, Y");
			?>
			<div style="font-size:12px; font-style: italic; padding-top:5px;">
				Disclaimer: This site is for informational use only. Our algorithms are not prophetic. Be careful if investing financially.
			</div>
		</div>
		<br>
		<div id="tabs"></div>
		<br>
		<div>&nbsp;</div>
		<br>
<?php
	// # of displayed divs
	// (the first one by default will be shown, but the others are hidden unless clicked)
	$numDisplayedDivs = 0;

	// NFL
	$WeekSQL = "select StartDate, EndDate, week from NFLweeks where curdate() between StartDate and EndDate; ";
	$weeks = $conn->query($WeekSQL);
	$week = $weeks->fetch_assoc();
	$GamesSQL = "select g.*, away.name as AwayTeamName, home.name as HomeTeamName
		from games g
			inner join teams away on away.code = g.AwayTeam and away.league = 'NFL'
			inner join teams home on home.code = g.HomeTeam and home.league = 'NFL'
		where g.league = 'NFL' and g.GameType <> '--'
			and GameDate between '" . $week["StartDate"] . "' and '" . $week["EndDate"] . "'
		order by g.GameDate, g.id	; ";
	drawGameHTML($conn, $GamesSQL, "NFL Week " . $week["week"]);

	// other leagues (with standard daily schedule)
	//$leagues = array("MLB", "NBA", "NHL");
	$leagues = array("MLB");
	foreach ($leagues as $league)
	{
		$GamesSQL = "select g.*, away.name as AwayTeamName, home.name as HomeTeamName
			from games g
				inner join teams away on away.code = g.AwayTeam and away.league = '$league'
				inner join teams home on home.code = g.HomeTeam and home.league = '$league'
			where g.GameDate = curdate() and g.GameType not in ('CV', '--') and g.league = '$league'; ";
		drawGameHTML($conn, $GamesSQL, $league);
	}

	$conn->close();



	// ----------------------- //



	function drawGameHTML($conn, $GamesSQL, $title)
	{
		$games = $conn->query($GamesSQL);
		if ($games->num_rows > 0)
		{
			echo "<script> appendTab('".$title."'); </script>";
			$GLOBALS['numDisplayedDivs'] ++ ;

			$counter = 0;
			$HTML = "<div class='tabContent' id='".$title."' ";
			if ($GLOBALS['numDisplayedDivs'] == 1)
				$HTML.="style='display:inline;'";
			else
				$HTML.="style='display:none;'";
			$HTML.=">";

			$HTML .= "<table>";
			while ($game = $games->fetch_assoc())
			{
				if ($game["AwayScore"] > $game["HomeScore"])
				{
					$awayClass = "team winner";
					$homeClass = "team";
				}
				elseif ($game["HomeScore"] > $game["AwayScore"])
				{
					$homeClass = "team winner";
					$awayClass = "team";
				}
				else
				{
					$homeClass= "team";
					$awayClass= "team";
				}

				if ($counter % 4 == 0 && $counter > 0)
				{
					$counter = 0;
					$HTML .= "<tr> ";
				}
				$GameOverStyle = "";
				if ($game["league"] == "NFL")
					$GameOverStyle = " background-color:#dbdbdb;";
				$GameTodayStyle = "";
				if ($game["league"] == "NFL" && $game["GameDate"] == date("Y-m-d"))
					$GameTodayStyle = " border: 2px gray solid;";
				$HTML .= "<td class='game' style='" . $GameOverStyle . $GameTodayStyle."'>";
				$HTML .= "<table style='width:100%;'>";
				$HTML .= "<tr>";
				$HTML .= "	<td> <img class='logo' src='logos/".$game['league']."/".$game["AwayTeam"].".png'></td>";
				$HTML .= "	<td class='".$awayClass."'>".trim($game["AwayTeamName"])."</td>";
				$HTML .= "	<td>&nbsp;</td>";
				$HTML .= "	<td class='".$awayClass." score'>".$game["AwayScore"];
				$HTML .= "</tr>";
				$HTML .= "<tr>";
				$HTML .= "	<td> <img class='logo' src='logos/".$game['league']."/".$game["HomeTeam"].".png'></td>";
				$HTML .= "	<td class='".$homeClass."'>".trim($game["HomeTeamName"])."</td>";
				$HTML .= "	<td>&nbsp;</td>";
				$HTML .= "	<td class='".$homeClass." score'>".$game["HomeScore"]."</td>";
				$HTML .= "</tr>";
				$HTML .= "</table>";
				$HTML .= "</td>";
				if ($counter % 5 == 0 && $counter > 1)
					$HTML .= "</tr> ";
				$counter++;
			}
			$HTML .= "</table> </div>";
			echo $HTML;
			if ($GLOBALS['numDisplayedDivs'] == 1)
				echo "<script> $('#tab".$title."').addClass('activeTab'); </script> ";
		}
	}
?>
	</body>
</html>
