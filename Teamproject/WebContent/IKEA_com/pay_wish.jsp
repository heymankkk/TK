<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.DB_connect"%>
<%@ page import="new_product.cust_data"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="new_product.wish_data" %>
<!DOCTYPE html>
<html>
<head>
<%
	DB_connect DB = DB_connect.getDB();
	cust_data data = DB.pay_list(1);
	//로그인폼 완성되면 custno로 변경
	
	String custno = request.getParameter("custno");
	if(custno==null){custno="1";} // '로그인해주세요' 요청으로 수정
	ArrayList<wish_data> wishdata = DB.viewwish(custno);
%>
<link rel="stylesheet" type="text/css" href="../css/pay.css"/>
<script type="text/javascript" src="../js/pay_wish.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../pay_wish_pro" method="post">
<input type="hidden" value="<%=custno%>" name="custno">
<input type="hidden" value="<%=wishdata.size()%>" name="totalProduct">
<div id="main">
	<div id="topnavi">
		<img src="../img/pay_0.jpg" id="pay_0">
		<img src="../img/pay_1_on.jpg" id="pay_1">
		<img src="../img/pay_-.jpg">
		<img src="../img/pay_2_off.jpg" id="pay_2">
		<img src="../img/pay_-.jpg">
		<img src="../img/pay_3_off.jpg" id="pay_3">
	</div>
	
	<div id="orderinfo1" class="orderinfo">
		<h4>주문자 정보</h4>
		<div id="login-in">
			<b><%=data.getName()%></b><br><%=data.getEmail()%>
		</div>
		<div id="filed_name">
			이름:<br>
			<input type="text" name="rcvname" value="<%=data.getName()%>" required>
		</div>
		<div id="filed_address1">
			주소 (한국어 주소만 가능 / please write in Korean only):
			<button onclick="find_address()">주소 찾기</button>
			<input type="text" name="add1" value="<%=data.getAdd_full()%>" id="roadFullAddr" required>
		</div>
		<div id="filed_address2">
			상세주소<br>
			<input type="text" name="add2" value="<%=data.getAdd_jibun()%>" id="jibunAddr" required>
		</div>
		<div id="filed_address3">
			우편번호<br>
			<input type="text" name="add3" value="<%=data.getAdd_no()%>" id="zipNo" required>
		</div>
		<div id="filed_email">
			이메일<br>
			<input type="text" name="rcvemail" value="<%=data.getEmail()%>" required>
		</div>
		<div id="filed_phone">
			연락처<br>
			<input type="text" name="rcvphone" value="<%=data.getPhone()%>" required>
		</div>
		<div>
		<div id="agree1">
		<input type="checkbox" required> <button id="agree1_1">개인정보수집/이용</button> 동의
		</div>
		</div>
		<button onclick="goto_pay1_2()">저장 후 계속</button>
	</div>
	
	<div id="orderinfo2" class="orderinfo">
		<h4>배송 정보</h4>
		<div>
			<table>
				<tr><td>주소</td><td><%=data.getName()%></td></tr>
				<tr><td></td><td><%=data.getAdd_full()%></td></tr>	
				<tr><td></td><td><%=data.getAdd_jibun()%></td></tr>
				<tr id="ab"><td></td><td><%=data.getAdd_no()%></td></tr>
				<tr id="ab"><td>배송 방법</td><td>택배</td></tr>
				<tr id="cd"><td>배송비</td><td>\ 5,000</td></tr>
			</table>
		</div>
		<div id="message">
			<div>(1/1) 배송 요청사항을 입력하세요. 예) 부재시 경비실에 맡겨주세요.</div>
			<div><input type="text" name="message"></div>
		</div>
		<button onclick="goto_pay2_1()">이전 페이지</button>
		<button onclick="goto_pay2_3()">저장 후 계속</button>
	</div>
	
	<div id="orderinfo3" class="orderinfo">
		<h4>주문확인 및 결제</h4>
		<div>
			<table>
				<tr><td>주소</td><td><%=data.getName()%></td></tr>
				<tr><td></td><td><%=data.getAdd_full()%></td></tr>	
				<tr><td></td><td><%=data.getAdd_jibun()%></td></tr>
				<tr><td></td><td><%=data.getAdd_no()%></td></tr>
				<tr><td></td><td><%=data.getEmail()%></td></tr>
				<tr id="ab"><td></td><td><%=data.getPhone()%></td></tr>
				<tr id="ab"><td>배송 방법</td><td>택배</td></tr>
				<tr id="cd"><td>배송비</td><td>\ 5,000</td></tr>
				<tr><th colspan="2" >가구배송 (배송 출발일 도착), 택배 (택배 출발일로부터 3~5일 소요 / 제품 특성에 따라 2박스 이상으로 분립송 될 수 있습니다.). 조립서비스가 필요하면 결제 후 즉시 IKEA 고객지원센터(1670-4532)로 접수해주세요.
					</th></tr>
			</table>
		</div>
		<div id="paycheck">
			<h4>결제</h4>
			<table>
				<tr><td>결제 방법</td><td>신용카드</td></tr>
				<tr><th colspan="2">결제하기 버튼을 클릭하면 결제를 위한 페이지로 이동하며, 결제 완료 후 IKEA 코리아 홈페이지로 돌아옵니다.
					</th></tr>
			</table>
		</div>
		<div>
		<div id="agree1">
		<input type="checkbox" required> 이용약관을 충분히 숙지했으며 이에 동의합니다.
		</div>
		</div>
		<button onclick="goto_pay3_2()">이전 페이지</button>
		<input type="submit" value="결제하기" id="gotopay">
	</div>
	
	<div id="orderlist">
		<div id="orderlist_top">
			<button>쇼핑 계속하기</button>
		</div>
		<div id="orderlist_main">
			<div id="ppp"><img src="../img/orderlist.jpg"></div>
		<%for(int i=0; i<wishdata.size(); i++) {
			int tp=(int)wishdata.get(i).getItemprice()*(int)wishdata.get(i).getCount();%>
			<div class="list">
				<table>
				<tr>
					<td class="list1"><input type="text" class="list_count" value="<%=wishdata.get(i).getCount()%>" id="upd1" name="upd1<%=i%>" readonly>
					</td>
					<td class="list2">
					<%int parp = 0;
					if(wishdata.get(i).getImage().substring(0,4).equals("http")){
						parp = 1;
					}
					if(parp==0){ %>
						<img src="/../img_item/<%=wishdata.get(i).getImage()%>">
					<%}else{ %>
						<img src="<%=wishdata.get(i).getImage()%>">
					<%} %>					
					</td>
					<td class="list3"><div><%=wishdata.get(i).getItemname()%></div> <!--제목 -->
						<input type="hidden" name="upd2<%=i%>" value="<%=wishdata.get(i).getItemname()%>">
						<div><%=wishdata.get(i).getCate()%></div> <!--카테 -->
						<br>
						<div id="upd5"><%=wishdata.get(i).getSize()%></div>
						<input type="hidden" name="upd5<%=i%>" value="<%=wishdata.get(i).getSize()%>"> 
						<div id="upd4"><%=wishdata.get(i).getShape()%></div>
						<input type="hidden" name="upd4<%=i%>" value="<%=wishdata.get(i).getShape()%>">
						<div id="upd3">제품번호 : <%=wishdata.get(i).getItemno()%></div>
						<input type="hidden" name="upd3<%=i%>" value="<%=wishdata.get(i).getItemno()%>"></td>
					<td id="getList<%=i%>" class="list4">\ <%=tp%></td>
				</tr>
				</table>
			</div>
			<input type="hidden" name="selno<%=i%>" value="<%=wishdata.get(i).getSelno()%>">
			<input type="hidden" name="eachprice<%=i%>" value="<%=tp%>">
		<%} int fee=wishdata.size()*5000;
			// totalPrice
			long totalPrice=0;
			for(int i=0; i<wishdata.size(); i++){
				long cc=wishdata.get(i).getItemprice()*wishdata.get(i).getCount();
				totalPrice+=cc;
			} totalPrice+=fee;%>
		<div id="orderlist_price">
			<div>배송비<div>\ <%=fee %> (5000*<%=wishdata.size()%>)</div></div>
			<div>최종 결제금액</div>
			<div>\ <%=totalPrice %></div>
			<input type="hidden" value="<%=totalPrice%>" name="totalprice">
		</div>
		</div>
	</div>
</div>
</form>
</body>
</html>