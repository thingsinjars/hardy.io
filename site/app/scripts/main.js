$('.navbar').on('click', function(e) {
	'use strict';
	e.preventDefault();
	var $collapse = $('.collapse');
	$collapse.collapse('toggle');
});