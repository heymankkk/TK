<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.DB_connect"%>
<%@ page import="new_product.DB_data"%>
<%@ page import="java.util.List" %>
<%@ page import="project.SofaDBBean" %>
<%@ page import="project.ReviewDBBean" %>
<%@ page import="project.ReviewDataDB" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	DB_connect DB = DB_connect.getDB();
	int itemno = Integer.parseInt(request.getParameter("itemno"));
	DB_data data = DB.view(request.getParameter("itemno"));
	data.setShape();
	List<String> shape = data.getShape();
	data.setSize();
	List<String> size = data.getSize();
	data.setImgcount();
	List<String> imgcount = data.getImgcount();
	
	int score=data.getScore();
	
	String pageNum="1";
	if(request.getParameter("pageNum")!=null){
		 pageNum= request.getParameter("pageNum");		
	}
	int pageSize=7; // 페이지당 댓글갯수
	int currentPage = Integer.parseInt(pageNum);
	int startRow=(currentPage-1)* pageSize; // 2페이지기준  7번째부터 시작이니까 1페이지기준 0~6번째까지
	int reviewtotal=0;
	String choice = request.getParameter("choice");
	if(choice==null){
		choice = "reg_date asc";
	}
	String choice1 = choice ;
	
	
	ReviewDBBean rdb = ReviewDBBean.getReviewDB();
	List<ReviewDataDB> rvlist = rdb.loadreview(itemno, choice, startRow, pageSize);
	
	reviewtotal=rdb.reviewCount(itemno);
	
	if(choice1.equals("reg_date asc")){
		choice1 = "가장 최근순";
	}
	if(choice1.equals("reg_date desc")){
		choice1 = "가장 오래된순";
	}
	if(choice1.equals("starscore desc")){
		choice1 = "높은 평점순";
	}
	if(choice1.equals("starscore asc")){
		choice1 = "낮은 평점순";
	}
	
	int parp = 0;
	if(data.getImage1().substring(0,4).equals("http")){
		parp = 1;
	}
%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/view_product.css"/>
<link href="https://fonts.googleapis.com/css?family=Biryani:800" rel="stylesheet">
<script type="text/javascript" src="../js/view_product.js"></script>

<script type="text/javascript" src="../js/view_item.js"></script>
<link rel="stylesheet" type="text/css" href="../css/view_item.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<div id="main">
	<div id="image_container">
		<div id="image_main">
		<%if(parp==0){ %>
			<img src="/../img_item/<%=data.getImage1()%>" id="getimage">
			</div>
			<div id="image_add">  
			<%for(int i=0; i<(imgcount.size()-1); i++){%>
				<img src="/../img_item/<%=imgcount.get(i+1)%>" onclick="image_change<%=i+2%>()" id="setimage<%=i+2%>">
			<%}%>
			<!-- 메모장 복사내용 위치 -->
		<%}else{ %>
			<img src="<%=data.getImage1()%>" id="getimage">
			</div>
			<div id="image_add">  
			<%for(int i=0; i<(imgcount.size()-1); i++){%>
				<img src="<%=data.getImage1()%>" onclick="image_change<%=i+2%>()" id="setimage<%=i+2%>">
			<%}%>
		<%} %>
		</div>
	</div>
	<div id="item_container">
		<div id="itemname">
		<%=data.getItemname() %>
		</div>
		<div id="category">
		<%=data.getCategory1()%> - <%=data.getCategory2()%>
		</div>
		<span id="itemprice">
		<%
		DecimalFormat df = new DecimalFormat("#,###.##");
		String price=df.format(data.getItemprice());
		%>
		$ <%=price %>
		</span> <b style="font:size:17px"> / 개</b><br>
		<small>선택옵션 포함가격</small>
		<div id="itemno">
		제품번호 : <%=data.getItemno() %>
		</div>
		<div id="item_score">
		<img src="../img_item/score<%=score%>.jpg"/><%=((float)score)/2 %> 상품평 <!--  -->
		</div>
		<div id="itemcontent">
		<%=data.getItemcontent() %>
		</div>
		<div id="product_size">
		<%if(size.size()==1) {%>
			규격 : <%=size.get(0)%>
		<%} %>
		</div>
		<%if(shape.size()!=0){%>
		<div id="itemoption1">
			<button id="chg" name="itemoption1" onclick="itemoption1()">옵 션   :  <%=data.getItemshape1() %></button>
			<ul id="itemoption11" class="itemoption11">
				<%for(int i=0; i<shape.size();i++){%>
					<li onclick="optchg<%=i+1%>()"><span class="opimg">
					<%if(parp==0){ %>
						<img src="/../img_item/<%=data.getImage1()%>"/>
					<%}else{ %>
						<img src="<%=data.getImage1()%>"/>
					<%} %></span>
				 	<div id="optchg<%=i+1%>"><%= shape.get(i) %></div></li>  
				<%} %>	
			</ul>
		</div>
		<%} %>
		<%if(size.size()>1){ %>
		<div id="itemoption2">
			<button id="chgg" name="itemoption2" onclick="itemoption2()">옵 션   :  <%=data.getItemsize1() %></button>
			<ul id="itemoption22" class="itemoption22">	
				<%for(int i=0; i<size.size();i++){%>
					<li onclick="optchgg<%=i+1%>()"><span class="opimg">
					<%if(parp==0){ %>
						<img src="/../img_item/<%=data.getImage1()%>"/>
					<%}else{ %>
						<img src="<%=data.getImage1()%>"/>
					<%} %></span>
				 	<div id="optchgg<%=i+1%>"><%= size.get(i) %></div></li>  
				<%} %>
			</ul>
		</div>
		<%} %>
		<div id="product_count">
			<div id="product_wish">
			<script>
				function addwish(){
					var custno=<%=session.getAttribute("custno")%>;
					if(custno!=null){
						var count=document.getElementById("item_count").value;
						var shape="";
						if(document.getElementById("chg")!=null){
							shape=document.getElementById("chg").innerHTML;
						}
						shape=shape.replace("옵 션   :  ","")
						var size="";
						if(document.getElementById("chgg")!=null){
							size=document.getElementById("chgg").innerHTML;
							size=size.replace("옵 션   :  ","")
						}else{
							size=document.getElementById("product_size").innerHTML;
							size=size.replace("규격 :  ","")
						}
						var itemno=document.getElementById("itemno").innerHTML;
						itemno=itemno.replace("제품번호 : ","")
						var price=document.getElementById("priceset").value;
						var method="add";
						var selno=document.getElementById("selno").value;
						alert("위시리스트에 추가되었습니다.");
						location.href="/Teamproject/wish_pro?count="+count+"&custno="+custno+"&shape="+shape+"&size="+size+"&itemno="+itemno+"&price="+price+"&selno="+selno+"&method="+method;
					}else{
						alert("로그인 후 이용가능합니다.");
					}
				}
			</script>
			<img src="../img/product_add.jpg"/><div onclick="addwish()">위시리스트에 추가</div>
			</div>
			<span>수량 : </span><input type="text" value="1" id="item_count" name="item_count" onchange="itemcount22()">
		</div>
		<div id="product_buy">
		<img src="../img/product_buy.jpg"/><div onclick="addcart()">바로 구매하기</div>
		</div>
		<div id="product_add">
			<p></p>
			<b>합계 : </b><input type="text" id="priceget" value="<%="$ "+price %>" readonly>
			<img src="../img/product_buy.jpg"/><span onclick="addcart()">장바구니에 추가</span>
		</div>
	</div>
