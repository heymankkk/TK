<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/member/member.css" >
	<script type="text/javascript" src="../js/member/member.js"></script>

<meta charset="UTF-8">
<title>프로필 생성</title>
</head>
<body>
<div id="zindex">
	<%@ include file='../index/Header.jsp'%>
		<div id="all">
		<div id="high"><div id="pf">프로필 만들기</div><br>
									환영합니다!</div>
	
			<div id="top">
				개인 프로필을 만들면 다양한 혜택을 누릴 수 있습니다.
				<ul>
					<li>매번 개인정보를 입력하지 않아도 됩니다.</li>
					<li>쇼핑 리스트 저장하고 매장에서 손쉽게 이용할 수 있습니다.</li>
					<li>이벤트 등의 다양한 혜택 정보를 확인 할 수 있습니다.</li>
				</ul>
				*로 표시한 필드는 필수 입력 항목입니다.
			</div>	
			<hr>
			<div id="chinese">만14세 이상만 가입할 수 있습니다.<br>
			*는 필수 입력 항목입니다.</div>
			<form  action="../memberServlet" method="post" name="my_form">			
				<table id="PI">		
					<tr>
						<td>* 아이디 </td> 
						<td><input type="text" id="textid" name="id" maxlength="30"></td>
						<td><input type="button" onclick='id_chk()' id="htb" value="중복검사" style='WIDTH: 52pt; HEIGHT: 17pt'></td>
					</tr>
					<tr>
						<td>* 비밀번호</td>
						<td><input type="password" name="pw" id="password1" onchange ="pwlen()" maxlength="12" required></td>
						<td id="tdlabel"><label id="lachk1"></label></td>
					</tr>
					<tr>
						<td>* 비밀번호 재입력</td>
						<td><input type="password" id="password2" onchange ="pwchk()" required></td>
						<td id="tdlabel"><label id="lachk2"></label></td>
					</tr>					
					<tr>
						<td>* 이름</td>
						<td><input type="text" name="name" id="name" onblur="name_chk()" required></td>
						<td id="tdlabel"><label id="la_chk3"></label></td>
					</tr>
					<tr>
						<td>* 이메일</td>
				   		<td><input type="text" name="email" id="email1" onblur="email1_chk()" required></td>
				   		<td id="tdlabel"><label id="la_chk4"></label></td>
					</tr>
					<tr>
						<td>* 이메일 재입력</td>
						 <td><input type="text" id="email2" onchange="email2_chk()" required></td>
						 <td id="tdlabel"><label id="la_chk5"></label></td>
					</tr>
					<tr>
						<td>* 휴대폰</td>
					 	<td><input type="text" name="phone" id="phone" onblur="phone_chk()" required></td>
					 	<td id="tdlabel"><label id="la_chk6"></label></td>
					</tr>
					<tr>
						<td>* 주소</td>
						<td><input type="text" name="juso" id="juso" required>
						<input type="hidden" name="jibunAddr" id="jibunAddr">
						<input type="hidden" name="zipNo" id="zipNo"></td>
						<td><input type="button" id="htb" value="주소검색" onclick="goPopup()" style='WIDTH: 52pt; HEIGHT: 17pt'></td>
					</tr>
					<tr>
						<td>구매자 :</td>
						<td><div class="aaa"><input type="checkbox" value="0" id="aa" name="wright" onclick="wrightcheck1()"></div></td>
					</tr>
					<tr>
						<td>판매자 :</td>
						<td>
						<div class="aaa"><input type="checkbox" value="1" id="bb" name="wright" onclick="wrightcheck2()"></div>
						</td>
					</tr>
				</table>
			<hr>
			<table id="main1">
				<tr>
					<td><label><input type="checkbox" name="agree1" id="mycheck" required></label></td>
					<td id="main1text"> * 이용약관 동의<a href="eyong1.jsp" target="_blank">이용약관</a></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="agree2" id="mycheck" required></label></td>
					<td id="main1text"> * 개인정보수집/이용 동의<a href="eyong2.jsp" target="_blank">이용약관</a></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="agree3" id="mycheck" required></label></td>
					<td id="main1text"> * 개인정보 처리 위탁 동의<a href="eyong3.jsp" target="_blank">이용약관</a></td>
				</tr>
				<tr>
					<td id="all_check1"><input type="checkbox" onclick="check_all()"></td>
					<td id="all_check2"> * 모든 약관 동의</td>
				</tr>
			</table>
			<hr>	
			<table id="main2">	
				 <tr>
					<td><input type="checkbox"></td>
					<td id="main2text">IKEA Korea 뉴스레터를 이메일로 받는 것에<br>
					 동의 합니다.</td>
				 </tr>
				 <tr>
				 	<td><input type="checkbox"></td>
				 	<td id="main2text">아이디 저장하기</td>
				 </tr>
			</table><!-- main -->
			<hr>
		    <div id="button"><input type="button" value="뒤로" onClick="location.href='login.jsp'"> <input type="submit" value="저장 후 계속"></div>	
			
</form>
		</div><!-- all -->
		<div id="loginfooter">
			<%@ include file='../index/footer.jsp'%>
		</div>
</div>
</body>
</html>