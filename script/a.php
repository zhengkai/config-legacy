#!/usr/bin/env php
<?php
function hex2bin($s) {
	return pack("H*", $s);
}

function color($sControl = "0") {
	return hex2bin("1b").'['.$sControl.'m';
}

function fg($iColor) {
	return color("38;5;".$iColor);
}

function bg($iColor) {
	return color("48;5;".$iColor);
}

echo fg(16).bg(155)." color test ".color()."\n";

while ($sLine = fgets(STDIN)) {
	echo "> ".$sLine;
}

