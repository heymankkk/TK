<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
 <%@page import="MainContent.MainContentServer" %>
 <%@page import="MainContent.ItemData" %>
<!DOCTYPE html>
<html>
<head>
<%
	List<ItemData> MCdatalist=null;
	MainContentServer serverdata = MainContentServer.getMainContentServer();
	MCdatalist = serverdata.selectitem();
%>
<link rel="stylesheet" href="../css/MainContent.css">
<script type="text/javascript" src="../js/MainContent.js"></script>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script type="text/javascript">
	setInterval("slidepostertimer()", 3000);
	setInterval("nextmonthslideshow()", 3000);
	setInterval("nextblurbslide()", 3000);
	setInterval("nextminislide()",3000);
</script>
<script src="https://code.jquery.com/jquery-1.10.2.js">
</script>

</head>
<body>
<!-- Header.jsp 불러오기 -->
<div id="zindex">	<!-- zindex 시작 -->
	<div id="Header">
		<jsp:include page="Header.jsp" flush="false"></jsp:include>
	</div>
	<div id="MainContent">	<!-- MainContent 시작 -->
		<div id="bodyContentNews">	<!-- 뉴스 스크롤 시작 -->
			<div id="bodyContentNewsTittle">
				<input type="text" value=" IKEA KOREA NEWS">
			</div>
			<div id="bodyContentNewsScroll">
				
			</div>
			<div id="bodyContentNewsAtag">
				<a href="MainContent.jsp">더보기 ></a>
			</div>
		</div>	<!-- 뉴스 스크롤 종료 -->
		<div id="bodyContentSlidePoster">   <!-- 메인 광고 시작 -->
			<input type="radio" name="slidechecked" id="slidebtn1" checked>
			<input type="radio" name="slidechecked" id="slidebtn2">
			<input type="radio" name="slidechecked" id="slidebtn3">
			<input type="radio" name="slidechecked" id="slidebtn4">
			<input type="radio" name="slidechecked" id="slidebtn5">
			<ul>
				<li><img src="../img/MainContent/MainContentPoster1.jpg"></li>
				<li><img src="../img/MainContent/MainContentPoster2.jpg"></li>
				<li><img src="../img/MainContent/MainContentPoster3.jpg"></li>
				<li><img src="../img/MainContent/MainContentPoster4.jpg"></li>
				<li><img src="../img/MainContent/MainContentPoster5.gif"></li>
			</ul>
			<p class="slidelabel">
				<label for="slidebtn1"></label>
				<label for="slidebtn2"></label>
				<label for="slidebtn3"></label>
				<label for="slidebtn4"></label>
				<label for="slidebtn5"></label>
			</p>
		</div>	<!-- 메인 광고 종료 -->
		<div id="bodyContentBestItem">	<!-- 베스트- 추천 아이템 -->
			<div id="bodyContentBestItemMenu">	<!-- 메뉴 -->
				<div id="BestItemstyle1" onclick="BestItemstyle1()"><button>나를 위한 추천 제품</button></div>
				<div id="BestItemstyle2" onclick="BestItemstyle2()"><button>이달의 인기 제품</button></div>
				<div id="BestItemstyle3" onclick="BestItemstyle3()"><button>가장 많이 검색된 제품</button></div>
				<div id="BestItemstyle4" onclick="BestItemstyle4()"><button>새로 나온 제품</button></div>
			</div>
			<div id="bodyContentBestItemSlide">	<!-- 슬라이드쇼 -->
				<div id="BestSlide1">
					<input type="radio" name="BestItemSlide1" id="BestItemSlideBtn_1" checked>
					<input type="radio" name="BestItemSlide1" id="BestItemSlideBtn_2">
					<ul>
					<%
						for(int a=0; a<MCdatalist.size(); a++){
							ItemData MCD = MCdatalist.get(a);
					%>
						<li>
							<div id="BestItemSlide<%=a+1 %>">
							<%
								for(int b=1; b<=2; b++){
									if(b==1){
							%>
										<div id="BestItemSlide<%=a+1 %>_<%=b %>">
											<img src="../img/MainContent/BestItemSlide/First/<%=MCD.getItemimg() %>"/>
										</div>
							<%
									}
									if(b==2){
							%>
										<div id="BestItemSlide<%=a+1 %>_<%=b %>">
											<p><%=MCD.getItemname() %></p>
											<p><%=MCD.getItemcategory() %></p>
											<p>★★★★★</p>
											<p><%=MCD.getItemprice() %></p>
										</div>
							<%
									}
								}
							%>
							</div>
						</li>
					<%
						}		
					%>
					</ul>
					<p class="BestItemSlideChecked">
						<label for="BestItemSlideBtn_1"></label>
						<label for="BestItemSlideBtn_2"></label>
					</p>
				</div>
			</div>
		</div>
		<div id="todayRoom">
			<div id="todayRoomTitle1">
				<p>오늘의 공간</p>
			</div>
			<div id="todayRoomTitle2">
				<p>당신의 공간을 아름답게 꾸미기 위한 영감을 드립니다.</p>
			</div>
			<div id="todayRoomCategory">
				<p>[<p>거실</p><p>]</p><p>예술적인 인테리어</p>
			</div>
			<div id="todayRoomCategoryLink">
				<a href="">관련 제품 더보기 →</a>
			</div>
			<div id="todayRoomimg">
				<img id="tri" src="../img/MainContent/todayroom/TodayRoom1.jpg"/>
				<div><img id="trbtn1" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
				<div><img id="trbtn2" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
				<div><img id="trbtn3" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
				<div><img id="trbtn4" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
				<div><img id="trbtn5" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
				<div><img id="trbtn6" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
				<div><img id="trbtn7" src="../img/MainContent/todayroom/todayroombutton.png"/></div>
			</div>	
		</div>
		<div id="monththeme">
			<div id="monththemeTitle">
				<p>이달의 테마 쇼핑</p>
			</div>
			<div id="monththemeimg">
				<div id="monththemeimg1">
					<img src="../img/MainContent/monththeme/monththeme1.jpg"/>
				</div>
				<div id="monththemeimg2">
					<img src="../img/MainContent/monththeme/monththeme2.jpg"/>
				</div>
				<div id="monththemeimg3">
					<img src="../img/MainContent/monththeme/monththeme3.jpg"/>
				</div>
			</div>
			<div id="monththemeslideshow">
					<input type="radio" name="mtsc" id="mtslidebtn1" checked>
					<input type="radio" name="mtsc" id="mtslidebtn2">
					<input type="radio" name="mtsc" id="mtslidebtn3">
					<input type="radio" name="mtsc" id="mtslidebtn4">
				<ul id="monththemeslideshowbox">
					<li><img id="mtss1" src="../img/MainContent/monththeme/monthslideshow1.jpg"/></li>
					<li><img id="mtss2" src="../img/MainContent/monththeme/monthslideshow2.jpg"/></li>
					<li><img id="mtss3" src="../img/MainContent/monththeme/monthslideshow3.jpg"/></li>
					<li><img id="mtss4" src="../img/MainContent/monththeme/monthslideshow4.jpg"/></li>
				</ul>
				<div id="backmtbtn" onclick="backmonthslideshow()"><img src="../img/MainContent/monththeme/backslideshowbtn.png"/></div>
				<div id="nextmtbtn" onclick="nextmonthslideshow()"><img src="../img/MainContent/monththeme/nextslideshowbtn.png"/></div>
			</div>
		</div>
		<div id="blurb">
			<div id="blurbTitle1">
				<p>IKEA 홈퍼니싱 아이디어</p>
			</div>
			<div id="blurbTitle2">
				<p>작은 차이가 큰 변화를 만듭니다.</p>
			</div>
			<div id="blurbSlideShowBox">
				<input type="radio" name="bssb" id="bssbbtn1" checked>
				<input type="radio" name="bssb" id="bssbbtn2">
				<input type="radio" name="bssb" id="bssbbtn3">
				<input type="radio" name="bssb" id="bssbbtn4">
				<input type="radio" name="bssb" id="bssbbtn5">
				<input type="radio" name="bssb" id="bssbbtn6">
				<input type="radio" name="bssb" id="bssbbtn7">
				<input type="radio" name="bssb" id="bssbbtn8">
				<input type="radio" name="bssb" id="bssbbtn9">
				<ul>

					<%
						for(int i=1; i<=9; i++){
					%>
						<li class="blurbli <%=i%>">
							<div id="blurbSlideShowBox<%=i%>">
								<div id="blurbSlideShowBoxdiv1">
									<img src="../img/MainContent/blurbSlideShow/blurbslideshow<%=i %>.jpg"/>
								</div>
								<div id="blurbSlideShowBoxdiv2">
									<br>
									<p id="blurbfont1">IKEA</p>
									<P id="blurbfont1">Home Furnishing Idea</P>
									<br>
									<p>침대를 제외한 모든 가구가 이케아...1</p>
									<br>
									<br>
									<br>
									<a id="blurbfont3" href="">View Idea→</a>
								</div>
							</div>
						</li>
					<%
						}
					%>
				</ul>
			</div>
			<div id="backbssbtn1" onclick="backblurbslide()"><img src="../img/MainContent/monththeme/backslideshowbtn.png"/></div>
			<div id="nextbssbtn2" onclick="nextblurbslide()"><img src="../img/MainContent/monththeme/nextslideshowbtn.png"/></div>
		</div>
		<div id="miniSlideShowBox">
			<input type="radio" name="mini" id="minibtn1" checked>
			<input type="radio" name="mini" id="minibtn2">
			<input type="radio" name="mini" id="minibtn3">
			<ul id="miniSlideShowUl">
				<li>
					<img src="../img/MainContent/minislideshow/minislideshow1.png"/>
				</li>
				<li>
					<img src="../img/MainContent/minislideshow/minislideshow2.png"/>
				</li>
				<li>
					<img src="../img/MainContent/minislideshow/minislideshow3.png"/>
				</li>
			</ul>
			<div id="backminibtn1" onclick="backminislide()"><img src="../img/MainContent/monththeme/backslideshowbtn.png"/></div>
			<div id="nextminibtn2" onclick="nextminislide()"><img src="../img/MainContent/monththeme/nextslideshowbtn.png"/></div>
		</div>
		<div id="bannerBox">
			<div id="banner1"><img src="../img/MainContent/banner/banner1.jpg"/></div>
			<div id="banner2"><img src="../img/MainContent/banner/banner2.jpg"/></div>
			<div id="banner3"><img src="../img/MainContent/banner/banner3.jpg"/></div>
			<div id="banner4"><img src="../img/MainContent/banner/banner4.jpg"/></div>
			<div id="banner5"><img src="../img/MainContent/banner/banner5.jpg"/></div>
		</div>
	</div>	<!-- MainContent 종료 -->
	<div id="footer">
		<jsp:include page="footer.jsp" flush="false"></jsp:include>
	</div>
</div>	<!-- zindex 종료 -->
</body>
</html>