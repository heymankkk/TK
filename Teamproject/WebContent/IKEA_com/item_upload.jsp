<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.MakeDB_connect"%>
<%@ page import="new_product.SelectDB_data"%>
<%@ page import="new_product.DB_connect"%>
<%@ page import="new_product.hashtag"%> 
<!DOCTYPE html>
<html>
<head>
<%	String abc=(String)session.getAttribute("wright");
	int wright=10;
	if(abc==null){
		%>
		<script>alert("로그인 후 이용할 수 있습니다."); location.href="/Teamproject/IKEA_com/IKEA_COM.jsp"</script>
		<%
	}else if(abc.equals("1")){
		wright = Integer.parseInt(abc);
	}else{
		%>
		<script>alert("판매권한이 없습니다."); location.href="/Teamproject/IKEA_com/IKEA_COM.jsp"</script>
		<%
	}
	DB_connect DB = new DB_connect();
	int selno = DB.getselno((String)session.getAttribute("custno"));
	int shape=Integer.parseInt(request.getParameter("shape"));
	int size=Integer.parseInt(request.getParameter("size"));
	//	request.getParameter("selno");	회원자격 부여되면 selno 추가
	hashtag Hash = hashtag.getHash();
	String[] hash=Hash.HashCate();
%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/item_upload.css"/>
<link href="https://fonts.googleapis.com/css?family=Biryani:800" rel="stylesheet">
<script type="text/javascript" src="../js/item_upload.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<form action="../item_upload_process" method="post" enctype="multipart/form-data">
<div id="main">
	<div id="item_container">
		<table>
			<tr>
				<th><div id="opt">종류</div>
					<div class="option_button" onclick="shape_add()" id="add">+</div>
					<div class="option_button" onclick="shape_sub()">-</div></th>
				<td>
					<%for(int i=1; i<=shape; i++){ %>
						<input type="text" class="shape" name="itemshape<%=i%>" required> 
					<%} %>
				</td>
			</tr>
			<tr>
				<th><div id="opt">사이즈</div>
				<div class="option_button" onclick="size_add()" id="add">+</div>
				<div class="option_button" onclick="size_sub()">-</div></th>
				<td>
				<%for(int i=1; i<=size; i++){ %>
						<input type="text" class="shape" name="itemsize<%=i%>" required> 
				<%} %>
				</td>
			</tr> 
				
			<tr>
				<th>상품명</th>
				<td><input type="text" name="itemname" class="top" maxlength="13" required></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="itemprice" class="top" required></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="itemcontent" ></textarea></td>
			</tr>
			<tr>
				<th>카테고리 I </th>
				<td><input type="text" id="category1" name="category1" class="category11" value="모든 제품" readonly><div class="category111" onclick="cateA()">카테고리 찾기</div></td>
			</tr>
			<tr>
				<th>카테고리 II </th>
				<td><input type="text" id="category2" name="category2" class="category11" value="모든 제품" redonly><div class="category111" onclick="cateB()">카테고리 끄기</div></td>
			</tr>
			<tr>
				<th><div id="img">제품사진</div>
				<td>
					<input type="file" class="img2" name="image1" onchange="loadImg1(this)">
					<input type="file" class="img2" name="image2" onchange="loadImg2(this)">
					<input type="file" class="img2" name="image3" onchange="loadImg3(this)">
					<input type="file" class="img2" name="image4" onchange="loadImg4(this)">
					<input type="file" class="img2" name="image5" onchange="loadImg5(this)">
				</td>
			</tr>
		</table>
	</div>
		
	<div id="image_container">
		<div id="cate1" class="cate"><table>
			<tr><th>카테고리I</th><td onclick="gory1(this)">전자기기</td><td onclick="gory1(this)">가구</td><td onclick="gory1(this)">욕실</td><td onclick="gory1(this)">홈데코</td><td onclick="gory1(this)">어린이</td></tr>
		</table></div>
		<div id="cate2" class="cate"><table>
			<tr><th rowspan="5">카테고리II</th>
			<%for(int i=1; i<=hash.length; i++){ %>
				<td onclick="gory2(this)"><%=hash[i-1]%></td>
				<%if(i==5||i==10||i==15||i==20) {%></tr><tr><%}
			  }%></tr>
		</table></div>
		<div id="image_main">
			<div id="setimage1"></div>
		</div>
		<div id="image_add">  
		<%for(int i=2; i<6;i++){%>
			<div id="setimage<%=i%>" class="setimage"></div>
		<%}%>
		</div>
		<div id="end">
			<input type="submit" value="상품등록">
		</div>
	</div>
	
</div>
<input type="hidden" value="<%=selno%>" name="selno">
</form>
<input type="hidden" value="<%=shape%>" id="shape">
<input type="hidden" value="<%=size%>" id="size">
</body>
</html>