</div>	
	
	
	<div id="bot">
		<div class="botTitle">
			<ul class="botlist">
				<li class="iteminfo">제품정보</li>
				<li class="around">재질 및 환경</li>
				<li class="doc">조립 및 문서</li>
				<li class="comp">구성품</li>
				<li class="review">상품평</li>
				<li class="officialinfo">고시정보</li>				
			</ul>
		</div>
	</div>
	<div class="botmenu">
		<div class="botinfo">
			<div class="listTitle">
				<span>상품평</span>
				<div class="buttonarea">
					<input type="button" id="reviewbutton" name="reviewbutton" value="상품평쓰기" onclick="showPopup()">
					<input type="hidden" id="popup" value=<%=request.getParameter("itemno") %>>
				</div>
			</div>
		<div class="contentheader">
			<span> 페이지상품평 갯수(<%=startRow+1 %>~<%=startRow+7 %>) / 총상품평<%=reviewtotal %></span>
			<select id="filter" name="filter">
				<option value="shortest">가장최근순</option>
				<option value="longest">가장오래된순</option>
				<option value="highest">높은평점순</option>
				<option value="lowest">낮은평점순</option>
			</select>
		</div>
		<div class="contentline">
<%
			for(int i=0; i<rvlist.size(); i++){
%>			<div class="review_list">
				<div class="r1"><img src="../img_item/score<%=rvlist.get(i).getStarscore()%>.jpg"></div>
				<div class="r2"><%=rvlist.get(i).getNickname() %></div>
				<div class="r3"><%=rvlist.get(i).getReg_date() %></div>
				<div class="r4"><%=rvlist.get(i).getSubject() %></div>
				<div class="r5"><%=rvlist.get(i).getContent() %></div>
			</div>
<%		
		}
%>
		<div class="page">
<%			//pageCount:총페이지=총DB개수/총페이지 + (총DB갯수 % 총페이지 --> true일경우 +0  false일 경우 +1)
			int pageCount = reviewtotal/pageSize + (reviewtotal % pageSize==0?0:1);
			int startPage=1;
			if(currentPage % 5 !=0){
				startPage=(int)(currentPage/5)*5+1;
			}else
				startPage=(int)(currentPage/5-1)*5+1;
			int endPage = startPage+4;
			if(endPage>pageCount){
				endPage=pageCount;
			}
			if(startPage>5){
%>		<a href="IKEA_COM.jsp?pageName=view_product.jsp&pageNum=<%=startPage-5%>&itemno=<%=itemno%>">[이전]</a>
<%			}
			for(int i=startPage; i<=endPage; i++){
%>		<a href="IKEA_COM.jsp?pageName=view_product.jsp&pageNum=<%=i %>&itemno=<%=itemno%>"><button class="rvPbutton" value="<%=i %>"><%=i %></button></a>
<%			}
			if(endPage<pageCount){
%>		<a href="IKEA_COM.jsp?pageName=view_product.jsp&pageNum=<%=startPage+5 %>&itemno=<%=itemno%>">[다음]</a>
<%
			}
%>			</div>
		</div>
	</div>
</div>

<input type="hidden" id="priceset" value="<%=data.getItemprice()%>">
<input type="hidden" id="selno" value="<%=data.getSelno()%>">
</body>
</html>