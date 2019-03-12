<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%	
	String custno=(String)session.getAttribute("custno");
	if(custno==null){
		custno="1";
	} // 추후 수정
%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/Main.css">

<script type="text/javascript" src="../js/Main.js"></script>
<title>Main</title>
</head>
<body>
<div id="centeralignment">
<!-- 탑 다이브 시작-->
	<div id="topdiv">

		<div id="topdiv1"></div>
		<div id="topdiv2"><button id="topdiv00">고객지원</button></div>
		<div id="topdiv3"><button id="topdiv00">매장안내</button></div>
		<div id="topdiv4"><button id="topdiv00"><img src="../img/1.PNG"/></button></div>
		<div id="topdiv5"><button id="topdiv00"><img src="../img/2.PNG"/>채팅 상담</button></div>
		<div id="topdiv6"><input type="text" value="안녕하세요. IKEA Korea 입니다." id="topdivtext"></div>
		<!-- <div id="topdiv7" class="topdivdiv">7</div>
		<div id="topdiv8" class="topdivdiv">8</div>
		<div id="topdiv9" class="topdivdiv">9</div>
		<div id="topdiv10" class="topdivdiv">10</div> -->
		<div id="topdiv11"><button id="topdiv01">로그인</button></div>
		<div id="topdiv12"><button id="topdiv01">마이페이지</button></div>
		<div id="topdiv13"><button id="topdiv01">ENGLISH</button></div>
		<div id="topdiv14"><a href="IKEA_COM.jsp?pageName=item_upload.jsp?shape=1&size=1"><button id="topdiv01">상품등록</button></a></div>

	</div>
	<div id="middiv">
		<div id="middiv1" class="middiv0"></div>
		<div id="middiv2" class="middiv0"><img onclick="location.href='../index/MainContent.jsp'" src="../img/3.PNG"/></div>
		<!-- <div id="middiv3" class="middiv0">3</div> -->
		<div id="middiv4" class="middiv0">
			<table>
				<tr>
					<td><input type="text" size="40"><img src="../img/4.PNG"/></td>
				</tr>
			</table>
		</div>
		<!-- <div id="middiv5" class="middiv0">5</div>
		<div id="middiv6" class="middiv0">6</div>
		<div id="middiv7" class="middiv0">7</div>
		<div id="middiv8" class="middiv0">8</div> 
		<div id="middiv9" class="middiv0">9</div> -->
		<div id="middiv10" class="middiv0"><button onclick="realtime0()"><input type="text" value="실시간" disabled/></button></div>
		<!-- <div id="middiv11" class="middiv0">11</div> -->
		<a href="IKEA_COM.jsp?pageName=wish.jsp&custno=<%=custno%>">
		<div id="middiv12" class="middiv0"><img src="../img/5.PNG"/></div></a>
		<a href="IKEA_COM.jsp?pageName=cart.jsp">
		<div id="middiv13" class="middiv0"><img src="../img/6.PNG"/></div></a>
		<div id="middiv14" class="middiv0"></div>
	</div>
	<div id="bottomdiv">
		<div id="bottomdiv1" class="bottomdiv0"></div>
		<div id="bottomdiv2" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv1()">모든 제품</button></div>
		<div id="bottomdiv3" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv2()">디지털 쇼룸</button></div>
		<div id="bottomdiv4" class="bottomdiv0"><button id="btncategory" onclick="location.href='IKEA_COM.jsp?pageName=new_product.jsp'">New</button></div>
		<div id="bottomdiv5" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv4()">소파·의자·테이블</button></div>
		<div id="bottomdiv6" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv5()">침대·매트리스</button></div>
		<div id="bottomdiv7" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv6()">요리·식기·주방가구</button></div>
		<div id="bottomdiv8" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv7()">어린이 IKEA</button></div>
		<div id="bottomdiv9" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv8()">수납</button></div>
		<div id="bottomdiv10" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv9()">조명</button></div>
		<div id="bottomdiv11" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv10()">텍스타일·러그·커튼</button></div>
		<div id="bottomdiv12" class="bottomdiv0"><button id="btncategory" onclick="btncategorydiv11()">홈데코·반려동물</button></div>
		<div id="bottomdiv13" class="bottomdiv0"><button id="btncategory13">홈퍼니싱 아이디어</button></div>
		<div id="bottomdiv14" class="bottomdiv0"></div>
	
