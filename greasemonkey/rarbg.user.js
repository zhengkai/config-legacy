// ==UserScript==
// @name         rarbg ad block
// @namespace    https://soulogic.com/
// @version      0.4
// @description  try to take over the world!
// @author       Zheng Kai
// @match        https://rarbgunblocked.org/*
// @match        https://rarbg.to/*
// @grant        none
// ==/UserScript==

(() => {
	'use strict';

	const ad = document.body.querySelector('td[align=justify] > div[align=center] > table');
	if (ad) {
		ad.remove();
	}

	const clear = () => {

		const a = document.querySelector('body > div:last-of-type');
		if (!a) {
			return;
		}

		const style = a.style;

		if (
			style.position === 'fixed'
			&& style.top === '0px'
			&& style.left === '0px'
			&& style.display !== 'none'
		) {

			style.display = 'none';
			style.width = '1px';
			style.height = '1px';
			a.innerHtml = '';
		}
	};

	window.setInterval(clear, 100);

})();
