(function($) {
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
            	if($(this).html() == "??????????????????"){
            		no = "186";
            		index = "01";
            	}else if($(this).html() == "???????????????"){
            		no = "187";
            		index = "02";
            	}else if($(this).html() == "???????????????????????????"){
            		no = "188";
            		index = "03";
            	}else if($(this).html() == "????????????????????????"){
            		no = "189";
            		index = "04";
            	}else if($(this).html() == "????????????????????????"){
            		no = "191";
            		index = "05";
            	}else if($(this).html() == "?????????????????????"){
            		no = "192";
            		index = "06";
            	}else if($(this).html() == "????????????????????????"){
            		no = "193";
            		index = "07";
            	}else if($(this).html() == "???????????????????????????"){
            		no = "194";
            		index = "08";
            	}else if($(this).html() == "?????????????????????????????????"){
            		no = "195";
            		index = "09";
            	}else if($(this).html() == "???????????????"){
            		no = "196";
            		index = "10";
            	}else if($(this).html() == "??????????????????????????????"){
            		no = "197";
            		index = "11";
            	}else if($(this).html() == "??????????????????????????????"){
            		no = "198";
            		index = "12";
            	}else if($(this).html() == "???????????????"){
            		no = "199";
            		index = "13";
            	}else if($(this).html() == "????????????????????????"){
            		no = "200";
            		index = "14";
            	}else if($(this).html() == "??????????????????"){
            		no = "211";
            		index = "15";
            	}
            	
    			
                var prev = $("#multiSelectElementsSelected").html();
                var elem = '<div class="multiSelectElementSelected"><input type="hidden" class="search_facility" value="check" name="search_facility'+ index +'">' + $(this).html() + '<span class="multiSelectClose">X</span></div>';

                $(this).remove();

                if(prev.trim() == params.title) {
                    prev = "";
                }

                $("#multiSelectElementsSelected").html(prev + elem);
            });

            $(document).on("click", ".multiSelectClose", function() {
            	
            	$(this).parent().children("input").remove();
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
