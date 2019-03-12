<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.DB_connect"%>
<%@ page import="new_product.Calender" %>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	int[] date = Calender.calen();
	DB_connect DB = new DB_connect();
	String custno = (String)session.getAttribute("custno");
	String history = DB.rouletteHistory(custno);
	//if(history==null){history="";}
	String today = Integer.toString(date[2]);
	String chance="1";
	if(history!=null){		// 1일 1회만 가능한 조건
		String[] historyarr = history.split(",");
		for(int i=1; i<historyarr.length; i++){
			if(Integer.parseInt(historyarr[i])==date[1]){
				if(today.equals(historyarr[historyarr.length-1])){
					chance="0";
					break;
				}
			}
			i++;
			i++;
		}  
	} 
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="js/rotate.js"></script> -->
<link rel="stylesheet" type="text/css" href="../css/roulette.css"/>
<!-- <script type="text/javascript" src="../js/roulette.js"></script> -->
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="http://beneposto.pl/jqueryrotate/js/jQueryRotateCompressed.js"></script>
<script>
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
	        location.href="/Teamproject/roulette_pro?part="+part+"&custno=<%=custno%>"+"&today=<%=date[2]%>"+"&month=<%=date[1]%>";
	        return;
	    }else if(part >= 8){
	        $('#result_id3').html("<p>당첨내역:" + pArr[pArr.length-1] + "</p>");
	        location.href="/Teamproject/roulette_pro?part="+part+"&custno=<%=custno%>"+"&today=<%=date[2]%>"+"&month=<%=date[1]%>";
	        return;
	    }else{
	    	$('#result_id3').html("<p>당첨내역:" + pArr[part] + "</p>");
	    	location.href="/Teamproject/roulette_pro?part="+part+"&custno=<%=custno%>"+"&today=<%=date[2]%>"+"&month=<%=date[1]%>";
	    	return;
	    }
	}
})
function randomize($min, $max){
	return Math.floor(Math.random() * ($max - $min + 1)) + $min;
}
</script>
<%
	String[] pArr = {"20p","1000p","10%할인쿠폰","5000p","10p","무료배송쿠폰","10p","50%할인쿠폰"};
	String pAr="";
	String part=request.getParameter("part");
	if(part!=null){
		int zet = Integer.parseInt(part);
		pAr="당첨내역 : "+pArr[zet];
	}

%>
</head>
<body>
<div id="main">
<div id="result_id" style="height:21px;">기회:<%=chance%></div>
<div id="result_id2" style="height:21px;"></div>
<div id="result_id3" style="height:21px;"><%=pAr%></div>
	<div id="roulette">
		<button id="start"></button>
	</div>
	<div id="this">
	</div>
</div>
<input type="hidden" value="<%=chance%>" id="chance">
<div>
<jsp:include page="Calendar.jsp"></jsp:include>
</div>
</body>
</html>