<?php
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);


	$fullData = getData('https://www.baseball-reference.com/leagues/majors/2021-standard-pitching.shtml');
	//print_r($fullData);
	foreach ($fullData as $arr) {
		print_r($arr);
		echo "<br>";
	}

	function getData($url) {
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
?>