<!-- 카테고리 (모든 제품) 시작-->
	<div id="btncategorydiv1" >
			<div id="btncategorydiv1_1" class="">
				<button id="btncategorydiv1_1_1" onclick="btncategorydivdiv1_2()">소파·의자·테이블</button><br>
				<button id="btncategorydiv1_1_2" onclick="btncategorydivdiv1_3()">침대·매트리스</button><br>
				<button id="btncategorydiv1_1_3" >어린이 IKEA</button><br>
				<button id="btncategorydiv1_1_4" >수납</button><br>
				<button id="btncategorydiv1_1_5" >요리·식기·주방가구</button><br>
				<button id="btncategorydiv1_1_6" >조명</button><br>
				<button id="btncategorydiv1_1_7" >텍스타일·러그·커튼</button><br>
				<button id="btncategorydiv1_1_8" >홈데코·반려동물</button><br>
				<button id="btncategorydiv1_1_9" >욕실</button><br>
				<button id="btncategorydiv1_1_10" >야외용가구·가전제품</button><br>
				<button id="btncategorydiv1_1_11" >겨울용 소품</button><br>
				<button id="btncategorydiv1_1_12" >IKEA Food</button>
			</div>
			<div id="btncategorydiv1_2">
				<div id="btncategorydiv1_2_1" class="">
					<input type="text" value="쇼파"><br>
					<button>모든 소파</button><br>
					<button>소파베드</button><br>
					<button>암체어/긴의자</button><br>
					<button>패브릭 소파</button><br>
					<button>모듈식 소파</button><br>
					<button>천연/인조가죽 소파</button><br>
					<button>풋스툴/쿠션형 스툴</button><br>
					<button>소파커버</button><br>
					<button>추가다리</button>
				</div>
				<div id="btncategorydiv1_2_2" class="">
					<input type="text" value="의자"><br>
					<button>식탁 의자</button><br>
					<button>사무용 의자</button><br>
					<button>바의자</button><br>
					<button>카페 의자</button><br>
					<button>스툴/벤치</button><br>
					<button>유아용 의자</button><br>
					<button>행잉시트/회전의자</button><br>
					<button>테이블/의자</button><br>
					<button>일광욕 의자/해먹</button>
				</div>
				<div id="btncategorydiv1_2_3" class="">
					<input type="text" value="책상/테이블"><br>
					<button>책상/컴퓨터 책상</button><br>
					<button>콤비네이션</button><br>
					<button>식탁</button><br>
					<button>식탁세트</button><br>
					<button>바테이블</button><br>
					<button>카페테이블</button><br>
					<button>어린이 테이블</button><br>
					<button>어린이 책상</button><br>
					<button>커피테이블/보조테이블</button><br>
					<button>화장대</button>
				</div>
				<div id="btncategorydiv1_2_4" class="">
					<input type="text" value="TV/멀티미디어 세트"><br>
					<button>TV/멀티미디어 세트</button><br>
				</div>
			</div>
			<div id="btncategorydiv1_3">
				<div id="btncategorydiv1_3_1" class="">
					<input type="text" value="침대"><br>
					<button>더블침대</button><br>
					<button>싱글침대</button><br>
					<button>로프트/2층침대</button><br>
					<button>간이침대/데이베드</button><br>
					<button>침대헤드</button><br>
					<button>수납형침대</button><br>
					<button>소파베드</button><br>
					<button>영아용 침대</button><br>
					<button>유아용 침대</button><br>
					<button>어린이 침대</button>
				</div>
				<div id="btncategorydiv1_3_2" class="">
					<input type="text" value="매트리스"><br>
					<button>모든 매트리스</button><br>
					<button>스프링 매트리스</button><br>
					<button>폼/라텍스 매트리스</button><br>
					<button>우드베이스 스프링 매트리스</button><br>
					<button>매트리스 패드</button><br>
					<button>매트리스/베개보호 패드</button><br>
					<button>매트리스 베이스</button><br>
					<button>침대갈빗살</button><br>
					<button>침대다리</button>
				</div>
				<div id="btncategorydiv1_3_3" class="">
					<input type="text" value="어린이 침대/매트리스"><br>
					<button>영아용 침대</button><br>
					<button>영아용 침대 매트리스</button><br>
					<button>유아용 침대</button><br>
					<button>유아용 매트리스</button><br>
					<button>어린이 침대</button><br>
					<button>어린이 침대</button><br>
					<button>어린이 매트리스</button>
				</div>
				<div id="btncategorydiv1_3_4" class="">
					<input type="text" value="침실 텍스타일"><br>
					<button>침구</button><br>
					<button>이불</button><br>
					<button>베개</button><br>
					<button>베드스프레드</button><br>
					<button>러그</button><br>
					<button>담요/스로우</button><br>
					<button>쿠션/쿠션커버</button><br>
					<button>커튼/블라인드</button><br>
					<button>커튼봉/레일</button><br>
					<button>패브릭/재봉</button>
				</div>
			</div>
	</div>
