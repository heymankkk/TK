function cssSelector(selector){
	for(i=0;i < document.styleSheets.length;i++){
		for(j=0;j<document.styleSheets[i].cssRules.length;j++){
			if(document.styleSheets[i].cssRules[j].selectorText == selector){
				return document.styleSheets[i].cssRules[j];
			}
		}
	}
}

function goto_pay1_2(){
	//$('.abc').attr('style', 'display:none');
	//$('.def').attr('style', 'display:inline-block');
	var outinfo=document.getElementById("orderinfo1");
	outinfo.style.display="none";
	var ininfo=document.getElementById("orderinfo2");
	ininfo.style.display="inline-block";
	var outnavi=document.getElementById("pay_1");
	outnavi.src="../img/pay_1_off.jpg";
	var innavi=document.getElementById("pay_2");
	innavi.src="../img/pay_2_on.jpg";
	
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