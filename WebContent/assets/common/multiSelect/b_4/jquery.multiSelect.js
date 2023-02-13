(function($) {
	
	$.fn.multiSelect2 = function(options) {
        var defauts = {
            "title" : "Title",
            "elements" : [
                "Lorem",
                "Ipsum",
                "Dolor",
                "Sit",
                "Amet"
            ]
        }

        var params = $.extend(defauts, options);

        return this.each(function () {
            var selector = $(this);

            selector.html("");

            selector.append('<div id="multiSelectSelected2"></div>');
            var selected = $("#multiSelectSelected2");
            selected.append('<div id="multiSelectElementsSelected2">'+params.title+'</div>');
            selected.append('<div id="multiSelectClick2"> <img src="/assets/mobile/common/images/bg_select_arrow.png" style="width:20px;height:7px;"/> </div>');

            selector.append('<div id="multiSelectElements2"></div>');
            var elements = $("#multiSelectElements2");

            for(var i = 0; i < params.elements.length; i++) {
                elements.append('<div class="multiSelectElement2" id="sitem_'+ (i+1) +'">'+params.elements[i]+'</div>');
            }

            $("#multiSelectClick2").click(function () {
                if(elements.is(":visible")) {
                    elements.slideUp("fast");
                } else {
                    elements.slideDown("fast");
                }
            });
            
            $("#multiSelectElementsSelected2").click(function () {
            	
            	console.log($("#multiSelectElements2").css("display"));
            	
            	if( $(".multiSelectElementSelected2").length < 1){
            		if( $("#multiSelectElements2").css("display") == "none" ){
                    	$("#multiSelectElements2").slideDown("fast");
                    }else{
                    	$("#multiSelectElements2").slideUp("fast");
                    }
            	}
            });

            $(document).on("click", ".multiSelectElement2", function() {

            	var no = "";
            	var index = "";
            	if($(this).children(".title").html() == "중구"){
            		no = "37";
            		index = "01";
            	}else if($(this).children(".title").html() == "동구"){
            		no = "38";
            		index = "02";
            	}else if($(this).children(".title").html() == "대덕구"){
            		no = "39";
            		index = "03";
            	}else if($(this).children(".title").html() == "서구"){
            		no = "40";
            		index = "04";
            	}else if($(this).children(".title").html() == "유성구"){
            		no = "41";
            		index = "05";
            	}
            	    			
                var prev = $("#multiSelectElementsSelected2").html();
                var elem;
                elem = '<div class="multiSelectElementSelected2"> <input type="hidden" class="search_facility" id="soption'+ index +'" value="'+no+'" name="area_seq">' + $(this).html() + '<span class="multiSelectClose2">X</span></div>';
                
                $(this).remove();

                if(prev.trim() == params.title) {
                    prev = "";
                }

                $("#multiSelectElementsSelected2").html(prev + elem);
            });

            $(document).on("click", ".multiSelectClose2", function(e) {
            //$('.multiSelectClose').on('click', function(e){
            	//e.stoplmmediatePropagation();
            	
            	$(this).parent().children("input").remove();
            	//$(this).parent().children("img").remove();
                var elem = $(this).parent().html();
                elem = elem.replace('<span class="multiSelectClose2">X</span>', '');

                $(this).parent().remove();


                elements.append('<div class="multiSelectElement2">'+elem+'</div>');

                if($("#multiSelectElementsSelected2").html().trim() == "") {
                    $("#multiSelectElementsSelected2").html(params.title);
                }
            });
        });
    };
    
    
    
    $.fn.multiSelect = function(options) {
        var defauts = {
            "title" : "Title",
            "elements" : [
                "Lorem",
                "Ipsum",
                "Dolor",
                "Sit",
                "Amet"
            ]
        }

        var params = $.extend(defauts, options);

        return this.each(function () {
            var selector = $(this);

            selector.html("");

            selector.append('<div id="multiSelectSelected"></div>');
            var selected = $("#multiSelectSelected");
            selected.append('<div id="multiSelectElementsSelected">'+params.title+'</div>');
            selected.append('<div id="multiSelectClick"> <img src="/assets/mobile/common/images/bg_select_arrow.png" style="width:20px;height:7px;"/> </div>');

            selector.append('<div id="multiSelectElements"></div>');
            var elements = $("#multiSelectElements");

            for(var i = 0; i < params.elements.length; i++) {
                elements.append('<div class="multiSelectElement" id="item_'+ (i+1) +'">'+params.elements[i]+'</div>');
            }

            $("#multiSelectClick").click(function () {
                if(elements.is(":visible")) {
                    elements.slideUp("fast");
                } else {
                    elements.slideDown("fast");
                }
            });
            
            $("#multiSelectElementsSelected").click(function () {
            	
            	console.log($("#multiSelectElements").css("display"));
            	
            	if( $(".multiSelectElementSelected").length < 1){
            		if( $("#multiSelectElements").css("display") == "none" ){
                    	$("#multiSelectElements").slideDown("fast");
                    }else{
                    	$("#multiSelectElements").slideUp("fast");
                    }
            	}
            });

            $(document).on("click", ".multiSelectElement", function() {

            	var no = "";
            	var index = "";
            	if($(this).children(".title").html() == "예술"){
            		no = "201";
            		index = "01";
            	}else if($(this).children(".title").html() == "공연"){
            		no = "202";
            		index = "02";
            	}else if($(this).children(".title").html() == "문화"){
            		no = "203";
            		index = "03";
            	}else if($(this).children(".title").html() == "교통"){
            		no = "204";
            		index = "04";
            	}else if($(this).children(".title").html() == "숙박"){
            		no = "205";
            		index = "05";
            	}else if($(this).children(".title").html() == "의료"){
            		no = "206";
            		index = "06";
            	}else if($(this).children(".title").html() == "금융"){
            		no = "208";
            		index = "07";
            	}else if($(this).children(".title").html() == "교육"){
            		no = "209";
            		index = "08";
            	}else if($(this).children(".title").html() == "음식"){
            		no = "207";
            		index = "09";
            	}else if($(this).children(".title").html() == "기타"){
            		no = "210";
            		index = "10";
            	}
            	    			
                var prev = $("#multiSelectElementsSelected").html();
                var elem
                if(index != "10"){
                	elem = '<div class="multiSelectElementSelected"> <input type="hidden" class="search_facility" id="option'+ index +'" value="'+no+'" name="kind_seq">' + $(this).html() + '<span class="multiSelectClose">X</span></div>';
                }else{
                	elem = '<div class="multiSelectElementSelected"> <input type="hidden" class="search_facility" id="option'+ index +'" value="'+no+'" name="kind_seq">' + $(this).html() + '<span class="multiSelectClose">X</span></div>';
                }
                

                $(this).remove();

                if(prev.trim() == params.title) {
                    prev = "";
                }

                $("#multiSelectElementsSelected").html(prev + elem);
            });

            $(document).on("click", ".multiSelectClose", function(e) {
            //$('.multiSelectClose').on('click', function(e){
            	//e.stoplmmediatePropagation();
            	
            	$(this).parent().children("input").remove();
            	//$(this).parent().children("img").remove();
                var elem = $(this).parent().html();
                elem = elem.replace('<span class="multiSelectClose">X</span>', '');

                $(this).parent().remove();


                elements.append('<div class="multiSelectElement">'+elem+'</div>');

                if($("#multiSelectElementsSelected").html().trim() == "") {
                    $("#multiSelectElementsSelected").html(params.title);
                }
            });
        });
    };
})(jQuery);