<!-- 카테고리 (모든 제품) 종료-->
<!-- 카테고리 (디지털 쇼룸) 다이브 시작 -->
	<div id="btncategorydiv2" >
			<div id="btncategorydiv2_1" class="">
				<p>쇼룸 디자인을 쉽게 따라해 보세요</p>
			</div>
			<div id="btncategorydiv2_2">
				<div id="btncategorydiv2_2_1">
					| 쇼룸 IKEA제품으로 꾸며진 공간들에서 홈퍼니싱의 영감을 얻으세요
					<div class="btncategorydiv2_2_1_1">
						<div class="btncategorydigitalshowroom1_1">
							<img width="140" height="100" src="../img/show1.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>거실</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_2">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show2.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>침실</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_3">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show3.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>어린이</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_4">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show4.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>홈 오피스</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_5">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show5.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>다이닝</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_6">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show6.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>주방</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_7">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show7.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>욕실</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_8">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show8.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>현관</p>
						</div>
					</div>
					<div class="btncategorydiv2_2_1_9">
						<div class="btncategorydigitalshowroom1_1">
							<img  width="140" height="100" src="../img/show9.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom1_2">
							<p>데코레이션</p>
						</div>
					</div>
				</div>
			<div id="btncategorydiv2_2_2">
				| 시리즈 시리즈/세트 상품으로 쉽고 간편하게 홈스타일을 완성하세요
				<div class="btncategorydiv2_2_1_10">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show1.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>거실 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_11">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show2.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>어린이 IKEA 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_12">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show3.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>홈 오피스 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_13">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show4.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>다이닝 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_14">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show5.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>주방 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_15">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show6.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>식기 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_16">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show7.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>요리 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_17">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show8.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>요리 시리즈</p>
						</div>
				</div>
				<div class="btncategorydiv2_2_1_18">
						<div class="btncategorydigitalshowroom2_1">
							<img width="140" height="100" src="../img/show9.jpg"/>
						</div>
						<div class="btncategorydigitalshowroom2_2">
							<p>겨울용 소품</p>
						</div>
				</div>
			</div>
		</div>
	</div>
<!-- 카테고리 (디지털 쇼룸) 종료 -->
<!-- 카테고리 (소파) 시작 -->
	<div id="btncategorydiv4" >
			<div id="btncategorydiv4_1" class="">
				<input type="text" value="쇼파"><br>
				<button>모든 소파</button><br>
				<button>소파베드</button><br>
				<button>암체어/긴의자</button><br>
				<button>패브릭 소파</button><br>
				<button>모듈식 소파</button><br>
				<button>천연/인조가죽 소파</button><br>
				<button>풋스툴/쿠션형 스툴</button><br>
				<button>소파커버</button><br>
				<button>추가다리</button>
			</div>
			<div id="btncategorydiv4_2" class="">
				<input type="text" value="의자"><br>
				<button>식탁 의자</button><br>
				<button>사무용 의자</button><br>
				<button>바의자</button><br>
				<button>카페 의자</button><br>
				<button>스툴/벤치</button><br>
				<button>유아용 의자</button><br>
				<button>행잉시트/회전의자</button><br>
				<button>테이블/의자</button><br>
				<button>일광욕 의자/해먹</button>
			</div>
			<div id="btncategorydiv4_3" class="">
				<input type="text" value="책상/테이블"><br>
				<button>책상/컴퓨터 책상</button><br>
				<button>콤비네이션</button><br>
				<button>식탁</button><br>
				<button>식탁세트</button><br>
				<button>바테이블</button><br>
				<button>카페테이블</button><br>
				<button>어린이 테이블</button><br>
				<button>어린이 책상</button><br>
				<button>커피테이블/보조테이블</button><br>
				<button>화장대</button>
			</div>
			<div id="btncategorydiv4_4" class="">
				<input type="text" value="TV/멀티미디어 세트"><br>
				<button>TV/멀티미디어 세트</button>
		</div>
	</div>
