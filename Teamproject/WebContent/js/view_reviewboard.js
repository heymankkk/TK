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
		if(star1=="starR on"){point++; point++;}
		if(star2=="starR on"){point++; point++;}
		if(star3=="starR on"){point++; point++;}
		if(star4=="starR on"){point++; point++;}
		if(star5=="starR on"){point++; point++;}
		
		document.getElementById('score').value=point;
  	return false;
	});
});


