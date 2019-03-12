$(document).ready(function(){ 
		 var pArr = ["20p","1000p","10%할인쿠폰","5000p","10p","무료배송쿠폰","10p","50%할인쿠폰"];
		$('#start').click(function(){
			if(document.getElementById("chance").value=="1"){
				$('#roulette').rotate({
					angle:0, 
					animateTo:360*10+randomize(1, 359),
					easing: $.easing.easeInOutElastic,
					callback: function(){
								var n = $(this).getRotateAngle();
								endAnimate(n);
							},
					duration:3000
				});
			}else{alert("이미 참여하였습니다.");}
		});
		function endAnimate($n){
	        var n = $n;
	        $('#result_id').html("<p>움직인각도:" + n + "</p>");
	        var real_angle = n%360;
	        var part = Math.floor(real_angle/45); //0~7
	        $('#result_id2').html("<p>상품범위:" + part + "</p>");
	        if(part < 1){
	            $('#result_id3').html("<p>당첨내역:" + pArr[0] + "</p>");
	            return;
	        }
	        if(part >= 8){
	            $('#result_id3').html("<p>당첨내역:" + pArr[pArr.length-1] + "</p>");
	            return;
	        }
	        $('#result_id3').html("<p>당첨내역:" + pArr[part] + "</p>");
	    }
})
function randomize($min, $max){
	return Math.floor(Math.random() * ($max - $min + 1)) + $min;
}