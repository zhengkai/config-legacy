// ==UserScript==
// @name         rarbg ad block
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       Zheng Kai
// @match        https://rarbgunblocked.org/*
// @grant        none
// ==/UserScript==

(function() {
	'use strict';

	console.log('go work');

	const a = document.querySelector('body > div:last-of-type');

	if (a.id.length < 7 || a.style.display !== 'block') {
		return;
	}

	a.style.display = 'none';

})();
