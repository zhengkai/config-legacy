#! /usr/bin/env php
<?php

// 修改 cow  的 pac 文件，添加 优酷去广告插件 的规则
// https://chrome.google.com/webstore/detail/peddmpbdeelbhgfjnmlkfgeddigonncm

$s = @file_get_contents('http://192.168.1.212:7777/pac');
if (!$s) {
	exit;
}

$sFind = 'function FindProxyForURL(url, host) {';

$sReplace = <<<'EOD'
	if (url.match(new RegExp('^.*?://.*?(youku|qiyi|iqiyi|letv|sohu|ku6|ku6cdn|pps)\.(com|tv)/crossdomain\.xml$'))) {
		return "PROXY api.youku.com:80";
	}
EOD;

$s = str_replace($sFind, $sFind."\n\n".$sReplace."\n", $s);

file_put_contents('/www/null/pac.txt', $s);
