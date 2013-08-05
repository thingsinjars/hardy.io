function toggleNav(e) {
	var n = document.querySelector('.mn');
	n.className = /\sshow/.test(n.className)?n.className.replace(/\sshow/,''):n.className + ' show';
	e.preventDefault();
	e.stopPropagation();
	return false;
}
document.querySelector('.sub').addEventListener('click', toggleNav, false);
document.querySelector('.sub').addEventListener('touchstart', toggleNav, false);