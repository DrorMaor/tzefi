<?php
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);


	//$fullData = getData('https://www.baseball-reference.com/leagues/majors/2021-standard-pitching.shtml');
	$fullData = getData('https://www.pro-football-reference.com/years/2020/opp.htm');
	//print_r($fullData);
	foreach ($fullData as $arr) {
		print_r($arr);
		echo "<br>";
	}

	function getData($url) {
		$html = file_get_contents($url);
		$start = strpos($html, 'Team Defense');
		$end = strpos($html, 'Team Advanced Defense', $start);
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
?>
