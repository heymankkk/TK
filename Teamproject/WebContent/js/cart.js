function listCount(input,n,totallistSize){
	var a=input.value;
	var b=document.getElementById("getPrice"+n).value;
	var c="\\ "+a*b;
	//document.getElementById("getList"+n).innerHTML=c
	input.parentElement.parentElement.childNodes[7].innerHTML=c;
	
	var d=0;
	for(var i=0; i<totallistSize; i++){
		var dd=document.getElementById("getList"+i).innerHTML;
		dd=dd.replace("\\ ","");
		d+=parseInt(dd);
	}
	document.getElementById("totalPrice").innerHTML="\\ "+d;
	
	location.href="/Teamproject/cart_pro?n="+n+"&a="+a+"&d="+d;
	
	
	
	/*
	alert(input.parentElement.parentElement);//[object HTMLTableRowElement]
	alert(input.parentElement.parentElement.childNodes[0].nodeName);//#text
	alert(input.parentElement.parentElement.childNodes[1].nodeName);//TD
	alert(input.parentElement.parentElement.childNodes[2].nodeName);//#text
	alert(input.parentElement.parentElement.childNodes[3].nodeName);//TD
	alert(input.parentElement.parentElement.childNodes[4].nodeName);//#text
	alert(input.parentElement.parentElement.childNodes[5].nodeName);//TD
	alert(input.parentElement.parentElement.childNodes[6].nodeName);//#text
	alert(input.parentElement.parentElement.childNodes[7].innerHTML);//TD
	alert(input.parentElement.parentElement.childNodes[8].nodeName);//#text
	alert(input.parentElement.parentElement.childNodes[9]);//undefined
	alert(input.parentElement.parentElement.childNodes[10]);//undefined
	*/
}

function gotopay(){
	var size = document.getElementById("totallist").value;
	if(size==0){
		alert("구매 할 품목이 없습니다.")
		location.href="/Teamproject/IKEA_com/IKEA_COM.jsp?pageName=cart.jsp";
	}else{
		location.href="/Teamproject/IKEA_com/pay_cart.jsp";
	}
}
