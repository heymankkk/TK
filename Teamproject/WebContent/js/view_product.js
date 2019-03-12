function cssSelector(selector){
	for(i=0;i < document.styleSheets.length;i++){
		for(j=0;j<document.styleSheets[i].cssRules.length;j++){
			if(document.styleSheets[i].cssRules[j].selectorText == selector){
				return document.styleSheets[i].cssRules[j];
			}
		}
	}
}  //styleSheet 직접 건드리기
function itemoption1(){
	var abc=cssSelector(".itemoption11");  // 해당 값 확인 필요
	var def=document.getElementById("itemoption2");  // 확인 불필요
	if(abc.style["display"]=="none"){
		abc.style.display="inline-block";  // 직접건드리니
		def.style["display"]="none";
	}else{
		abc.style.display="none";
		def.style["display"]="block";
	}
}
function optchg1(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg1").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg2(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg2").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg3(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg3").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg4(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg4").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg5(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg5").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg6(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg6").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg7(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg7").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg8(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg8").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg9(){	document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg9").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function optchg10(){ document.getElementById("chg").innerHTML="옵 션Ⅰ :  "+document.getElementById("optchg10").innerHTML;	cssSelector(".itemoption11").style.display="none";	document.getElementById("itemoption2").style.display="block";}
function itemoption2(){
	var abc=cssSelector(".itemoption22");
	if(abc.style["display"]=="none"){
		abc.style["display"]="inline-block"
	}else{
		abc.style["display"]="none"
	}
}
function optchgg1(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg1").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg2(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg2").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg3(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg3").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg4(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg4").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg5(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg5").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg6(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg6").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg7(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg7").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg8(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg8").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg9(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg9").innerHTML;	cssSelector(".itemoption22").style.display="none";}
function optchgg10(){ document.getElementById("chgg").innerHTML="옵 션Ⅱ :  "+document.getElementById("optchgg10").innerHTML;	cssSelector(".itemoption22").style.display="none";}

function itemcount22(){
	var a=document.getElementById("item_count").value;
	var b=document.getElementById("priceset").value;
	var c="$ "+a*b;
	document.getElementById("priceget").value=c;	
}

function image_change2(){
	var a=document.getElementById("setimage2").src;
	var b=document.getElementById("getimage").src;
	document.getElementById("getimage").src=a;
	document.getElementById("setimage2").src=b;
}
function image_change3(){
	var a=document.getElementById("setimage3").src;
	var b=document.getElementById("getimage").src;
	document.getElementById("getimage").src=a;
	document.getElementById("setimage3").src=b;
}
function image_change4(){
	var a=document.getElementById("setimage4").src;
	var b=document.getElementById("getimage").src;
	document.getElementById("getimage").src=a;
	document.getElementById("setimage4").src=b;
}
function image_change5(){
	var a=document.getElementById("setimage5").src;
	var b=document.getElementById("getimage").src;
	document.getElementById("getimage").src=a;
	document.getElementById("setimage5").src=b;
}

function addcart(){
	var item_count=document.getElementById("item_count").value;
	var image=document.getElementById("getimage").src;
	var itemname=document.getElementById("itemname").innerHTML;
	var chg="";
	if(document.getElementById("chg")!=null){
		chg=document.getElementById("chg").innerHTML;
	}
	chg=chg.replace("옵 션   :  ","")
	var chgg="";
	if(document.getElementById("chgg")!=null){
		chgg=document.getElementById("chgg").innerHTML;
		chgg=chgg.replace("옵 션   :  ","")
	}else{
		chgg=document.getElementById("product_size").innerHTML;
		chgg=chgg.replace("규격 :  ","")
	}
	var priceset=document.getElementById("priceset").value;
	var itemno=document.getElementById("itemno").innerHTML;
	itemno=itemno.replace("제품번호 : ","")
	var cate=document.getElementById("category").innerHTML;
	alert("장바구니에 추가되었습니다.");
	location.href="IKEA_COM.jsp?pageName=cart.jsp&item_count="+item_count+"&image="+image+"&itemname="+itemname+"&chg="+chg+"&chgg="+chgg+"&priceset="+priceset+"&itemno="+itemno+"&cate="+cate;
}
