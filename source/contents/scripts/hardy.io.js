function toggleNav(e) {
	var n = document.querySelector('.mn');
	n.className = /\sshow/.test(n.className)?n.className.replace(/\sshow/,''):n.className + ' show';
	e.preventDefault();
	e.stopPropagation();
	return false;
}
document.querySelector('.sub').addEventListener('click', toggleNav, false);
document.querySelector('.sub').addEventListener('touchstart', toggleNav, false);

var _gaq=[['_setAccount','UA-20281865-6'],['_trackPageview']];
(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
g.src='//www.google-analytics.com/ga.js';
s.parentNode.insertBefore(g,s);
}(document,'script'));