<!-- 카테고리 (소파) 종료 -->
<!-- 카테고리 (침대) 시작 -->
<div id="btncategorydiv5" >
			<div id="btncategorydiv5_1" class="">
				<input type="text" value="침대"><br>
				<button>더블침대</button><br>
				<button>싱글침대</button><br>
				<button>로프트/2층침대</button><br>
				<button>간이침대/데이베드</button><br>
				<button>침대헤드</button><br>
				<button>수납형침대</button><br>
				<button>소파베드</button><br>
				<button>영아용 침대</button><br>
				<button>유아용 침대</button><br>
				<button>어린이 침대</button>
			</div>
			<div id="btncategorydiv5_2" class="">
				<input type="text" value="매트리스"><br>
				<button>모든 매트리스</button><br>
				<button>스프링 매트리스</button><br>
				<button>폼/라텍스 매트리스</button><br>
				<button>우드베이스 스프링 매트리스</button><br>
				<button>매트리스 패드</button><br>
				<button>매트리스/베개보호 패드</button><br>
				<button>매트리스 베이스</button><br>
				<button>침대갈빗살</button><br>
				<button>침대다리</button>
			</div>
			<div id="btncategorydiv5_3" class="">
				<input type="text" value="어린이 침대/매트리스"><br>
				<button>영아용 침대</button><br>
				<button>영아용 침대 매트리스</button><br>
				<button>유아용 침대</button><br>
				<button>유아용 매트리스</button><br>
				<button>어린이 침대</button><br>
				<button>어린이 매트리스</button>
			</div>
			<div id="btncategorydiv5_4" class="">
				<input type="text" value="침실 텍스타일"><br>
				<button>침구</button><br>
				<button>이불</button><br>
				<button>베개</button><br>
				<button>베드스프레드</button><br>
				<button>러그</button><br>
				<button>담요/스로우</button><br>
				<button>쿠션/쿠션커버</button><br>
				<button>커튼/블라인드</button><br>
				<button>커튼봉/레일</button><br>
				<button>패브릭/재봉</button>
		</div>
	</div>
<!-- 카테고리 (침대) 종료 -->
<!-- 카테고리 (요리,식기,주방가구) 시작 -->
	<div id="btncategorydiv6" >
			<div id="btncategorydiv6_1" class="">
				<input type="text" value="주방용품"><br>
				<button>더블침대</button><br>
				<button>싱글침대</button><br>
				<button>로프트/2층침대</button><br>
				<button>간이침대/데이베드</button><br>
				<button>침대헤드</button><br>
				<button>수납형침대</button><br>
				<button>소파베드</button><br>
				<button>영아용 침대</button><br>
				<button>유아용 침대</button><br>
				<button>어린이 침대</button>
				<hr>
				<input type="text" value="METOD/메토드 주방가구"><br>
				<button>METOD/메토드 주방수납장</button><br>
				<button>METOD/메토드 내부부속품</button><br>
				<button>METOD/메토드 주방수도꼭지/싱크대</button><br>
				<button>METOD/메토드 조리대</button>
			</div>
			<div id="btncategorydiv6_2" class="">
				<input type="text" value="주방가구"><br>
				<button>식탁</button><br>
				<button>식탁세트</button><br>
				<button>식탁 의자</button><br>
				<button>주방아일랜드/카트</button><br>
				<button>스툴/벤치</button><br>
				<button>수납장/장식장</button><br>
				<button>팬트리</button><br>
				<button>스텝스툴/사다리</button><br>
				<button>모듈식 주방</button>
			</div>
			<div id="btncategorydiv6_3" class="">
				<input type="text" value="식기"><br>
				<button>식기도구</button><br>
				<button>서빙웨어</button><br>
				<button>디너웨어</button><br>
				<button>냅킨/냅킨홀더</button><br>
				<button>커피/차</button><br>
				<button>유아용 식기</button><br>
				<button>유리제품/유리병</button><br>
				<button>테이블 텍스타일</button><br>
				<button>어린이 식기</button>
			</div>
			<div id="btncategorydiv6_4" class="">
				<input type="text" value="주방가전"><br>
				<button>레인지</button><br>
				<button>레인지후드</button><br>
				<button>오븐</button><br>
				<button>냉장고</button>
		</div>
	</div>
