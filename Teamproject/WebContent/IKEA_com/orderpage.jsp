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
	String wright = (String)session.getAttribute("wright");
	// 0 구매자 1 판매자 10 비로그인
	if(wright.equals("10")){
%>	<script>alert("로그인하지 않았습니다."); location.href="/Teamproject/IKEA_com/IKEA_COM.jsp";</script>
<%	}		// ↑ 임시주석. 추후 삭제.
	
	DB_connect DB = new DB_connect();

	List<orderT_data> data = DB.orderpageT(Integer.parseInt((String)session.getAttribute("custno")));
	List<orderE_data> dataE = null;//new Arraylist<orderE_data>();
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/orderpage.css"/>
<script type="text/javascript" src="../js/orderpage.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<div id="main">
	<div id="top">
		<a href="IKEA_COM.jsp?pageName=new_product.jsp"><button id="gotomain">쇼핑 계속하기</button></a>
		<!-- href pageName을 main으로 수정 -->
<script> window.onload = function aaaa(){if(<%=wright%>==1){document.getElementById("gotosell").style.display="inline-block";}}</script>
		<button id="gotosell" onclick="location.href='/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=orderpage2.jsp'">판매내역</button>
	</div>	
	
	<%for(int i=0; i<data.size(); i++) {
		/* String selno = data.get(i).getSelno();
		String[] a = selno.split("(");
		String[] b = a[1].split(")");
		String count = b[0]; */
		dataE = DB.orderpageE(data.get(i).getOrderno());
	%>
		<div class="eachorder">
			<table>
			<tr>
				<td class="top1">주문번호 : <%=data.get(i).getOrderno()%><br>주문일자<br><%=dataE.get(0).getItemname()%> 상품 등 <%=dataE.size()%>건</td>
				<td class="top2"><%=data.get(i).getRcvaddress()%><br><%=data.get(i).getMessage()%><br><%=data.get(i).getRcvphone()%></td>
				<td class="top3">\ <%=data.get(i).getTotalprice() %></td>
				<td class="top4"><button onclick="viewdetail(<%=i%>,<%=dataE.size()%>)"><img src="" >주문내역 상세보기</button></td>
			</tr>
			</table>
		</div>
		
		<%for(int j=0; j<dataE.size(); j++) {%>
			<div id="detail<%=i%><%=j%>" class="detail">
				<table>
				<tr><%String img=DB.getimage(dataE.get(j).getItemno());%>
					<td class="list0">≫</td>
					<td class="list1">
					<%if(img.substring(0,4).equals("http")){ %>
						<img src="<%=img%>">
					<%}else{ %>
						<img src="/../img_item/<%=img%>">
					<%} %>
										</td>
					<td class="list2"><div><%=dataE.get(j).getItemname()%></div> <!--제목 -->
									<div>종류 : <%=dataE.get(j).getItemshape()%><br>사이즈 : <%=dataE.get(j).getItemsize()%></div> <!--옵션 -->
									<div>수량 : <%=dataE.get(j).getHowmany()%></div> <!--수량 -->
					<td class="list3">\ <%=dataE.get(j).getEachprice()*dataE.get(j).getHowmany()%></td>
				</tr>
				</table>
			</div>
			<%}
			for(int z=0; z<dataE.size(); ){
				dataE.remove(z);
			}
			%>
	<%}%>
	<div style="border-top:1px solid lightgray; height:100px;"></div>
</div>
</body>
</html>