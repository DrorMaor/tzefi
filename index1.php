<?php
	/*
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	*/

	if ($_SERVER['REQUEST_URI'] != "/" && $_SERVER['REQUEST_URI'] != "/index1.php")
        die();
?>

<html>
	<head>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-20157082-8"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());

			gtag('config', 'UA-20157082-8');
		</script>

		<title>Tzefi - Accurate Sports Predictions</title>
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
				tab += ">" + title.replaceAll("_", " ") + "</tab> ";
				$("#tabs").append(tab);
			}

			function SendComments() {
				$.ajax({
					type: "GET",
					url: "admin/SendComments.php?contact=" + $("#txtContact").val() + "&comments=" + $("#txtComments").val(),
					data: $(this).serialize(),
					dataType: 'text',
					success: function(response) {
						//$('#ContactThanks').show();
						$('#divContact').fadeOut(3333).promise().done(function() {
							//$('#ContactThanks').hide();
							$("#txtContact").val("");
							$("#txtComments").val("");
						});
					}
				});
			}
		</script>
	</head>

	<body>
		<table>	<tr>
			<td><img src="images/tzefi.png" /></td>
			<td>&nbsp;</td>
			<td>
				<div class="menu tools button" onclick="$('#divAbout').show();">About</div>
				<br>
				<div class="menu tools button" onclick="$('#divContact').show();">Contact</div>
			</td>
		</tr> </table>
		<br>
		
		<div class="heading" style="padding-top:7px;">
			Computerized <span style="background-color:#F0F0F0; padding:5px;">predictions</span> for
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
			// # of displayed tabs (divs)
			// (the first one by default will be shown, but the others are hidden unless clicked)
			$numDisplayedTabs = 0;
			include "DbConn.php";

			// NFL
			$WeekSQL = "select StartDate, EndDate, week from NFLweeks where StartDate <= curdate() order by week desc limit 1; ";
			$weeks = $conn->query($WeekSQL);
			$week = $weeks->fetch_assoc();
			$GamesSQL = "select g.*, away.name as AwayTeamName, home.name as HomeTeamName
				from games g
					inner join teams away on away.code = g.AwayTeam and away.league = 'NFL'
					inner join teams home on home.code = g.HomeTeam and home.league = 'NFL'
				where g.league = 'NFL' and g.GameType <> '--'
					and GameDate between '" . $week["StartDate"] . "' and '" . $week["EndDate"] . "'
				order by g.GameDate, g.id; ";
			drawGameHTML($conn, $GamesSQL, "NFL_Week_" . $week["week"]);

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
					echo "<script> appendTab('" . $title . "'); </script>";
					$GLOBALS['numDisplayedTabs'] ++ ;

					$counter = 0;
					$HTML = "<div class='tabContent' id='".$title."' ";
					if ($GLOBALS['numDisplayedTabs'] == 1)
						$HTML .= "style='display:inline;'";
					else
						$HTML .= "style='display:none;'";
					$HTML .= ">";
					$HTML .= "<table>";
					while ($game = $games->fetch_assoc())
					{
						if ($game["AwayScorePick"] > $game["HomeScorePick"])
						{
							$awayClass = "team winner";
							$homeClass = "team";
						}
						elseif ($game["HomeScorePick"] > $game["AwayScorePick"])
						{
							$homeClass = "team winner";
							$awayClass = "team";
						}
						else
						{
							$homeClass= "team";
							$awayClass= "team";
						}
						
						// start new TR row
						if ($counter % 4 == 0 && $counter > 0)
						{
							$counter = 0;
							$HTML .= "<tr> ";
						}
						
						// do special NFL styling
						$NFLStyle = "";
						if ($game["league"] == "NFL")
						{
							// if the game has finished, make it gray
							if ($game["GameDate"] < date("Y-m-d"))
								$NFLStyle = " background-color:#E0E0E0; ";
							// if it's today, have a thicker border
							elseif ($game["GameDate"] == date("Y-m-d"))
								$NFLStyle = " border: 2px gray solid; ";
							// plain box
							else
								$NFLStyle = "team";
						}
						$HTML .= "<td class='game' style='" . $NFLStyle."'>";
						$HTML .= "<table style='width:100%;'>";
						$HTML .= "<tr>";
						$HTML .= "	<td> <img class='logo' src='logos/".$game['league']."/".$game["AwayTeam"].".png'></td>";
						$HTML .= "	<td class='".$awayClass."'>".trim($game["AwayTeamName"])."</td>";
						$HTML .= "	<td>&nbsp;</td>";
						$HTML .= "	<td class='".$awayClass." score'>".$game["AwayScorePick"];
						$HTML .= "</tr>";
						$HTML .= "<tr>";
						$HTML .= "	<td> <img class='logo' src='logos/".$game['league']."/".$game["HomeTeam"].".png'></td>";
						$HTML .= "	<td class='".$homeClass."'>".trim($game["HomeTeamName"])."</td>";
						$HTML .= "	<td>&nbsp;</td>";
						$HTML .= "	<td class='".$homeClass." score'>".$game["HomeScorePick"]."</td>";
						$HTML .= "</tr>";
						$HTML .= "</table>";
						$HTML .= "</td>";
						if ($counter % 5 == 0 && $counter > 1)
							$HTML .= "</tr> ";
						$counter++;
					}
					$HTML .= "</table> </div>";
					echo $HTML;
					if ($GLOBALS['numDisplayedTabs'] == 1)
						echo "<script> $('#tab".$title."').addClass('activeTab'); </script> ";
				}
			}
		?>
		
		<div id="divContact" class="MenuDivs">
			<div class="PopupClose">
				<img src="images/close.png" class="tools" title="close" onclick="$('#divContact').hide();">
			</div>
			<h3>We'd love to hear from you</h3>
			Comments <br>
			<textarea id="txtComments" rows="8" cols="50"></textarea>
			<br><br>
			Contact <i>(email or WhatsApp)</i>
			<br>
			<input id="txtContact"> &nbsp;
			<span id="btnSendComments" onclick="SendComments();" class="menu tools PopupClose">Send</span>
		</div>

		<div id="divAbout" class="MenuDivs">
			<div class="PopupClose">
				<img src="images/close.png" class="tools" title="close" onclick="$('#divAbout').hide();">
			</div>
			<h3>Welcome to Tzefi.com, the website that provides you accurate sports predictions.</h3>
			<div style="line-height: 1.6;">
				Why is this site different than other sports predictions sites?
				</br>
				The Tzefi team believes that other sites err in what they boast, that they simulate the game 50,000 times before it's actually played.
				</br>
				They therefore feel that they come up with an extremely accurate prediction.
				</br>
				We say, <strong>wrong</strong>!
				</br>
				Players are not robots. Just because a player is batting .350, doesn't mean he won't strike out with the bases loaded.
				</br>
				And just because a quarterback has a 100+ passer rating, doesn't mean he won't throw an interception at a crucial time.
				</br>
				But if you simulate a game 50,000 times, the above scenarios will never occur.
				</br>
				So we believe that of course statistics must be analyzed, but a true prediction model must also take the human aspect into account.
				</br>
				This is why after we let the computer do its thing, us humans review the prediction, and tweak it if deemed necessary.
				</br>
				We are proud to offer very accurate sports predictions on <strong>Tzefi.com</strong>.
			</div>
		</div>

	</body>
</html>
