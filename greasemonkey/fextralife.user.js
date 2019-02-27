// ==UserScript==
// @name         fextralife.com 去直播
// @namespace    https://soulogic.com/
// @version      0.1
// @description  try to take over the world!
// @author       Zheng Kai
// @match        https://*.fextralife.com/*
// @grant        none
// ==/UserScript==
//
(() => {

	const x = document.getElementById('menu-add-a');
	if (x) {
		x.innerHTML = '';
	}
})();
