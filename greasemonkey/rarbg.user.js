// ==UserScript==
// @name         rarbg ad block
// @namespace    https://soulogic.com/
// @version      0.6
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

	let clearCount = 0;

	let t;

	const clear = () => {

		if (document.hidden) {
			return;
		}

		const a = document.querySelector('body > div:last-of-type');
		if (!a) {
			return;
		}

		a.innerHtml = '';

		const style = a.style;
		style.display = 'none';
		style.width = '1px';
		style.height = '1px';

		document.body.querySelectorAll('a, input').forEach((dom) => {
			dom.outerHTML = dom.outerHTML;
		});

		clearCount++;
		if (clearCount > 20) {
			window.clearTimeout(t);
			console.log('clear end');
		}
	};

	clear();
	t = window.setInterval(clear, 100);

})();
