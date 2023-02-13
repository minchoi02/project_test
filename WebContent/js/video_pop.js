
// 포토갤러리 커스터마이징 
$(function() { 
var subject = new Array(); // 갤러리 썸네일 제목 배열변수 선언 
var content = new Array(); // 갤러리 썸네일 내용 배열변수 선언 
var url = new Array(); // 각 썸네일별 링크 저장용 변수 
var thumbCount; // 썸네일 개수 (추출개수) 
var refHeight; // 높이 동기화를 위한 변수 
// 갤러리 초기세팅 
function galleryInit() { 
if($(".bbsnewf5").length > 0) { 
thumbCount = $(".brd_photo_list .bbsnewf5").length; 
if($(".hoverBox").length > 0) { 
$(".hoverBox").parent('a').remove(); 
} 
for(i=0; i<thumbCount; i++) { 
url[i] = $(".brd_photo_list .bbsnewf5").eq(i).find('a:first').attr('href'); 
subject[i] = $(".brd_photo_list .bbsnewf5").eq(i).find('.gallery_title').text(); 
content[i] = $(".brd_photo_list .bbsnewf5").eq(i).find('.gallery_etc').text().replace('[간략설명 : ','').replace(']' ,''); 
// 썸네일 있는 td 내부에 hover 효과를 주기 위한 박스 태그 생성 (각각 썸네일 내에 반복문으로 삽입) 
$(".brd_photo_list .bbsnewf5").eq(i).find('table td:first').append('<a class="popup-vimeo" href="' + content[i] + '" target="_blank"><div class="hoverBox"><div class="inner"><h3>' + subject[i] + '</h3><p>' + $.trim(content[i]) + '</p></div></div></a>'); 
} 
// 기존에 보여지는 별도 td 의 제목, 내용은 숨김 
$(".gallery_subject, .gallery_etc").css('display','none'); 
} 
} 
galleryInit(); 
});

// 제품소개(포토갤러리) 이미지 링크 제거
$(function() {
   if($(".brd_photo_list .bbsnewf5 a img").length > 0) {
       var img = $(".brd_photo_list .bbsnewf5 a img");
       img.parent('a').removeAttr('href');
    }
});