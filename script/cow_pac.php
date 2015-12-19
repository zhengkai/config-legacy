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
//	if (url.match(new RegExp('^.*?://.*?(youku|qiyi|iqiyi|letv|sohu|ku6|ku6cdn|pps)\.(com|tv)/crossdomain\.xml$'))) {
//		return "PROXY api.youku.com:80";
//	}

	if (0
		|| shExpMatch(url, "http://alpha:48889/*")
	) {
		return "SOCKS5 192.168.1.212:55787";
	}

	if (0
		|| shExpMatch(url, "http://freya:48888/*")
	) {
		return "SOCKS5 192.168.1.212:55777";
	}

	if (0
		|| shExpMatch(url, "http://molly:38888/*")
	) {
		return "SOCKS5 192.168.1.212:55667";
	}

	if (0
		|| shExpMatch(url, "http://royal-local.socialgamenet.com*")
		|| shExpMatch(url, "http://royal-lan-*")
		|| shExpMatch(url, "https://royal-lan-*")
	) {
		return "SOCKS5 192.168.1.212:55667";
	}
EOD;

$s = str_replace($sFind, $sFind."\n\n".$sReplace."\n", $s);

file_put_contents('/www/lan/pac.txt', $s);