<!-- 카테고리 (침대) 종료 -->
<!-- 카테고리 (어린이 IKEA)시작 -->
	<div id="btncategorydiv7" >
			<div id="btncategorydiv7_1" class="">
				<input type="text" value="침대/매트리스"><br>
				<button>영아용 침대</button><br>
				<button>영아용 침대 매트리스</button><br>
				<button>유아용 침대</button><br>
				<button>유아용 매트리스</button><br>
				<button>어린이 침대</button><br>
				<button>어린이 매트리스</button><br>
				<hr>
				<input type="text" value="텍스타일/조명"><br>
				<button>영아용 텍스타일</button><br>
				<button>유아용 텍스타일</button><br>
				<button>어린이 텍스타일</button><br>
				<button>영아/유아 조명</button><br>
				<button>어린이 조명</button>
			</div>
			<div id="btncategorydiv7_2" class="">
				<input type="text" value="장난감/놀이"><br>
				<button>영아용 장난감</button><br>
				<button>장난감/수납</button><br>
				<hr>
				<input type="text" value="어린이 용품"><br>
				<button>영아용 식기</button><br>
				<button>어린이 식기</button><br>
				<button>어린이 용품</button><br>
				<button>안전</button>
			</div>
			<div id="btncategorydiv7_3" class="">
				<input type="text" value="책상/의자/소형수납"><br>
				<button>어린이 가구</button><br>
				<button>어린이 책상</button><br>
				<button>어린이 책상의자</button><br>
				<button>영아용 식탁의자</button><br>
				<button>유아용 식탁의자</button><br>
				<button>기저귀교환대/수유대</button>
			</div>
			<div id="btncategorydiv7_4" class="">
				<input type="text" value="수납"><br>
				<button>수납시스템</button><br>
				<button>소형수납</button><br>
				<button>수납가구</button>
		</div>
	</div>
<!-- 카테고리 (어린이 IKEA) 종료 -->
<!-- 카테고리 (수납) 시작 -->
<div id="btncategorydiv8" >
			<div id="btncategorydiv8_1" class="">
				<input type="text" value="거실수납"><br>
				<button>수납장/장식장</button><br>
				<button>커피테이블/보조테이블</button><br>
				<button>책장</button><br>
				<button>선반유닛</button><br>
				<button>BEST/베스토 거실수납 시스템</button><br>
				<button>TV/멀티미디어가구</button><br>
				<button>거실장/찬장/콘솔테이블</button><br>
				<button>수납함/바구니</button><br>
				<button>벽설치선반</button>
				<hr>
				<input type="text" value="소현수납"><br>
				<button>수납함/바구니</button><br>
				<button>의류정리용품</button><br>
				<button>후크/옷걸이</button><br>
				<button>식품보관/정리</button><br>
				<button>휴지통/봉투</button><br>
				<button>분리수거</button>
			</div>
			<div id="btncategorydiv8_2" class="">
				<input type="text" value="옷장 수납"><br>
				<button>옷장</button><br>
				<button>의류정리용품</button><br>
				<button>신발/코트/모자 수납</button><br>
				<button>행거/스탠드</button><br>
				<button>후크/옷걸이</button><br>
				<button>신발장</button><br>
				<button>PAX 팍스 옷장 (기본형)</button><br>
				<button>PLATSA 플랏사 옷장 (모듈형)</button><br>
				<button>ALGOT 알고트 수납 (오픈형)</button><br>
				<button>ELVARLI 엘발리 수납 (오픈형)</button>
				<hr>
				<input type="text" value="사무실 수납"><br>
				<button>책장</button><br>
				<button>선반유닛</button><br>
				<button>서류수납장</button><br>
				<button>서랍유닛</button><br>
				<button>벽설치선반</button><br>
				<button>서류/미디어 정리용품</button><br>
				<button>벽수납</button>
			</div>
			<div id="btncategorydiv8_3" class="">
				<input type="text" value="침실 수납"><br>
				<button>서랍장</button><br>
				<button>침대수납</button><br>
				<button>침대협탁</button><br>
				<button>화장대</button>
				<hr>
				<input type="text" value="욕실  & 세탁"><br>
				<button>욕실수납</button><br>
				<button>욕실용품</button><br>
				<button>세탁/청소</button><br>
				<button>분리수거함</button>
			</div>
			<div id="btncategorydiv8_4" class="">
				<input type="text" value="수납가구"><br>
				<button>수납장/장식장</button><br>
				<button>TV/멀티미디어가구</button><br>
				<button>BESTA/베스토 거실수납 시스템</button>
				<button>거실장/찬장/콘솔테이블</button><br>
				<button>책장</button><br>
				<button>옷장</button><br>
				<button>서랍장</button><br>
				<button>화장대</button><br>
				<button>벽수납</button><br>
				<button>선반유닛</button><br>
				<button>수납시스템/유닛</button><br>
				<button>팬트리</button><br>
				<button>ALGOT 알고트 수납 (오픈형)</button><br>
				<button>벽설치선반</button>
				<hr>
				<input type="text" value="보조수납"><br>
				<button>수납시스템/유닛</button><br>
				<button>ALGOT 알고트 수납 (오픈형)</button><br>
				<button>수납장/장식장</button><br>
				<button>팬트리</button><br>
				<button>벽선반</button>
		</div>
	</div>
