

$(function() {
	var $container = $("#sub_container");
	
	function majorCreate() {
		var $d1url = [];
		var $d1title = [];
		var $d1html;
		var i = 0;
		
		$("#nav > li").each(function() {
			$d1url[i] = $(this).children('a').attr('href');
			$d1title[i] = $(this).children('a').text();
			i++;
		});

		for(n=0; n<i; n++) {
			$d1html = '<li><a href="' + $d1url[n] + '"><span>' + $d1title[n] + '</span></a></li>';
			$("#subnav .depth1 .mnuList").append($d1html);
		}
	}

	majorCreate();

	function minorCreate() {
		var $d2url = [];
		var $d2target = [];
		var $d2title = [];
		var $d2html;
		var $currIndex = 0;
		
		if($container.data('menu-special')) {
			$currIndex = $container.data('menu-special') - 1;
		} else {
			$currIndex = menuTop - 1;
		}
		var i = 0;

		$("#nav ul.sub").each(function() {
			if($(this).parent().parent().parent().index() == $currIndex) {
				for(i=0; i<$(this).children().length; i++) {
					$d2url[i] = $(this).children().eq(i).find('a').attr('href');
					$d2title[i] = $(this).children().eq(i).find('a').text();
					$d2target[i] = $(this).children().eq(i).find('a').attr('target');
				}
			}
		});

		for(n=0; n<i; n++) {
			$d2html = '<li><a href="' + $d2url[n] + '" target="' + $d2target[n] + '"><span>' + $d2title[n] + '</span></a></li>';
			$("#subnav .depth2 .mnuList").append($d2html);
		}

	}

	minorCreate();

	function majorActive() {
		var currIndex = 0;

		if($container.data('menu-special')) {
			currIndex = $container.data('menu-special') - 1;
		} else {
			currIndex = menuTop - 1;
		}
		var currMenu = $("#subnav .depth1 ul.mnuList li").eq(currIndex).text();

		$("#subnav .depth1 > a > span").text(currMenu);
	}

	function minorActive() {
		var currIndex = 0;

		if($container.data('sub-special')) {
			currIndex = $container.data('sub-special') - 1;
		} else {
			currIndex = menuSub - 1;
		}

		var currMenu = $("#subnav .depth2 ul.mnuList li").eq(currIndex).text();

		$("#subnav .depth2 > a > span").text(currMenu);
	}

	$("#subnav .dropdown > a").click(function() {
		if(!$(this).parent('.dropdown').hasClass('open')) {
			$("#subnav .dropdown").removeClass('open');
			$("#subnav .dropdown > ul.mnuList").stop(true,false).fadeOut(200);
			$(this).parent('.dropdown').addClass('open');
			$(this).siblings('ul.mnuList').stop(true,false).fadeIn(200);
		} else {
			$(this).parent('.dropdown').removeClass('open');
			$(this).siblings('ul.mnuList').stop(true,false).fadeOut(200);
		}
	});
	
	$(window).load(function() {
		majorActive();
		minorActive();
	});
});