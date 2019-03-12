<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="HomeFurnishing.HomefurnishingData" %>
<%@page import="HomeFurnishing.HomefurnishingServer" %>
<!DOCTYPE html>
<html>
<head>
<%
	List<HomefurnishingData> homelist=null;
	HomefurnishingServer homeserver = HomefurnishingServer.getHomefurnishingServer();
%>
<link rel="stylesheet" href="../css/HomeFurnishing.css" type="text/css"/>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/HomeFurnishing.js"></script>
<meta charset="UTF-8">
<title>홈퍼니싱 아이디어</title>
<script>
</script>
</head>
<body>
	<div id="homefurnishing_body">
		<div id="homefurnishing_logo">
			<img onclick="location.href='../index/MainContent.jsp'" src="../img/Header/3.PNG"/>
		</div>
		<div id="homefurnishing_category">
			<div id="homefurnishing_IKEA">
				<img src="../img/HomeFurnishing/menu1.png"/>
			</div>
			<div id="homefurnishing_HOME">
				<img src="../img/HomeFurnishing/menu2.png"/>
			</div>
			<div id="homefurnishing_SOCIAL">
				<img src="../img/HomeFurnishing/menu3.png"/>
			</div>
		</div>
		<div id="homefurnishing_menu">
			<div onclick="content_write()">아이디어 보내기
			</div>
			<div id="homefurnishing_menu_filter" onclick="filterlist()"><%if(request.getParameter("filter")!=null){%><%=request.getParameter("filter") %><%}else{%>전체보기<%}%>
			</div>
			<div>로그인
			</div>
		</div>
			<div id="filterlist">
				<ul class="list-unstyled">
					<li class="init" onclick="filterlistchange(this)" value="전체보기">전체보기</li>
					<li onclick="filterlistchange(this)" value="침실">침실</li>
					<li onclick="filterlistchange(this)" value="거실">거실</li>
					<li onclick="filterlistchange(this)" value="주방">주방</li>
					<li onclick="filterlistchange(this)" value="욕실">욕실</li>
					<li onclick="filterlistchange(this)" value="홈오피스">홈오피스</li>
					<li onclick="filterlistchange(this)" value="어린이방">어린이방</li>
					<li onclick="filterlistchange(this)" value="다이닝">다이닝</li>
					<li onclick="filterlistchange(this)" value="다용도실">다용도실</li>
					<li onclick="filterlistchange(this)" value="현관">현관</li>
					<li onclick="filterlistchange(this)" value="발코니">발코니</li>
					<li onclick="filterlistchange(this)" value="기타">기타</li>
				</ul>
			</div>
		<div id="homefurnishing_content">
		<%
		if(request.getParameter("filter")!=null){
			String test = request.getParameter("filter");
			homelist = homeserver.selecthome(test);
		}
		else{
			String test = "전체보기";
			homelist = homeserver.selecthome(test);
		}
		
		int c = 8;
		if(homelist.size()<8){
			c = homelist.size();
		}
		for(int a=0; a<=homelist.size()/8; a++){
			if(a*8!=homelist.size()){
				if(a!=0){
		%>
				<div id="homefurnishing_more" <%if(a!=1){%>style="display: none;"<%}%>>
					<img onclick="homefurnishing_more(this)" src="../img/HomeFurnishing/more.png"/>
				</div>
		<%
				}
		 %>
			<div id="homefurnishing_none" <%if(a!=0){%>style="display: none;"<%} %>>
		<%
			}
			for(int b=a*8; b<c; b++){
				HomefurnishingData HD = homelist.get(b);
		%>
				<div id="homefurnishing_content_0" onclick="homefurnishingview(this)">
					<div id="homefurnishing_content_1">
						<div id="homefurnishing_content_1_img">
							<img src="../img/HomeFurnishing/content/<%=HD.getHomeimg() %>"/>
						</div>
					</div>
					<div id="homefurnishing_content_2">
						<div id="homefurnishing_content_2_date"><%=HD.getHomedate() %></div>
						<div id="homefurnishing_content_2_like"><img src="../img/HomeFurnishing/like.png"/><%=HD.getHomelike() %></div>
						<div id="homefurnishing_content_2_writer"><%=HD.getHomewriter() %></div>
						<div id="homefurnishing_content_2_content"><%=HD.getHomecontent() %></div>
					</div>
					<input id="homefurnishing_content_number" type="hidden" value='<%=HD.getHomeno() %>'>
				</div>
		<%
			}
		%>
			</div>
		<%
			if((homelist.size()-c)>=8){
				c = c+8;
			}
			else{	
				c = (c+(homelist.size()-c));
			}
		}
		%>
		</div>
	</div>
	<%
	String filter = "전체보기";
	if(request.getParameter("filter")!=null){
		filter = request.getParameter("filter");
	}
	if(request.getParameter("number")!=null){	
		String numberstr = request.getParameter("number");
		int number = Integer.parseInt(numberstr);
		int backno = 0;
		int nextno = 0;
		HomefurnishingServer homeviewserver = HomefurnishingServer.getHomefurnishingServer();
		HomefurnishingData homeview = homeviewserver.selecthomeview(number);
		
		if(homeviewserver.viewbackno(number, filter)!=null){
			backno = Integer.parseInt(homeviewserver.viewbackno(number, filter));
		}
		if(homeviewserver.viewnextno(number, filter)!=null){
			nextno = Integer.parseInt(homeviewserver.viewnextno(number, filter));
		}
		/* int backno = homeviewserver.viewbackno(number); */
		/* int nextno = homeviewserver.viewnextno(number); */
		
	 %>
	 <div id="homefurnishing_content_view_background">
			<div id="homefurnishing_content_view">
				<div id="homefurnishing_content_view_exit">
					<button onclick="returnhomefurnishing()">X</button>
				</div>
				<div id="homefurnishing_content_view_back">
					<button onclick="viewbackno(this)">〈</button>
					<input id="backvalue" type="hidden" value="<%=backno %>"/>
				</div>
				<div id="homefurnishing_content_view_0">
					<div id="homefurnishing_content_view_img">
						<img src="../img/HomeFurnishing/content/<%=homeview.getHomeimg()%>"/>
					</div>
					<div id="homefurnishing_content_view_content">
						<div id="homefurnishing_content_view_content_title">
							<%=homeview.getHomewriter()%>
						</div>	<!-- 제목 -->
						<div id="homefurnishing_content_view_content_like">
							<%=homeview.getHomelike()%>
						</div> <!-- 좋아요 카운트 -->
						<div id="homefurnishing_content_view_content_likeimg">
							<img src="../img/HomeFurnishing/like.png"/>
						</div> <!-- 좋아요 이미지 -->
						
						<div id="homefurnishing_content_view_content_content">
							<%=homeview.getHomecontent()%>
						</div> <!-- 내용 -->
						<div id="homefurnishing_content_view_content_date">
							<%=homeview.getHomedate()%>
						</div> <!-- 날짜 -->
						<div id="homefurnishing_content_view_content_hashtag">
							<%=homeview.getHomehashtag()%>
						</div> <!-- 해시태그 -->
						<div id="homefurnishing_content_view_content_smallimg">
							<img src="../img/HomeFurnishing/content/<%=homeview.getHomeimg()%>"/>
						</div> <!-- 작은 이미지 -->
						<div id="homefurnishing_content_view_content_btn">
							<button>추천하기</button>
						</div>	<!-- 추천버튼 -->
					</div>
				</div>
				<div id="homefurnishing_content_view_next">
					<button onclick="viewnextno(this)">〉</button>
					<input id="nextvalue" type="hidden" value="<%=nextno %>"/>
				</div>
			</div>
	</div>
	<%
	}
	%>
	<div id="homefurnishing_write">
		<div id="homefurnishing_write_title">
			<p>'IKEA로 꾸민 우리집'</p>
			<p>아이디어 제출하기</p>
		</div>
		<div id="homefurnishing_write_category_0">
			카테고리
		</div>
		<div id="homefurnishing_write_category_1">
			<p>카테고리에 해당되는 이미지와 내용을 제출해주세요.</p>
			<select onchange="javascript:link_select(this);">
				<option value="침실">침실</option>
				<option value="거실">거실</option>
				<option value="주방">주방</option>
				<option value="욕실">욕실</option>
				<option value="홈오피스">홈오피스</option>
				<option value="어린이방">어린이방</option>
				<option value="다이닝">다이닝</option>
				<option value="다용도실">다용도실</option>
				<option value="현관">현관</option>
				<option value="발코니">발코니</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<div id="homefurnishing_write_img_0">
			사진
		</div>
		<div id="homefurnishing_write_img_1">
			사진은 5MB 이내로 최대 10장까지 선택 가능합니다.
			<label for="submit_img">사진 첨부</label>
			<div id="write_img_ready"></div>
		</div>
		<div id="homefurnishing_write_content_title_0">
			제목
		</div>
		<div id="homefurnishing_write_content_title_1">
			<p>제목을 입력해주세요.</p>
			<textarea cols="50" rows="2" onchange="javascript:link_title(this);"></textarea>
		</div>
		<div id="homefurnishing_write_content_0">
			내용
		</div>
		<div id="homefurnishing_write_content_1">
			<p>사진에 대한 내용을 입력해주세요.</p>
			<textarea cols="50" rows="7" onchange="javascript:link_content(this);"></textarea>
		</div>
		<div id="homefurnishing_write_btn_0">
			<button id="write_btn_exit" onclick="submitexit()">취소</button>
			<button id="write_btn_sumit" onclick="submitUpload()">제출하기</button>
		</div>
		<form id="writeform" action="../Homefurnishing_upload" method="post" enctype="multipart/form-data">
			<input id="submit_select" name="submit_select" type="text">
			<input id="submit_img" name="submit_img" type="file">
			<textarea id="submit_title" name="submit_title"></textarea>
			<textarea id="submit_content" name="submit_content"></textarea>
			<input name="submit_writer" value="newage">
			<input type="submit">
		</form>
	</div>
</body>
</html>