<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.DB_connect"%>
<%@ page import="new_product.orderT_data"%>
<%@ page import="new_product.orderE_data"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<%
	DB_connect DB = new DB_connect();
	List<orderE_data> data = DB.getsellist(DB.getselno((String)session.getAttribute("custno")));
	
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/orderpage2.css"/>
<script type="text/javascript" src="../js/orderpage2.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<div id="main">
	<div id="top">
		<a href="IKEA_COM.jsp?pageName=new_product.jsp"><button id="gotomain">쇼핑 계속하기</button></a>
		<!-- href pageName을 main으로 수정 -->
		<button id="gotosell" onclick="location.href='/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=orderpage.jsp'">주문내역</button>
	</div>	
	
	<%for(int i=0; i<data.size(); i++) {
	%>	<div class="eachorder">
			<table>
				<tr>
					<td class="list0">주문번호 : <%=data.get(i).getOrderno()%></td>
					<td class="list1">배송지 : <%=data.get(i).getRcvaddress()%></td>
					<td class="list2">상품번호 : <%=data.get(i).getItemno()%><br>상품이름 : <%=data.get(i).getItemname()%></td>
					<td class="list3">종류 : <%=data.get(i).getItemshape()%><br>
									  사이즈 : <%=data.get(i).getItemsize()%><br>
									  수량 : <%=data.get(i).getHowmany()%>
					<td class="list4">\ <%=data.get(i).getEachprice()*data.get(i).getHowmany()%></td>
				</tr>
			</table>
		</div>
	<%}%>
	<div style="border-top:1px solid lightgray; height:100px;"></div>
</div>
</body>
</html>