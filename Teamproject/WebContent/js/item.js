function changeimg1(){
	var img1 = document.getElementById("imgchange");
	var hidden = document.getElementById("clickimg1").value;
	img1.src="../img/"+hidden
		
}

function changeimg2(){
	var img2 = document.getElementById("imgchange");
	var hidden = document.getElementById("clickimg2").value;
	img2.src="../img/"+hidden
	
}

function changeimg3(){
	var img3 = document.getElementById("imgchange")
	var hidden = document.getElementById("clickimg3").value;
	img3.src="../img/"+hidden
	
}


function changeFunc1(){
	var z = document.getElementById("selectoption");
	var x = selectoption.options[selectoption.selectedIndex].value;
	if(x==("Gray")){
		var img0 = document.getElementById("imgchange")
		var emp = $('input#imgtest').attr('value');
		img0.src="../img/"+emp;
	}
	 if(x==("White")){
			var img1 = document.getElementById("imgchange")
			img1.src="../img/item3.jpg";
	}else if(x==("Orange")){
			var img2 = document.getElementById("imgchange");
			img2.src="../img/item2.jpg"
	}else if(x==("Green")){
			var img3 = document.getElementById("imgchange");
			img3.src="../img/item1.jpg"
	}else if(x==("Red")){
		var img4 = document.getElementById("imgchange");
		img4.src="../img/item5.jpg"
	}else if(x==("Brown")){
		var img5 = document.getElementById("imgchange");
		img5.src="../img/item1.jpg"
	}
}
	
function itemcount(){
	var a = document.getElementById("Q").value;
	var b = document.getElementById("price1").value;
	var c = "￦"+a*b;
	if(c=="￦"+NaN){
		alert("숫자만입력하세요");
		c="￦"+b
	}
	document.getElementById("price2").value=c;
}

function showPopup(){
	var a = document.getElementById("popup").value;
	window.name = "review.do";
	window.open("reviewBoard.jsp?itemno="+a,"board","width=800, height=500, left=250px, top=100px");
	
}

function orderbychange(){
	var selectby = document.getElementById("filter").value;
	var a = document.getElementById("popup").value;
	location.href = "itempage.jsp?"+"itemno="+a+"&choice="+selectby;
	
}

function hideshow1(){
		document.getElementById("productINFO").style.display="block";
		document.getElementById("envi").style.display="none";
		document.getElementById("const").style.display="none";
		document.getElementById("know").style.display="none";
		document.getElementById("listTitle").style.display="none";
		document.getElementById("contentheader").style.display="none";
		document.getElementById("contentline").style.display="none";
		
}
function hideshow2(){
	document.getElementById("productINFO").style.display="none";
	document.getElementById("envi").style.display="block";
	document.getElementById("const").style.display="none";
	document.getElementById("know").style.display="none";
	document.getElementById("listTitle").style.display="none";
	document.getElementById("contentheader").style.display="none";
	document.getElementById("contentline").style.display="none";
}

function hideshow3(){
	document.getElementById("productINFO").style.display="none";
	document.getElementById("envi").style.display="none";
	document.getElementById("const").style.display="block";
	document.getElementById("know").style.display="none";
	document.getElementById("listTitle").style.display="none";
	document.getElementById("contentheader").style.display="none";
	document.getElementById("contentline").style.display="none";
}

function hideshow4(){
	document.getElementById("productINFO").style.display="none";
	document.getElementById("envi").style.display="none";
	document.getElementById("const").style.display="none";
	document.getElementById("know").style.display="none";
	document.getElementById("listTitle").style.display="block";
	document.getElementById("contentheader").style.display="block";
	document.getElementById("contentline").style.display="block";
}
function hideshow5(){
	document.getElementById("productINFO").style.display="none";
	document.getElementById("envi").style.display="none";
	document.getElementById("const").style.display="none";
	document.getElementById("know").style.display="block";
	document.getElementById("listTitle").style.display="none";
	document.getElementById("contentheader").style.display="none";
	document.getElementById("contentline").style.display="none";
}

//장바구니
function addcart(){
	var item_count=document.getElementById("Q").value;
	var image=document.getElementById("imgchange").src;
	var itemname=document.getElementById("itemname").innerHTML; //
	var chg=document.getElementById("selectoption").value;
	var chgg=document.getElementById("chgg").innerHTML;
	var priceset=document.getElementById("price1").value;
	var itemno=document.getElementById("itemno").innerHTML;
	var cate="sofa";

	alert("장바구니에 추가되었습니다.");
	location.href="../IKEA_com/IKEA_COM.jsp?pageName=cart.jsp&item_count="+item_count+"&image="+image+"&itemname="+itemname+"&chg="+chg+"&chgg="+chgg+"&priceset="+priceset+"&itemno="+itemno+"&cate="+cate;
}

//위시리스트
function addwish(){
	var custno=1;
	var method="add";
	var image = $("#imgchange").attr("src");
	var count = document.getElementById("Q").value;
	var name=document.getElementById("itemname").value;
	var category=document.getElementById("category").value;
	var price=document.getElementById("price1").value;
	var size=document.getElementById("chgg").value;
	var color=document.getElementById("selectoption").value;
	var itemno=document.getElementById("popup").value;

	alert("위시리스트 추가 성공!");
	
	location.href="/Teamproject/Sofawish?custno="+custno+"&itemno="+itemno+"&name="+name+"&category="+category+"&price="+price+"&size="+size+"&color="+color+"&image="+image+"&count="+count+"&method="+method;
}
