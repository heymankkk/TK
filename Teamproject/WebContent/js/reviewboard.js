$(document).ready(function() {
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		
		var star1 =$('#star1').attr('class');
		var star2 =$('#star2').attr('class');
		var star3 =$('#star3').attr('class');
		var star4 =$('#star4').attr('class');
		var star5 =$('#star5').attr('class');
		var point=0;
		if(star1=="starR on"){point++}
		if(star2=="starR on"){point++}
		if(star3=="starR on"){point++}
		if(star4=="starR on"){point++}
		if(star5=="starR on"){point++}
		
		document.getElementById('score').value=point;
  	return false;
	});
});

function limit(){
	var press = document.ga.content;
	
	if(press.value.length>100){
		alert("100자이내로 작성하시기 바랍니다.");
		press.value=press.value.substring(0,100);
		press.focus();
	}
		
}


