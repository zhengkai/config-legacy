#!/usr/bin/env php
<?php
$sURL = array_pop($argv);

if (!preg_match("/^http\\:\\/\\//", $sURL)) {
	echo "no url";
	exit;
}

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $sURL);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS5);
curl_setopt($ch, CURLOPT_PROXY, "127.0.0.1");
curl_setopt($ch, CURLOPT_PROXYPORT, 55777);
$sReturn = curl_exec($ch);
curl_close($ch);

$aMatch = array();
if (!preg_match('/magnet\:\?.*?\"/', $sReturn, $aMatch)) {
	echo "no magnets link found";
	exit;
}

$sMagnet = array_shift($aMatch);

// $magnetlink = "magnet:?xt=urn:btih:8c894e938b922306cedb7cd990e2393813a40bae&dn=AnyDVD+%26amp%3B+AnyDVD+HD+v7.0.4.0+FINAL+%2B+Key+%5BChattChitto+RG%5D&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80&tr=udp%3A%2F%2Ftracker.ccc.de%3A80";

$sFile = "d10:magnet-uri".strlen($sMagnet).":$sMagnet"."e";

$sFileTpl = "/home/zhengkai/rtorrent/watch/temp_%d.torrent";

foreach (range(1, 100) as $i) {
	$sFileName = sprintf("/home/zhengkai/rtorrent/watch/temp_%02d.torrent", $i);
	if (file_exists($sFileName)) {
		continue;
	}
	file_put_contents($sFileName, $sFile);
	break;
}

echo "\n";
echo $sFile;
echo "\n";
echo "end";

