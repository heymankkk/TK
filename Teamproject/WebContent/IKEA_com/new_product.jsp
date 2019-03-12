<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="new_product.hashtag"%> <!-- 해시태그 임폴트 -->
<%@ page import="new_product.DB_connect"%> <!-- DB 임폴트 -->
<%@ page import="new_product.DB_data"%> <!-- data 임폴트 -->
<%@ page import="java.util.List" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	DB_connect DB = DB_connect.getDB();

	String listNum=request.getParameter("listNum");
	if(listNum==null){listNum="1";}
	int currentList=Integer.parseInt(listNum);
	int listSize=25;
	int pageSize=10;
	int startRow=(currentList-1)*listSize;
	String order0="";
	String order=request.getParameter("order");
	if(order==null){order="itemprice";}
	if(order.equals("itemno")){order0="신규상품순";}
	if(order.equals("category2")){order0="관련도별";}
	if(order.equals("itemname")){order0="이름순";}
	if(order.equals("itemprice")){order0="낮은가격순";}
	if(order.equals("itemprice desc")){order0="높은가격순";}
	
	String where="where category2='"+request.getParameter("where")+"'";
	if(where.equals("where category2='null'")){where="";}
	
	List<DB_data> list = DB.list(order, startRow, listSize, where);
	int count=DB.count();  
	int totalList=count/listSize+(count%listSize==0?0:1);
	int startList=1;
	if(currentList%pageSize!=0){
		startList=(int)(currentList/pageSize)*pageSize+1;
	}else{
		startList=(int)((currentList/pageSize)-1)*pageSize+1;
	}
	int endList=startList+9;
	if(endList>totalList){
		endList=totalList;
	}
	
		
	DecimalFormat df = new DecimalFormat("#,###.##");
	
	
%>
<script type="text/javascript" src="../js/new_product.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<link rel="stylesheet" type="text/css" href="../css/new_product.css"/>
<% 
	hashtag Hash = hashtag.getHash();
	String[] hash=Hash.Hash();
%><!-- 해시태그 임폴트 -->
<meta charset="UTF-8">
<title>신제품</title>
</head>
<body>
<div id="all">
<div id="mid"> <!-- width:1600, padding:300 -->
	<p id="subject">IKEA 신제품<p>
	<div id="list">
		<%
		for(int i=0; i<hash.length; i++){
		%><a href="IKEA_COM.jsp?pageName=new_product.jsp&where=<%=hash[i]%>"><span><%=hash[i]%></span></a>
		
		<%
		}
		%>
	</div>
	<hr>
	<div id="">
		<div id="select">
			<div id="select_view">
			<select name="aaa" id="aaa" onchange="select()">
				<option><%=order0 %></option>
				<option value="itemno">신규상품순</option>
				<option value="category2">관련도별</option>
				<option value="itemname">이름순</option>
				<option value="itemprice">낮은가격순</option>
				<option value="itemprice desc">높은가격순</option>
			</select>
			</div>
			<a href=""><span id="select_button">슬라이드쇼</span></a>
			<a href=""><span id="select_button_blue">비교표시</span></a>
			</div>
		<div id="paging">
<%
	if(currentList>3){	
%>	<a href="IKEA_COM.jsp?pageName=new_product.jsp&listNum=<%=1%>">1</a> . . . 
<%}
	
	for(int i=currentList-2; i<=currentList+2; i++){
		if(i<1){continue;}
		if(i>totalList){continue;}
%>
		<a href="IKEA_COM.jsp?pageName=new_product.jsp&listNum=<%=i%>"><%=i%></a>
<%}
	if(currentList<totalList-2){		%>
		 . . . <a href="IKEA_COM.jsp?pageName=new_product.jsp&listNum=<%=totalList%>"><%=totalList%></a>
<%}
%>				
		</div>
		<div id="product">			
<%
	for(int j=0; j<list.size(); j++){
	String price=df.format(list.get(j).getItemprice());
%>		<a href="IKEA_COM.jsp?pageName=view_product.jsp&itemno=<%=list.get(j).getItemno()%>">
			<div id="product_view_mouse<%=j+1%>" class="product_view_mouse"  onmouseleave="test<%=j+101%>()">
				<%
				int parp = 0;
				if(list.get(j).getImage1().substring(0,4).equals("http")){
					parp = 1;
				}
				if(parp==0){%>
					<img src="/../img_item/<%=list.get(j).getImage1()%>" class="product_image" />
				<%}else{%>
					<img src="<%=list.get(j).getImage1()%>" class="product_image" />
				<%} %>
				
				<div class="product_name"><%=list.get(j).getItemname()%></div>
				<div class="product_category2"><%=list.get(j).getCategory1()+" " %> > <%=list.get(j).getCategory2()+" " %></div>
				<span class="product_price">\ <%=price%></span><span style="font-size:17px; font-weight:600px">  / 개</span>
				<div style="margin:4px 0px 0px 10px">폭:      길이:      높이:      </div>
				<div style="margin:0px 0px 16px 10px; color:blue">다른 옵션 사용 가능</div>
				<span onclick="alert('공사중 - 상품페이지에서 구매가능')" class="product_view_mouse_get">구매하기</span><br><br>
				<span onclick="alert('공사중 - 상품페이지에서 구매가능')" class="product_view_mouse_get">장바구니</span>
			</div></a>
			
			<div id="product_view<%=j+1%>" class="product_view"  onmouseover="test<%=j+1%>()"><br>
				<%if(parp==0){%>
					<img src="/../img_item/<%=list.get(j).getImage1()%>" class="product_image" />
				<%}else{%>
					<img src="<%=list.get(j).getImage1()%>" class="product_image" />
				<%} %>
				<div class="product_name"><%=list.get(j).getItemname()%></div>
				<div class="product_category2"><%=list.get(j).getCategory1()+" " %> > <%=list.get(j).getCategory2()+" " %></div>
				<span class="product_price">\ <%=price%></span><span style="font-size:17px; font-weight:600px">  / 개</span>
			</div>
<%}%>

			<div id="paging">
<%
	if(currentList>3){	
%>	<a href="IKEA_COM.jsp?pageName=new_product.jsp&listNum=<%=1%>">1</a> . . . 
<%}
	
	for(int i=currentList-2; i<=currentList+2; i++){
		if(i<1){continue;}
		if(i>totalList){continue;}
%>
		<a href="IKEA_COM.jsp?pageName=new_product.jsp&listNum=<%=i%>"><%=i%></a>
<%}
	if(currentList<totalList-2){		%>
		 . . . <a href="IKEA_COM.jsp?pageName=new_product.jsp&listNum=<%=totalList%>"><%=totalList%></a>
<%}
%>				
			</div>
		</div>
	</div>
</div>
</div>
<div style="height:100px;"></div>
</body>
</html>