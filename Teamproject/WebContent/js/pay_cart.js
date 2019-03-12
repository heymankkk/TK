function goto_pay1_2(){
	var outinfo=document.getElementById("orderinfo1");
	outinfo.style.display="none";
	var ininfo=document.getElementById("orderinfo2");
	ininfo.style.display="inline-block";
	var outnavi=document.getElementById("pay_1");
	outnavi.src="../img/pay_1_off.jpg";
	var innavi=document.getElementById("pay_2");
	innavi.src="../img/pay_2_on.jpg";
	
	var name = document.getElementById("rcvname").value;
	var add_full = document.getElementById("roadFullAddr").value;
	var add_jibun = document.getElementById("jibunAddr").value;
	var add_no = document.getElementById("zipNo").value;
	var email = document.getElementById("rcvemail").value;
	var phone = document.getElementById("rcvphone").value;
	document.getElementById("info2_1").innerHTML=name;
	document.getElementById("info2_2").innerHTML=add_full;
	document.getElementById("info2_3").innerHTML=add_jibun;
	document.getElementById("info2_4").innerHTML=add_no;
	
	document.getElementById("info3_1").innerHTML=name;
	document.getElementById("info3_2").innerHTML=add_full;
	document.getElementById("info3_3").innerHTML=add_jibun;
	document.getElementById("info3_4").innerHTML=add_no;
	document.getElementById("info3_5").innerHTML=email;
	document.getElementById("info3_6").innerHTML=phone;
}
function goto_pay2_1(){
	var outinfo=document.getElementById("orderinfo2");
	outinfo.style.display="none";
	var ininfo=document.getElementById("orderinfo1");
	ininfo.style.display="inline-block";
	var outnavi=document.getElementById("pay_2");
	outnavi.src="../img/pay_2_off.jpg";
	var innavi=document.getElementById("pay_1");
	innavi.src="../img/pay_1_on.jpg";
}
function goto_pay2_3(){
	var outinfo=document.getElementById("orderinfo2");
	outinfo.style.display="none";
	var ininfo=document.getElementById("orderinfo3");
	ininfo.style.display="inline-block";
	var outnavi=document.getElementById("pay_2");
	outnavi.src="../img/pay_2_off.jpg";
	var innavi=document.getElementById("pay_3");
	innavi.src="../img/pay_3_on.jpg";
}
function goto_pay3_2(){
	var outinfo=document.getElementById("orderinfo3");
	outinfo.style.display="none";
	var ininfo=document.getElementById("orderinfo2");
	ininfo.style.display="inline-block";
	var outnavi=document.getElementById("pay_3");
	outnavi.src="../img/pay_3_off.jpg";
	var innavi=document.getElementById("pay_2");
	innavi.src="../img/pay_2_on.jpg";
}




function find_address(){
	var popup = window.open("/Teamproject/IKEA_com/jusoPopup.jsp","pop","width=570, height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadFullAddr,jibunAddr,zipNo){
	document.getElementById("roadFullAddr").value=roadFullAddr;
	document.getElementById("jibunAddr").value=jibunAddr;
	document.getElementById("zipNo").value=zipNo;
}