<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.LoginDBBean"%>    
<%@ page import="member.LoginDataBean"%>
<%
	String empid = request.getParameter("empid");
	LoginDBBean ldb = LoginDBBean.getLdb();
	LoginDataBean logList = ldb.information(empid);
%>
<!DOCTYPE html>
<html>
<head>
 	<script type="text/javascript" src="../js/member/member.js"></script>
<meta charset="UTF-8">
<title>중복 검사</title>
</head>
<body>
<h2>아이디 중복체크</h2>
<%
	if(logList.getId()==null){
		%>
			아이디는 사용 가능합니다.
		<%
		}
	else if(logList.getId().equals(empid)){
		%>
		이미 가입 된 아이디입니다.
		<%
		}
		%>

</body>
</html>