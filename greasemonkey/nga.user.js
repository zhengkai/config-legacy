// ==UserScript==
// @name         NGA 去广告
// @namespace    http://soulogic.com/
// @version      0.1
// @description  try to take over the world!
// @author       Zheng Kai
// @match        http://bbs.nga.cn/*
// @grant        none
// ==/UserScript==

(() => {

	document.getElementById('mainmenu').style.margin = '0';
	document.getElementById('toptopics').style.display = 'none';
	document.getElementById('bbs_ads9_add').style.display = 'none';

	const clearAD = () => {
		const list = document.body.querySelectorAll('img');
		for (const img of list) {
			if (img.src.match('ngabbs/nga_classic/admark\.png')) {
				img.parentNode.parentNode.remove());
				continue;
			}
		}
	}

	clearAD();
	window.setTimeout(() => {
		__COOKIE.setMiscCookieInSecond('pv_count_for_insad', -300);
		clearAD();
	}, 3000);

})();
