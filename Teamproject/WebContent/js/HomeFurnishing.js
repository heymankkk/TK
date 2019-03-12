/**
 * 
 */
$(document).ready(function() {
	$('div#homefurnishing_content_view').css("position","absolute");
	$('div#homefurnishing_content_view').css("top", Math.max(0, (($(window).height() - $('div#homefurnishing_content_view').outerHeight()) / 2) + 
                                                $(window).scrollTop()) + "px");
	$('div#homefurnishing_content_view').css("left", Math.max(0, (($(window).width() - $('div#homefurnishing_content_view').outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    
    
    $('div#homefurnishing_write').css("position","absolute");
	$('div#homefurnishing_write').css("top", Math.max(0, (($(window).height() - $('div#homefurnishing_write').outerHeight()) / 2) + 
                                                $(window).scrollTop()) + "px");
	$('div#homefurnishing_write').css("left", Math.max(0, (($(window).width() - $('div#homefurnishing_write').outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    return $('div#homefurnishing_write');
    return $('div#homefurnishing_content_view');
   });

function homefurnishing_more(down){
	$(down).closest('div#homefurnishing_more').css('display','none');
	var none = $(down).closest('div#homefurnishing_more').next("div#homefurnishing_none");
	none.css('display','block');
	var more = $(none).next("div#homefurnishing_more");
	more.css('display','block');
}

function homefurnishingview(view){
	var number = $(view).children('input#homefurnishing_content_number').attr('value');
	var filter = document.getElementById('homefurnishing_menu_filter').innerHTML;
	location.href='../index/HomeFurnishing.jsp?number='+number+'&filter='+filter;
	
}
function returnhomefurnishing(){
	var filter = document.getElementById('homefurnishing_menu_filter').innerHTML;
	location.href='../index/HomeFurnishing.jsp?filter='+filter;
}
function viewbackno(back){
	var number = $(back).closest('div#homefurnishing_content_view_back').children('input#backvalue').attr('value');
	var filter = document.getElementById('homefurnishing_menu_filter').innerHTML;
	if(number==0){
		alert("이전 글이 없습니다.")
		history.back();
	}
	else{
		location.href='../index/HomeFurnishing.jsp?number='+number+'&filter='+filter;
	}
}
function viewnextno(next){
	var number = $(next).closest('div#homefurnishing_content_view_next').children('input#nextvalue').attr('value');
	var filter = document.getElementById('homefurnishing_menu_filter').innerHTML;
	if(number==0){
		alert("다음 글이 없습니다.")
		history.back();
	}
	else{
		location.href='../index/HomeFurnishing.jsp?number='+number+'&filter='+filter;
	}
}

function filterlist(){
	if($('div#filterlist').css('display')=="none"){
		$('div#filterlist').css('display','block');
	}
	else{
		$('div#filterlist').css('display','none');
	}
}

function filterlistchange(li){
	var filterlist = $(li).attr('value');
	document.getElementById("homefurnishing_menu_filter").innerHTML= filterlist +" ▽";
	location.href='../index/HomeFurnishing.jsp?filter='+filterlist;
}


function content_write(){
	if($('div#homefurnishing_write').css('display')=="none"){
		$('div#homefurnishing_write').css('display','block');
	}
	else{
		$('div#homefurnishing_write').css('display','none');
	}
}


function link_select(dhis){
	$('input#submit_select').attr('value',dhis.value);
}
function link_title(dhis){
	$('textarea#submit_title').val(dhis.value);
}
function link_content(dhis){
	$('textarea#submit_content').val(dhis.value);
}
function link_img(dhis){
	$('input#submit_img').attr('value',dhis.value);
}

function submitUpload(){
	$('#writeform').submit();
}
function submitexit(){
	if($('div#homefurnishing_write').css('display')=="block"){
		$('div#homefurnishing_write').css('display','none');
	}
}