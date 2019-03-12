<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="new_product.DB_connect" %>
<%@ page import="new_product.wish_data" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<%	
	DB_connect DB = DB_connect.getDB();
	String custno = request.getParameter("custno");
	if(custno.equals("0")){
		%>
		<script>alert("로그인 후 이용가능합니다.");
		location.href="/Teamproject/IKEA_com/IKEA_COM.jsp";</script>
		<%
	}
	ArrayList<wish_data> data = DB.viewwish(custno);
	
	// totalPrice
	long totalPrice=0;
	for(int i=0; i<data.size(); i++){
		long cc=data.get(i).getItemprice()*data.get(i).getCount();
		totalPrice+=cc;
	}
	DecimalFormat df = new DecimalFormat("#,###.##");
	String TotalPrice=df.format(totalPrice);
%>
<link rel="stylesheet" type="text/css" href="../css/cart.css"/>
<script type="text/javascript" src="../js/wish.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main">
	<div id="top">
		<a href="IKEA_COM.jsp?pageName=new_product.jsp"><button id="gotomain">쇼핑 계속하기</button></a>
		<input type="hidden" value="<%=data.size()%>" id="datasize">
	</div>	
	<%for(int i=0; i<data.size(); i++) {%>
	<div class="list">
		<table>
		<tr>
			<td class="list1"><input type="text" onchange="listCount(this,<%=i%>,<%=data.size()%>)" class="list_count" value="<%=data.get(i).getCount()%>" id="upd1_<%=i%>">
								<a href="/Teamproject/wish_pro?custno=<%=custno%>&itemno=<%=data.get(i).getItemno()%>&count=<%=data.get(i).getCount()%>&shape=<%=data.get(i).getShape()%>&size=<%=data.get(i).getSize()%>&method=del">
								<img src="../img/삭제.jpg" class="list_del"></a>
								<img src="../img/업데이트.jpg" class="list_del" onclick="update(<%=i%>)">
								</td>
			<td class="list2">
			<%int parp = 0;
			if(data.get(i).getImage().substring(0,4).equals("http")){
				parp = 1;
			}
			if(parp==0){ %>
				<img src="/../img_item/<%=data.get(i).getImage()%>">
			<%}else{ %>
				<img src="<%=data.get(i).getImage()%>">
			<%} %>
			</td>
			<td class="list3"><div><%=data.get(i).getItemname()%></div> <!--제목 -->
							<div><%=data.get(i).getCate()%></div> <!--카테 -->
							<%String price=df.format(data.get(i).getItemprice());%>
							<div>\ <%=price%></div> <!--가격 -->
							<br>
							<div id="upd5_<%=i%>"><%=data.get(i).getSize()%></div> 
							<div id="upd4_<%=i%>"><%=data.get(i).getShape()%></div>
							<div id="upd3_<%=i%>">제품번호 : <%=data.get(i).getItemno()%></div></td>
							<%long price2=data.get(i).getItemprice()*data.get(i).getCount();
							String price22=df.format(price2);%>
			<td id="getList<%=i%>" class="list4">\ <%=price22%></td>
		</tr>
		</table>
	</div>
	<input type="hidden" value="<%=data.get(i).getItemprice()%>" id="getPrice<%=i%>">
	<%} %>
	<input type="hidden" value="<%=custno%>" id="upd2">
	<div id="checkOut">
		<h2></h2>
		<span id="totalPrice">\ <%=TotalPrice %></span>
		<span id="gotopay" onclick="gotopay()">결제 시작</span>
	</div>
</div>
</body>
</html>