<!-- 카테고리 (수납) 종료 -->
<!-- 카테고리 (조명) 시작 -->
<div id="btncategorydiv9" >
			<div id="btncategorydiv9_1" class="">
				<input type="text" value="모든 조명"><br>
				<button>플로어스탠드</button><br>
				<button>탁상스탠드</button><br>
				<button>천장조명</button><br>
				<button>벽부착등</button><br>
				<button>스폿조명</button><br>
				<button>작업등</button><br>
				<button>다용도 조명</button>
				<hr>
				<input type="text" value="아이방조명"><br>
				<button>영아/유아 조명</button><br>
				<button>어린이 조명</button>
			</div>
			<div id="btncategorydiv9_2" class="">
				<input type="text" value="조명 관련용품"><br>
				<button>LED조명</button><br>
				<button>LED전구</button><br>
				<button>멀티탭</button><br>
				<button>전등갓/전등본체</button><br>
				<hr>
				<input type="text" value="디지털 액세서리"><br>
				<button>배터리</button><br>
				<button>무선충전기 & 액세서리</button><br>
				<button>USB</button>
			</div>
			<div id="btncategorydiv9_3" class="">
				<input type="text" value="장식조명"><br>
				<button>야외조명</button><br>
				<button>실내조명</button><br>
				<button>장식조명</button>
			</div>
			<div id="btncategorydiv9_4" class="">
				<input type="text" value="스마트 조명"><br>
				<button>스마트 조명</button><br>
				<button>무선 LED 전구</button><br>
				<button>스마트 인티그레이션 조명</button><br>
				<button>제어장치와 액세서리</button>
		</div>
	</div>
<!-- 카테고리 (조명) 종료 -->
<!-- 카테고리 (텍스타일,러그,커튼) 시작 -->
<div id="btncategorydiv10" >
			<div id="btncategorydiv10_1" class="">
				<input type="text" value="침실 텍스타일"><br>
				<button>베개</button><br>
				<button>침구</button><br>
				<button>이불</button><br>
				<button>베드스프레드</button><br>
				<button>매트리스/베개보호패드</button><br>
				<button>커튼봉/레일</button><br>
				<button>담요/스로우</button><br>
				<button>커튼/블라인드</button>
			</div>
			<div id="btncategorydiv10_2" class="">
				<input type="text" value="러그"><br>
				<button>모든 러그</button><br>
				<button>수제러그</button><br>
				<button>러그 (중/대)</button><br>
				<button>오리엔탈러그</button><br>
				<button>원형러그</button><br>
				<button>미끄럼방지/깔개</button><br>
				<button>장식보/러그 (소)</button><br>
				<button>도어매트</button><br>
				<button>양가죽/소가죽</button>
			</div>
			<div id="btncategorydiv10_3" class="">
				<input type="text" value="쿠션/패브릭"><br>
				<button>쿠션/쿠션커버</button><br>
				<button>패브릭/재봉</button>
			</div>
			<div id="btncategorydiv10_4" class="">
				<input type="text" value="주방/욕실텍스타일"><br>
				<button>샤워가운/슬리퍼</button><br>
				<button>영아용텍스타일</button><br>
				<button>테이블텍스타일</button><br>
				<button>수건</button><br>
				<button>주방텍스타일</button><br>
				<button>욕실매트</button><br>
				<button>샤워커튼</button><br>
				<button>야외텍스타일</button><br>
				<button>어린이텍스타일</button><br>
				<button>유아용텍스타일</button>
		</div>
	</div>
