function id_chk(){
	var empid = document.getElementById("textid").value;
	if(empid==""){
		alert('아이디를 입력하세요.');
	}else{
		var idchkUrl = "idchk.jsp?empid="+empid;
		var popOption = "width=270, height=50, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(idchkUrl,"",popOption);
			document.getElementById("textid").value=null;
	}
}

function pwchk(){
	var pw1 = document.getElementById("password1").value;
	var pw2 = document.getElementById("password2").value;
		if(pw1==pw2){
			document.getElementById("lachk1").innerHTML = "비밀번호 일치 합니다."
		}
		else{
			document.getElementById("lachk1").innerHTML = "비밀번호가 불일치 합니다."	
			document.getElementById("password1").value=null;
			document.getElementById("password2").value=null;
		}
}		

function pwlen(){
	var pw1 = document.getElementById("password1").value.length;
		if(pw1 >= 4 && pw1 <= 12){
			document.getElementById("lachk2").innerHTML = "비밀번호 길이가 적당합니다."
		}
		else{
			document.getElementById("lachk2").innerHTML = "비밀번호 길이가 안적당합니다."
			document.getElementById("password1").value=null;
			document.getElementById("password2").value=null;
		}
}		

function name_chk(){
	var jsname = document.getElementById("name").value;
	if(jsname==""){
		document.getElementById("la_chk3").innerHTML = "이름을 입력하세요."
	}
}

function email1_chk(){
	var jsmail = document.getElementById("email1").value;
	if(jsmail==""){
		document.getElementById("la_chk4").innerHTML = "메일을 입력 하세요."
	}
}

function email2_chk(){
	var mail1 = document.getElementById("email1").value;
	var mail2 = document.getElementById("email2").value;
	if(mail1 == mail2){
		document.getElementById("la_chk5").innerHTML = "이메일이 서로 일치 합니다."
	}
	else{
		document.getElementById("la_chk5").innerHTML = "이메일이 서로 불일치 합니다."
		document.getElementById("email1").value=null;
		document.getElementById("email2").value=null;
	}
}

function email1_chk(){		
	var email = document.getElementById("email1").value;
	var exptext = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
	if(exptext.test(email)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
		document.getElementById("la_chk4").innerHTML = "이메일 형식이 올바르지 않습니다."
		document.getElementById("email1").value=null;
		//document.addjoin.email.focus();
		return false;
	}else{
		document.getElementById("la_chk4").innerHTML ="";
	}
}

function goPopup(){	//주소페이지 호출과 팝업페이지의 속성을
	var pop = window.open("jusoPopup.jsp","pop","width=590,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,jibunAddr,zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById("juso").value=roadFullAddr;
	document.getElementById("jibunAddr").value=jibunAddr;
	document.getElementById("zipNo").value=zipNo;
}

function phone_chk(){
	var jphone=document.getElementById("phone").value;
	if(jphone==""){
		document.getElementById("la_chk6").innerHTML = "휴대폰 번호를 입력하세요."
	}
	
}

function wrightcheck1(){
	document.getElementById("bb").checked=false;
}

function wrightcheck2(){
	document.getElementById("aa").checked=false;
}

function check_all(){
	for(i=0; i<my_form.mycheck.length;i++){
		my_form.mycheck[i].checked = true;
	}
}










