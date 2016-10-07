$(function () {
	$(".in_nav_menu_hover").hover(function() {
		$(this).find("a").css("color", "blue");
	}, function() {
		$(this).find("a").css("color", "black");
	});
});