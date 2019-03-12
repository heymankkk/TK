<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.SofaDataDB" %>
<%@ page import="project.SofaDBBean" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/listselect.js"></script>
<link rel="stylesheet" type="text/css" href="../css/title.css">

<%
 	String pageNum=request.getParameter("pageNum");
	int pageSize=24;   // 1페이지에 찍어내는 DB 개수 
	if(pageNum==null){
		pageNum="1";
	}
	String choice=request.getParameter("choice");
	if(choice==null){
		choice="itemno";
	}
	String choice1=choice;
	
	int currentPage=Integer.parseInt(pageNum); 
	int startRow=(currentPage-1)* pageSize; // 2페이지 기준  24~ 1페이지 0~23(24개) 
	int totalDB=0;
	int search1 = 0;
	int search2 = 0;
	
	if(request.getParameter("min")!=null){
		 search1 =Integer.parseInt((request.getParameter("min")));
	}
	 
	if(request.getParameter("max")!=null){
		search2 =Integer.parseInt((request.getParameter("max")));
	} 
	
	SofaDBBean dbpro = SofaDBBean.getSofaDB();  // import
	List<SofaDataDB> sofalist = dbpro.loadimg(startRow, pageSize, choice, search1, search2);
	
	
	totalDB=dbpro.selectCount(search1, search2);  // DB 총갯수 잘 저장됨	
	
	
	if(choice1.equals("itemprice")){
		choice1="가격순";
	}else if(choice1.equals("itemno")){
		choice1="관련도순";
	}else if(choice1.equals("reg_date")){
		choice1="신규상품순";
	}else if(choice1.equals("itemname")){
		choice1="이름순";
	} 
%>
<meta charset="UTF-8">

<title>모든 소파</title>
</head>
<body>
<div id="header">
	<jsp:include page="../index/Header.jsp" flush="false"></jsp:include>
</div>
<div id="whole">
	<div id="mainheader">
		<div id="index">
			<a href="#">IKEA</a> > <a href="#">모든소파</a>  
		</div>
		<div id="title">
		 <p> 모든 소파 </p>
		</div>
		<div id="search">
			<div id="sarea">
				<form action="/Teamproject/Filter" method="post">
 					<label>가격 범위(\)</label> &nbsp;

					<input type="text" id="minprice" name="search1"> -
					<input type="text" id="maxprice" name="search2">
					<input type="submit" class="filter" value="필터">
				</form>
			</div>
			
						
			<div id="orderby">
				 <select id="by" onchange="orderbychange()">
				 	<option><%=choice1%></option>
					<option value="itemno">관련도순</option>
					<option value="itemname">이름순</option>
					<option value="itemprice">가격순</option>
					<option value="reg_date">신규상품순</option>
				</select>
			</div>
		</div><!--  searchdiv의 끝 -->
	</div><!-- mainheader의 끝 -->
	
	
		<div id="titleimg">
			<img src="../img/sofahead.jpg">
		</div>
		
		<div id="subtitle">
			<p>모든 소파</p>
		</div>
		
	<div id="content">
		
			
		<div id="Kimg">