<!-- 카테고리 (텍스타일,러그,커튼) 종료 -->
<!-- 카테고리 (홈데코,반려동물) 시작 -->
<div id="btncategorydiv11" >
			<div id="btncategorydiv11_1" class="">
				<input type="text" value="홈데코"><br>
				<button>액자/사진</button><br>
				<button>장식용품</button><br>
				<button>시계</button><br>
				<button>거울</button><br>
				<button>배터리/충전기</button><br>
				<button>종이제품</button><br>
				<button>안전</button><br>
				<button>식물/화분/스탠드</button><br>
				<button>양초/홀더</button><br>
				<button>꽃병/수반</button>
			</div>
			<div id="btncategorydiv11_2" class="">
				<input type="text" value="반려동물"><br>
				<button>강아지</button><br>
				<button>고양이</button>
			</div>
			<div id="btncategorydiv11_3" class="">
				<input type="text" value="세탁/청소"><br>
				<button>욕실용품</button><br>
				<button>세탁/청소</button>
			</div>
			<div id="btncategorydiv11_4" class="">
				<input type="text" value="내용 없음"><br>
		</div>
	</div>
<!-- 카테고리 (홈테코,반려동물) 종료 -->
<!-- 실시간 인기 검색어 시작 -->
	<div id="realtimepopular1" onmouseleave="realtimeOnMouseOut(this)">
		<div id="realtimepopular1_1">
			실시간 인기 검색어
		</div>
		<div id="realtimepopular1_2">
			<div id="realtimepopular1_2_1">
				<button onclick="realtime1()">IKEA Top 10</button>
			</div>
			<div id="realtimepopular1_2_2">
				<button onclick="realtime2()">포털 Top 10</button>
			</div>
		</div>
		<div id="realtimepopular1_3">
			<div id="realtimepopular1_3_1">
				1-1
			</div>
			<div id="realtimepopular1_3_2">
				2-1
			</div>
			<div id="realtimepopular1_3_3">
				3-1
			</div>
			<div id="realtimepopular1_3_4">
				4-1
			</div>
			<div id="realtimepopular1_3_5">
				5-1
			</div>
			<div id="realtimepopular1_3_6">
				6-1
			</div>
			<div id="realtimepopular1_3_7">
				7-1
			</div>
			<div id="realtimepopular1_3_8">
				8-1
			</div>
			<div id="realtimepopular1_3_9">
				9-1
			</div>
			<div id="realtimepopular1_3_10">
				10-1
			</div>
		</div>
		<div id="realtimepopular1_4">
			<div id="realtimepopular1_4_1">
				1-2
			</div>
			<div id="realtimepopular1_4_2">
				2-2
			</div>
			<div id="realtimepopular1_4_3">
				3-2
			</div>
			<div id="realtimepopular1_4_4">
				4-2
			</div>
			<div id="realtimepopular1_4_5">
				5-2
			</div>
			<div id="realtimepopular1_4_6">
				6-2
			</div>
			<div id="realtimepopular1_4_7">
				7-2
			</div>
			<div id="realtimepopular1_4_8">
				8-2
			</div>
			<div id="realtimepopular1_4_9">
				9-2
			</div>
			<div id="realtimepopular1_4_10">
				10-2
			</div>
		</div>
	</div>
<!-- 실시간 인기 검색어 종료 -->
</div>	
<!-- 탑 다이브 종료 -->
</div>
</body>
</html>