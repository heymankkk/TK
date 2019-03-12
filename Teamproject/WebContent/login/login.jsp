<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/member/login.css">
<meta charset="UTF-8">
<title>로그인 -IKEA</title>

<%
String test ="";
if(session.getAttribute("error")!=null){
	test = (String)session.getAttribute("error");
	out.println("<script>alert('"+test+"');</script>");
}
%>

</head>
<body>
<div id="zindex">
	<%@ include file='../index/Header.jsp'%>
	<div id="all">
		<form action="../LoginServlet" method="post">
		<div id="now">지금 IKEA.kr에 로그인하세요!</div>
			<div id=all1>
				<div id="top">로그인</div>
				<hr id="hr1">
					<table>
						<tr>
							<td id="ip">* 아이디</td> 
							<td><input type="text" name="id"></td>
						</tr> 
						<tr>
							<td id="ip">* 비밀번호</td>
							<td><input type="password" name="pw"></td>
						</tr> 
						<tr>
							<td></td>
							<td><a href="*">비밀번호 찾기</a></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox">아이디 저장하기<br><a href="*">자세한 내용보기</a></td>
						</tr>			
					</table>
				<hr id="hr2">
						<input type="submit" value="로그인" id="log">			
					<div id="bottom">		
						<div id="bottom1">IKEA FAMILY 멤버는 이곳을 클릭해 로그인하세요.</div>
						<div id="bottom2">IKEA FAMILY 로그인 정보는 IKEA.kr 웹사이트 로그인 정보와 다릅니다.</div>
				</div>
			</div><!-- all1 -->
				
			<div id=all2>
				<div id="top">회원가입</div>
				<hr id="hr1">
					<div id="bot1">
						   <div id="botweight">IKEA.kr 웹사이트에서 회원가입을 하면 더 많은 정보를 얻을 수 있어요.</div><br>
									   	   개인 정보를 매번 입력할 필요 없이, 쇼핑 리스트 저장이 더욱 쉬워질 거에요. IKEA.kr<br>
							 			   웹 사이트 회원 가입으로 더 많은 정보와 이벤트 등의 혜택을 받아보세요.<br>
							 	<br>
							 	<br>				
								<div id="orange">IKEA 웹사이트 회원 가입과 IKEA FAMILY 멤버가입은 다릅니다.<br>
								<input type="button" value="회원가입" onclick = "location.href ='memberJoin.jsp'"></div>
					</div>	
				<div id="bot2">	
					<div id="booot">IKEA FAMILY 멤버가입</div>				
				<hr id="hr3">			
					<div>
					   <div id="boot">IKEA FAMILY와 함께 더 많은 즐거움을 누려보세요!</div>
							IKEA FAMILY는 집과 홈퍼니싱을 사랑하는 모든 사람들을 위한 멤버십 프로그램입니다.
							가입 비용은 집을 사랑하는 모든 사람들의 마음 하나입니다.<br><br><br><br>
							지금 가입하세요
					</div>
				</div>			
			</div> <!-- all2 -->
			</form>	
		</div> <!-- all -->	
		<div id="loginfooter">
			<%@ include file='../index/footer.jsp'%>
		</div>
</div>
</body>
</html>