<%
				if(currentPage==1){
					for(int i=0; i<sofalist.size(); i++){
%>	
		  
			<div id="Qimg" onMouseOver="showimg<%=i%>()">
				<img src="../img/<%=sofalist.get(i).getImage() %>">
				<br><br>
				<div id="p1">
					ItemNo: <%= sofalist.get(i).getItemno()%><br><br>
				</div>
				<div id="p2">
					<%=sofalist.get(i).getItemname()%><br><br>
				</div>
				<div id="p3">
					PRICE: ￦<%= sofalist.get(i).getItemprice() %>
				</div>
			</div>
			
<%
					}for(int y=0; y<sofalist.size(); y++){
%>
		
		   <div id="KKimg<%=y%>" onMouseleave="hideimg<%=y%>()" onclick="location.href='itempage.jsp?itemno=<%=y+1%>'">
		  		<img src="../img/<%=sofalist.get(y).getImage() %>"/>
		  			<div id="p1">
		  				ItemNo: <%= sofalist.get(y).getItemno() %>
		  			</div>		  			
		  			<div id="p5">
						BRAND: <%=sofalist.get(y).getItemname()%><br>
					</div>
					<div id="p4">
						제품설명: <%=sofalist.get(y).getItemcontent() %><br><br><br>
					</div>
					<div id="p3">
						PRICE: ￦<%= sofalist.get(y).getItemprice() %>
					</div>

					<input type="button" name="buy" id="buy" value="구매하기"><br>
					<input type="button" name="addwish" id="addwish" value="위시리스트추가">
					
		   </div>
		  
<%			
				}
%>
			
<% 				}else if(currentPage==2){
					
					for(int i=0; i<sofalist.size(); i++){
%>
			<div id="Qimg" onMouseOver="showimg<%=i%>()">
				<img src="../img/<%=sofalist.get(i).getImage() %>">
				<br><br>
				<div id="p1">
					ItemNo: <%= sofalist.get(i).getItemno()%><br><br>
				</div>
				<div id="p2">
					<%=sofalist.get(i).getItemname()%><br><br>
				</div>
				<div id="p3">
					PRICE: ￦<%= sofalist.get(i).getItemprice() %>
				</div>
			</div>	
<% 
				}for(int y=0; y<sofalist.size(); y++){
%>
		  <div id="KKimg<%=y%>" onMouseleave="hideimg<%=y%>()" onclick="location.href='itempage.jsp?itemno=<%=y+25%>'">
		  	<img src="../img/<%=sofalist.get(y).getImage() %>">
		  		<div id="p1">
		  				ItemNo: <%= sofalist.get(y).getItemno() %>
		  			</div>		  			
		  			<div id="p5">
						BRAND: <%=sofalist.get(y).getItemname()%><br>
					</div>
					<div id="p4">
						제품설명: <%=sofalist.get(y).getItemcontent() %><br><br><br>
					</div>
					<div id="p3">
						PRICE: ￦<%= sofalist.get(y).getItemprice() %>
					</div>

					<input type="button" name="buy" id="buy" value="구매하기"><br>
					<input type="button" name="addwish" id="addwish" value="위시리스트추가">
		   </div>
<%
				}
%>
			
<%
				}else if(currentPage==3){
		
					for(int i=0; i<sofalist.size(); i++){
%>
			<div id="Qimg" onMouseOver="showimg<%=i%>()">
				<img src="../img/<%=sofalist.get(i).getImage() %>">
				<br><br>
				<div id="p1">
					ItemNo: <%= sofalist.get(i).getItemno()%><br><br>
				</div>
				<div id="p2">
					<%=sofalist.get(i).getItemname()%><br><br>
				</div>
				<div id="p3">
					PRICE: ￦<%= sofalist.get(i).getItemprice() %>
				</div>
			</div>
<% 
					}for(int y=0; y<sofalist.size(); y++){
%>
		  <div id="KKimg<%=y%>" onMouseleave="hideimg<%=y%>()" onclick="location.href='itempage.jsp?itemno=<%=y+49%>'">
		  	<img src="../img/<%=sofalist.get(y).getImage() %>">
		  		<div id="p1">
		  				ItemNo: <%= sofalist.get(y).getItemno() %>
		  			</div>		  			
		  			<div id="p5">
						BRAND: <%=sofalist.get(y).getItemname()%><br>
					</div>
					<div id="p4">
						제품설명: <%=sofalist.get(y).getItemcontent() %><br><br><br>
					</div>
					<div id="p3">
						PRICE: ￦<%= sofalist.get(y).getItemprice() %>
					</div>

					<input type="button" name="buy" id="buy" value="구매하기"><br>
					<input type="button" name="addwish" id="addwish" value="위시리스트추가">
		  </div>
<%
					}
	}
%>
			<div id="page">
<%
		//pageCount:총페이지 = 총DB개수/총페이지 + (총DB갯수 % 총페이지 --> true일경우 +0  false일 경우 +1)
		int pageCount = totalDB/pageSize + (totalDB % pageSize==0?0:1);
		
		int startPage=1;
		
		if(currentPage % 5 !=0){
			startPage=(int)(currentPage/5)*5+1;  //현재페이지가 1페이지 인경우 --> 1 6페이지인경우--> 6  11페이지 인경우--> 11
		}else{
			startPage=(int)(currentPage/5-1)*5+1; //현재페이지가 5페이지인 경우 -->1 10페이지인경우-->6 
		}
		
		
		int endPage = startPage + 4;
		
		if(endPage>pageCount){
			endPage=pageCount;
		}
		if(startPage>5){
%>
			<a href="sofa.jsp?pageNum=<%= startPage-5 %>">[이전]</a>
<%
		}
	for(int i=startPage; i<=endPage; i++){
%>
		<a href="sofa.jsp?pageNum=<%= i %>&min=<%=search1%>&max=<%=search2%>">[<%=i %>] </a>
<% 
	}
		if(endPage<pageCount){			
%>
			<a href="sofa.jsp?pageNum=<%=startPage+5 %>">[다음]</a>
<%
		}
	
%>	 
	 </div>	<!-- page의 끝 -->

	  </div><!-- Kimg의 끝 -->
	  		 


	</div><!-- content의 끝 -->
</div><!-- whole 전체의 끝 -->	
</body>
</html>