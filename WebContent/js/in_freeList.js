(function() {
	$('.free_sort > a:not(.free_sort_on)').hover(function() {
		$(this).css("text-decoration", "underline");
	}, function() {
		$(this).css("text-decoration", "none");
	});

	$('.free_sort > a').click(function() {
		$(this).next('form').trigger("submit");
		return false;
	});

	$('#free_numbering a').click(function() {
		$(this).next('form').trigger('submit');
		return false;
	});

	$('.free_content_subject_con > a').click(function() {
		$(this).next('form').trigger('submit');
		return false;
	});

	$('.free_content_link').hover(function() {
		$(this).css('text-decoration', 'underline');
	}, function() {
		$(this).css('text-decoration', 'none');
	});

	$('#free_write').hover(function() {
		$(this).css({
			backgroundColor: '#2415ED',
			cursor: 'pointer'
		});
	}, function() {
		$(this).css({
			backgroundColor: '#3963EA',
			cursor: 'default'
		});
	});

	$('#free_search').hover(function() {
		$(this).css({
			borderColor: '#3963EA',
			cursor: 'pointer'
		});
	}, function() {
		$(this).css({
			borderColor: '#9B9B9B',
			cursor: 'default'
		});
	});
})($);