<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.DB_connect"%>
<%@ page import="new_product.DB_data"%>
<%@ page import="project.SofaDataDB" %>
<%@ page import="project.SofaDBBean" %>
<%@ page import="project.ReviewSubmit" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/review.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/view_reviewboard.js"></script>
<%
	int itemno =Integer.parseInt(request.getParameter("itemno")); 

	DB_connect DB = DB_connect.getDB();
	DB_data data = DB.view(request.getParameter("itemno"));
	
%>
<meta charset="UTF-8">
<title>상품리뷰</title>
</head>
<body>
	<div class="timg">
		
	</div>
	<div class="title">
		<%=data.getItemname()%>에 대한 내 상품평 
		<br><br>
		<span class="req">필수필드는 *로 표시됩니다.</span>
	</div>
	<form action="../view_ReviewSubmit" method="post" target="review.do">
	<input type="hidden" name="citem" value="<%=request.getParameter("itemno") %>">
	<div class="starRev">
		<input type="hidden" name="starscore" id="score" value="2">
		<span>전체평점</span>
		<span class="starR on" id="star1">별1</span>
		<span class="starR" id="star2">별2</span>
		<span class="starR" id="star3">별3</span>
		<span class="starR" id="star4">별4</span>
		<span class="starR" id="star5">별5</span>
		<span>평가하려면 클릭하세요!</span>
	</div>
	
	<div class="reviewarea">
		<div class="reviewtitle">
			<span>상품평 제목(35자이내)</span>
			<br>
			<input type="text" name="subject" id="subject" value="예시)기능이 다양합니다!"
			 onfocus="if(this.value=='예시)기능이 다양합니다!') this.value='';" 
			 onblur="if(this.value=='') this.value='예시)기능이 다양합니다!';" maxlength=35>
		</div>
		<div class="rev_content">
			<span>*상품평</span>
			<br>
			<textarea name="content" rows="7" cols="70"></textarea>
		</div>
		<div class="nickname">
			<span>*닉네임(10자이내)</span>
			<br>
			<input type="text" id="nick" name="nickname" maxlength=10>
		</div>
		<div class="desc">
			<span>1. 작성된 상품평은 삭제가 어려우니, 신중히 판단 후 상품평을 제출하시기 바랍니다.
				<br>
			 2. 제출 사항에 대한 이메일을 받으실 수 있습니다. </span>	
		</div>
	</div>
	
	<div class="buttonarea" style="margin-left:200px">
	
		<input type="submit" id="clear" value="작성하기" onclick="window.close()">
		<input type="button" id="close" value="닫기" onclick="self.close();">
	</div>
	</form>
</body>
</html>