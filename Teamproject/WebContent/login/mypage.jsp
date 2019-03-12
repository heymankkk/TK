<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
  	<%@ page import="member.LoginDBBean"%>    
  	<%@ page import="member.LoginDataBean"%>
  	<%@ page import="java.util.List"%>
  	<%@ page import="member.memberServlet"%>
  	<%@ page import="new_product.DB_connect"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/member/mypage.css" >
<%	

	String kid = (String)session.getAttribute("id");
  	LoginDBBean ldb = LoginDBBean.getLdb();
	LoginDataBean logList = ldb.information(kid);
	DB_connect DB = new DB_connect();
	String couponset = DB.getcoupon(kid);
	String[] coupon = couponset.split(",");

	int point = DB.getpoint(kid);
%>
	
<meta charset="UTF-8">	
<title>마이 페이지 -IKEA</title>
</head>
<body>
<div id="zindex">
	<%@ include file='../index/Header.jsp'%>
	<div id="all">
		<table>	
			<tr><td colspan="2" id="mo">나의 정보</td></tr>		
			<tr><td colspan="2" id="imo">개인정보</td></tr>
			<tr><td>아이디 :</td><td><%=logList.getId()%><td></tr>	
			<tr><td>비밀번호 :</td> <td><%=logList.getPw()%></td></tr>	
			<tr><td>이름 :</td> <td><%=logList.getName()%></td></tr>	
			<tr><td>이메일 :</td> <td>	<%=logList.getEmail()%></td></tr>	
			<tr><td>휴대폰 :</td> <td><%=logList.getPhone()%></td></tr>
			<tr><td>주소 :</td> <td><%=logList.getAdd_full()%></td></tr>	

			<tr><td><a href="../reInformation.jsp">개인정보수정</a></td></tr>	
			<tr><td><a href="../rePassword.jsp">비밀번호 수정</a></td></tr>	
			<tr><td><a href="../reEmail.jsp">이메일 수정</a></td></tr>	
			
			<tr><td colspan="2" id="imo">나의IKEA KOREA 매장</td></tr>	
			<tr><td>선호하는 매장을 선택하세요.</td></tr>	
			<tr><td><a href="../myBestShop.jsp">선호하는 매장을 변경하세요.</a></td></tr>	
			
			<tr><td colspan="2" id="mo">주문 내역 보기</td></tr>	
			<tr><td colspan="2"  id="imo">주문 내역 확인</td></tr>	
			<tr><td colspan="2"><a href="*">주문 내역보기</a></td></tr>	
			
			<tr><td colspan="2" id="outmember"><a href="../outMember.jsp">회원탈퇴</a></td></tr>		
		</table>	
	</div>
	<div id="event">
		<table>
			<tr>
			<td colspan="2" id="abc">포인트 & 쿠폰</td>
			</tr>
			<tr>
				<td>포인트 : </td>
				<td><%=point+"p"%></td>
			</tr>
			<%for(int i=0; i<coupon.length; i++){ %>
			<tr>
				<td><%if(i==0){%>쿠폰 : <%}%></td>
				<td><%=coupon[i]%></td>
			</tr>
			<%} %>
		</table>
	</div>
	<div id="loginfooter">
		<%@ include file='../index/footer.jsp'%>
	</div>
</div>
</body>
</html>