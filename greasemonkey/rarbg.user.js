// ==UserScript==
// @name         rarbg ad block
// @namespace    https://soulogic.com/
// @version      0.2
// @description  try to take over the world!
// @author       Zheng Kai
// @match        https://rarbgunblocked.org/*
// @grant        none
// ==/UserScript==

(() => {
	'use strict';

	document.body.querySelector('td[align=justify] > div[align=center] > table').remove();

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

			a.style.display = 'none';
			console.log('ad cleared');
			return;
		}

		window.setTimeout(clear, 100);
	};

	clear();

})();
