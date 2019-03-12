function shape_add(){
	var shape = document.getElementById("shape").value;
	var size = document.getElementById("size").value;
	if(shape<10){
		shape++;
	}else{
		alert("최대입니다.");
	}
	location.href="IKEA_COM.jsp?pageName=item_upload.jsp&shape="+shape+"&size="+size+""
}
function shape_sub(){
	var shape = document.getElementById("shape").value;
	var size = document.getElementById("size").value;
	if(shape>0){
		shape--;
	}
	location.href="IKEA_COM.jsp?pageName=item_upload.jsp&shape="+shape+"&size="+size+""
}
function size_add(){
	var shape = document.getElementById("shape").value;
	var size = document.getElementById("size").value;
	if(size<10){
		size++;
	}else{
		alert("최대입니다.");
	}
	location.href="IKEA_COM.jsp?pageName=item_upload.jsp&shape="+shape+"&size="+size+""
}
function size_sub(){
	var shape = document.getElementById("shape").value;
	var size = document.getElementById("size").value;
	if(size>0){
		size--;
	}
	location.href="IKEA_COM.jsp?pageName=item_upload.jsp&shape="+shape+"&size="+size+""
}



function loadImg1(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	document.getElementById("setimage1").innerHTML="<img src="+ e.target.result +">";
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function loadImg2(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	document.getElementById("setimage2").innerHTML="<img src="+ e.target.result +">"; 
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function loadImg3(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	document.getElementById("setimage3").innerHTML="<img src="+ e.target.result +">"; 
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function loadImg4(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	document.getElementById("setimage4").innerHTML="<img src="+ e.target.result +">"; 
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function loadImg5(input) {
    if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	document.getElementById("setimage5").innerHTML="<img src="+ e.target.result +">"; 
        }
        reader.readAsDataURL(input.files[0]);
    }
}



function cateA(){
	document.getElementById("image_main").style.display="none";
	document.getElementById("image_add").style.display="none";
	document.getElementById("cate1").style.display="block";
	document.getElementById("cate2").style.display="block";	
}
function cateB(){
	document.getElementById("cate1").style.display="none";
	document.getElementById("cate2").style.display="none";
	document.getElementById("image_main").style.display="block";
	document.getElementById("image_add").style.display="block";
}

function gory1(input){
	var com=input.innerHTML;
	document.getElementById("category1").value=com;
}

function gory2(input){
	var com=input.innerHTML;
	document.getElementById("category2").value=com;
}

