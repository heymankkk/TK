<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<%	// cart
	ArrayList<ArrayList> totallist = (ArrayList)session.getAttribute("cartList");
	if(totallist==null){
		totallist = new ArrayList<ArrayList>();
	}
	//	add
	ArrayList<String> list = new ArrayList<String>();
	if(request.getParameter("item_count")!=null){
		if(totallist.size()==0){
			list.add(request.getParameter("item_count"));
			list.add(request.getParameter("image"));
			list.add(request.getParameter("itemname"));
			list.add(request.getParameter("cate"));
			list.add(request.getParameter("chg"));
			list.add(request.getParameter("chgg"));
			list.add(request.getParameter("priceset"));
			list.add(request.getParameter("itemno"));
			totallist.add(list);
			session.setAttribute("cartList", totallist);
		}else if(!(totallist.get(totallist.size()-1).get(0).equals(request.getParameter("item_count"))&&
/*새로고침 방지*/	totallist.get(totallist.size()-1).get(2).equals(request.getParameter("itemname"))&&
					totallist.get(totallist.size()-1).get(4).equals(request.getParameter("chg"))&&
					totallist.get(totallist.size()-1).get(5).equals(request.getParameter("chgg")))){
				list.add(request.getParameter("item_count"));
				list.add(request.getParameter("image"));
				list.add(request.getParameter("itemname"));	//이름
				list.add(request.getParameter("cate"));
				list.add(request.getParameter("chg"));
				list.add(request.getParameter("chgg"));
				list.add(request.getParameter("priceset"));
				list.add(request.getParameter("itemno"));
				totallist.add(list);
				session.setAttribute("cartList", totallist);
		}
	}
	
	// del 은 서블렛에서
	/*
	String num=request.getParameter("num");
	if(num==null){num="9999";}
	if(num!="9999"){
		int num2 =Integer.parseInt(num); 
			totallist.remove(num2);
	}*/
	
	
	// totalPrice
	int totalPrice=0;
	for(int i=0; i<totallist.size(); i++){
		int cc=Integer.parseInt((String)totallist.get(i).get(6));
		totalPrice+=cc;
	}
	DecimalFormat df = new DecimalFormat("#,###.##");
	String TotalPrice=df.format(totalPrice);
%>
<link rel="stylesheet" type="text/css" href="../css/cart.css"/>
<script type="text/javascript" src="../js/cart.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main">
	<div id="top">
		<a href="IKEA_COM.jsp?pageName=new_product.jsp"><button id="gotomain">쇼핑 계속하기</button></a>
		<!-- href pageName을 main으로 수정 -->
	</div>	
	<%for(int i=0; i<totallist.size(); i++) {%>
	<% String price=df.format(Integer.parseInt((String)totallist.get(i).get(6)));%>
	<div class="list">
		<table>
		<tr>
			<td class="list1"><input type="text" onchange="listCount(this,<%=i%>,<%=totallist.size()%>)" class="list_count" value="<%=totallist.get(i).get(0)%>">
								<a href="/Teamproject/cart_pro?num=<%=i%>">
								<img src="../img/삭제.jpg" class="list_del"></a></td>

			<td class="list2"><img src="<%=totallist.get(i).get(1)%>"></td>
			<td class="list3"><div><%=totallist.get(i).get(2)%></div> <!--제목 -->
							<div><%=totallist.get(i).get(3)%></div> <!--카테 -->
							<div>\ <%=totallist.get(i).get(6)%></div> <!--가격 -->
							<br>
							<div><%=totallist.get(i).get(5)%></div> 
							<div><%=totallist.get(i).get(4)%></div>
							<div>제품번호 : <%=totallist.get(i).get(7)%></div></td>
			<td id="getList<%=i%>" class="list4">\ <%=price%></td>
		</tr>
		</table>
	</div>
	<%int abc=Integer.parseInt((String)totallist.get(i).get(6))/Integer.parseInt((String)totallist.get(i).get(0)); %>
	<input type="hidden" value="<%=abc%>" id="getPrice<%=i%>">
	<%} %>
	
	<div id="checkOut">
		<h2></h2>
		<span id="totalPrice">\ <%=TotalPrice %></span>
		<div id="gotopay" onclick="gotopay()">결제 시작</div>
	</div>
</div>
<input type="hidden" value="<%=totallist.size()%>" id="totallist">
</body>
</html>