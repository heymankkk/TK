function listCount(input,n,totallistSize){
	var a=input.value;
	var b=document.getElementById("getPrice"+n).value;
	var c="\\ "+a*b;
	input.parentElement.parentElement.childNodes[7].innerHTML=c;
	
	var d=0;
	for(var i=0; i<totallistSize; i++){
		var dd=document.getElementById("getList"+i).innerHTML;
		dd=dd.replace("\\ ","");
		d+=parseInt(dd);
	}
	document.getElementById("totalPrice").innerHTML="\\ "+d;
}

function update(n){
	var count=document.getElementById("upd1_"+n).value;
	var custno=document.getElementById("upd2").value;
	var itemno=document.getElementById("upd3_"+n).innerHTML;
	itemno=itemno.replace("제품번호 : ","");
	var shape=document.getElementById("upd4_"+n).innerHTML;
	var size=document.getElementById("upd5_"+n).innerHTML;
	var price=document.getElementById("getPrice"+n).value;
	var method="upd";
	location.href="/Teamproject/wish_pro?count="+count+"&custno="+custno+"&shape="+shape+"&size="+size+"&itemno="+itemno+"&price="+price+"&method="+method;
}

function gotopay(){
	var datasize = document.getElementById("datasize").value;
	var custno = document.getElementById("upd2").value;
	if(datasize==0){
		alert("구매 할 품목이 없습니다.")
		location.href="/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=wish.jsp&custno="+custno;
	}else{
		location.href="/Teamproject/IKEA_com/pay_wish.jsp?custno="+custno;
	}
}