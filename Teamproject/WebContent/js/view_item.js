function changeimg1(){
	var img1 = document.getElementById("imgchange");
	img1.src="../img/item1.jpg"
}

function changeimg2(){
	var img3 = document.getElementById("imgchange");
	img3.src="../img/item2.jpg"
	
}

function changeimg3(){
	var img4 = document.getElementById("imgchange")
	img4.src="../img/item3.jpg"
	
}
function changeFunc(){
	var z = document.getElementById("selectoption");
	var x = selectoption.options[selectoption.selectedIndex].value;
	if(x==0){
		var img0 = document.getElementById("imgchange")
		var emp = $('input#test').attr('value');
		img0.src="../img/"+emp;
	}
	 if(x==1){
			var img1 = document.getElementById("imgchange")
			img1.src="../img/item3.jpg";
	}else if(x==2){
			var img2 = document.getElementById("imgchange");
			img2.src="../img/item2.jpg"
	}else if(x==3){
			var img3 = document.getElementById("imgchange");
			img3.src="../img/item1.jpg"
	}
}
	
function itemcount(){
	var a = document.getElementById("Q").value;
	var b = document.getElementById("price1").value;
	var c = "￦"+a*b;
	document.getElementById("price2").value=c;
}

function showPopup(){
	var a = document.getElementById("popup").value;
	window.name = "review.do";
	window.open("../IKEA_com/view_reviewBoard.jsp?itemno="+a,"board","width=800, height=500, left=250px, top=100px");
	
}

function orderbychange(){
	var selectby = document.getElementById("filter").value;
	var a = document.getElementById("popup").value;
	location.href = "itempage.jsp?"+"itemno="+a+"&choice="+selectby;
	
}
