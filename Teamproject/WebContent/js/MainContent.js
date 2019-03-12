/**
 * 
 */

function slidepostertimer(){
	var str1 = document.getElementsByName("slidechecked")[0].checked;
	var str2 = document.getElementsByName("slidechecked")[1].checked;
	var str3 = document.getElementsByName("slidechecked")[2].checked;
	var str4 = document.getElementsByName("slidechecked")[3].checked;
	var str5 = document.getElementsByName("slidechecked")[4].checked;
	
	var emp1 = true;
	if(emp1==str1){
		document.getElementsByName("slidechecked")[0].checked="false";
		document.getElementsByName("slidechecked")[1].checked="true";
	}
	else if(emp1==str2){
		document.getElementsByName("slidechecked")[1].checked="false";
		document.getElementsByName("slidechecked")[2].checked="true";
	}
	else if(emp1==str3){
		document.getElementsByName("slidechecked")[2].checked="false";
		document.getElementsByName("slidechecked")[3].checked="true";
	}
	else if(emp1==str4){
		document.getElementsByName("slidechecked")[3].checked="false";
		document.getElementsByName("slidechecked")[4].checked="true";
	}
	else if(emp1==str5){
		document.getElementsByName("slidechecked")[4].checked="false";
		document.getElementsByName("slidechecked")[0].checked="true";
	}
}
function BestItemstyle1(){
		document.getElementById("BestItemstyle1").style.background="#d51717";
		document.getElementById("BestItemstyle2").style.background="Transparent";
		document.getElementById("BestItemstyle3").style.background="Transparent";
		document.getElementById("BestItemstyle4").style.background="Transparent";
}
function BestItemstyle2(){
		document.getElementById("BestItemstyle1").style.background="Transparent";
		document.getElementById("BestItemstyle2").style.background="#A60F76";
		document.getElementById("BestItemstyle3").style.background="Transparent";
		document.getElementById("BestItemstyle4").style.background="Transparent";
}
function BestItemstyle3(){
		document.getElementById("BestItemstyle1").style.background="Transparent";
		document.getElementById("BestItemstyle2").style.background="Transparent";
		document.getElementById("BestItemstyle3").style.background="#0063C6";
		document.getElementById("BestItemstyle4").style.background="Transparent";
}
function BestItemstyle4(){
		document.getElementById("BestItemstyle1").style.background="Transparent";
		document.getElementById("BestItemstyle2").style.background="Transparent";
		document.getElementById("BestItemstyle3").style.background="Transparent";
		document.getElementById("BestItemstyle4").style.background="#1294A3";
}


/*function backmonthslideshow(){
	document.getElementById("monththemeslideshowbox").style.marginLeft="0%";
}
*/
function backmonthslideshow(){
	var chk1 = document.getElementsByName("mtsc")[0].checked;
	var chk2 = document.getElementsByName("mtsc")[1].checked;
	var chk3 = document.getElementsByName("mtsc")[2].checked;
	var chk4 = document.getElementsByName("mtsc")[3].checked;
	var emp = true;

	if(chk1 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="-300%";
		document.getElementsByName("mtsc")[0].checked="false";
		document.getElementsByName("mtsc")[3].checked="true";
	}
	if(chk4 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="-200%";
		document.getElementsByName("mtsc")[3].checked="false";
		document.getElementsByName("mtsc")[2].checked="true";
	}
	if(chk3 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="-100%";
		document.getElementsByName("mtsc")[2].checked="false";
		document.getElementsByName("mtsc")[1].checked="true";
	}
	if(chk2 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="0%";
		document.getElementsByName("mtsc")[1].checked="false";
		document.getElementsByName("mtsc")[0].checked="true";
	}
}
function nextmonthslideshow(){
	var chk1 = document.getElementsByName("mtsc")[0].checked;
	var chk2 = document.getElementsByName("mtsc")[1].checked;
	var chk3 = document.getElementsByName("mtsc")[2].checked;
	var chk4 = document.getElementsByName("mtsc")[3].checked;
	var emp = true;

	if(chk1 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="-100%";
		document.getElementsByName("mtsc")[0].checked="false";
		document.getElementsByName("mtsc")[1].checked="true";
	}
	if(chk2 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="-200%";
		document.getElementsByName("mtsc")[1].checked="false";
		document.getElementsByName("mtsc")[2].checked="true";
	}
	if(chk3 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="-300%";
		document.getElementsByName("mtsc")[2].checked="false";
		document.getElementsByName("mtsc")[3].checked="true";
	}
	if(chk4 == emp){
		document.getElementById("monththemeslideshowbox").style.marginLeft="0%";
		document.getElementsByName("mtsc")[3].checked="false";
		document.getElementsByName("mtsc")[0].checked="true";
	}

}
function backblurbslide(){
	var chk1 = document.getElementsByName("bssb")[0].checked;
	var chk2 = document.getElementsByName("bssb")[1].checked;
	var chk3 = document.getElementsByName("bssb")[2].checked;
	var chk4 = document.getElementsByName("bssb")[3].checked;
	var chk5 = document.getElementsByName("bssb")[4].checked;
	var chk6 = document.getElementsByName("bssb")[5].checked;
	var chk7 = document.getElementsByName("bssb")[6].checked;
	var chk8 = document.getElementsByName("bssb")[7].checked;
	var chk9 = document.getElementsByName("bssb")[8].checked;
	var emp = true;
	
	if(chk1 == true){
		document.getElementsByName("bssb")[0].checked="false";
		document.getElementsByName("bssb")[8].checked="true";
		$(".blurbli.9").insertBefore(".blurbli.1");
		document.getElementById("blurbSlideShowBox4").style.background="Transparent";
		document.getElementById("blurbSlideShowBox3").style.background="yellow";
	}
	if(chk9 == true){
		document.getElementsByName("bssb")[8].checked="false";
		document.getElementsByName("bssb")[7].checked="true";
		$(".blurbli.8").insertBefore(".blurbli.9");
		document.getElementById("blurbSlideShowBox3").style.background="Transparent";
		document.getElementById("blurbSlideShowBox2").style.background="yellow";
	}
	if(chk8 == true){
		document.getElementsByName("bssb")[7].checked="false";
		document.getElementsByName("bssb")[6].checked="true";
		$(".blurbli.7").insertBefore(".blurbli.8");
		document.getElementById("blurbSlideShowBox2").style.background="Transparent";
		document.getElementById("blurbSlideShowBox1").style.background="yellow";
	}
	if(chk7 == true){
		document.getElementsByName("bssb")[6].checked="false";
		document.getElementsByName("bssb")[5].checked="true";
		$(".blurbli.6").insertBefore(".blurbli.7");
		document.getElementById("blurbSlideShowBox1").style.background="Transparent";
		document.getElementById("blurbSlideShowBox9").style.background="yellow";
	}
	if(chk6 == true){
		document.getElementsByName("bssb")[5].checked="false";
		document.getElementsByName("bssb")[4].checked="true";
		$(".blurbli.5").insertBefore(".blurbli.6");
		document.getElementById("blurbSlideShowBox9").style.background="Transparent";
		document.getElementById("blurbSlideShowBox8").style.background="yellow";
	}
	if(chk5 == true){
		document.getElementsByName("bssb")[4].checked="false";
		document.getElementsByName("bssb")[3].checked="true";
		$(".blurbli.4").insertBefore(".blurbli.5");
		document.getElementById("blurbSlideShowBox8").style.background="Transparent";
		document.getElementById("blurbSlideShowBox7").style.background="yellow";
	}
	if(chk4 == true){
		document.getElementsByName("bssb")[3].checked="false";
		document.getElementsByName("bssb")[2].checked="true";
		$(".blurbli.3").insertBefore(".blurbli.4");
		document.getElementById("blurbSlideShowBox7").style.background="Transparent";
		document.getElementById("blurbSlideShowBox6").style.background="yellow";
	}
	if(chk3 == true){
		document.getElementsByName("bssb")[2].checked="false";
		document.getElementsByName("bssb")[1].checked="true";
		$(".blurbli.2").insertBefore(".blurbli.3");
		document.getElementById("blurbSlideShowBox6").style.background="Transparent";
		document.getElementById("blurbSlideShowBox5").style.background="yellow";
	}
	if(chk2 == true){
		document.getElementsByName("bssb")[1].checked="false";
		document.getElementsByName("bssb")[0].checked="true";
		$(".blurbli.1").insertBefore(".blurbli.2");
		document.getElementById("blurbSlideShowBox5").style.background="Transparent";
		document.getElementById("blurbSlideShowBox4").style.background="yellow";
	}
}
function nextblurbslide(){
	var chk1 = document.getElementsByName("bssb")[0].checked;
	var chk2 = document.getElementsByName("bssb")[1].checked;
	var chk3 = document.getElementsByName("bssb")[2].checked;
	var chk4 = document.getElementsByName("bssb")[3].checked;
	var chk5 = document.getElementsByName("bssb")[4].checked;
	var chk6 = document.getElementsByName("bssb")[5].checked;
	var chk7 = document.getElementsByName("bssb")[6].checked;
	var chk8 = document.getElementsByName("bssb")[7].checked;
	var chk9 = document.getElementsByName("bssb")[8].checked;
	var emp = true;
	if(chk1 == true){
		document.getElementsByName("bssb")[0].checked="false";
		document.getElementsByName("bssb")[1].checked="true";
		$(".blurbli.1").insertAfter(".blurbli.9");	
		document.getElementById("blurbSlideShowBox4").style.background="Transparent";
		document.getElementById("blurbSlideShowBox5").style.background="yellow";		
	}
	if(chk2 == true){
		document.getElementsByName("bssb")[1].checked="false";
		document.getElementsByName("bssb")[2].checked="true";
		$(".blurbli.2").insertAfter(".blurbli.1");
		document.getElementById("blurbSlideShowBox5").style.background="Transparent";
		document.getElementById("blurbSlideShowBox6").style.background="yellow";	
	}
	if(chk3 == true){
		document.getElementsByName("bssb")[2].checked="false";
		document.getElementsByName("bssb")[3].checked="true";
		$(".blurbli.3").insertAfter(".blurbli.2");
		document.getElementById("blurbSlideShowBox6").style.background="Transparent";
		document.getElementById("blurbSlideShowBox7").style.background="yellow";	
	}
	if(chk4 == true){
		document.getElementsByName("bssb")[3].checked="false";
		document.getElementsByName("bssb")[4].checked="true";
		$(".blurbli.4").insertAfter(".blurbli.3");
		document.getElementById("blurbSlideShowBox7").style.background="Transparent";
		document.getElementById("blurbSlideShowBox8").style.background="yellow";	
	}
	if(chk5 == true){
		document.getElementsByName("bssb")[4].checked="false";
		document.getElementsByName("bssb")[5].checked="true";
		$(".blurbli.5").insertAfter(".blurbli.4");
		document.getElementById("blurbSlideShowBox8").style.background="Transparent";
		document.getElementById("blurbSlideShowBox9").style.background="yellow";
	}
	if(chk6 == true){
		document.getElementsByName("bssb")[5].checked="false";
		document.getElementsByName("bssb")[6].checked="true";
		$(".blurbli.6").insertAfter(".blurbli.5");
		document.getElementById("blurbSlideShowBox9").style.background="Transparent";
		document.getElementById("blurbSlideShowBox1").style.background="yellow";
	}
	if(chk7 == true){
		document.getElementsByName("bssb")[6].checked="false";
		document.getElementsByName("bssb")[7].checked="true";
		$(".blurbli.7").insertAfter(".blurbli.6");
		document.getElementById("blurbSlideShowBox1").style.background="Transparent";
		document.getElementById("blurbSlideShowBox2").style.background="yellow";	
	}
	if(chk8 == true){
		document.getElementsByName("bssb")[7].checked="false";
		document.getElementsByName("bssb")[8].checked="true";
		$(".blurbli.8").insertAfter(".blurbli.7");
		document.getElementById("blurbSlideShowBox2").style.background="Transparent";
		document.getElementById("blurbSlideShowBox3").style.background="yellow";
	}
	if(chk9 == true){
		document.getElementsByName("bssb")[8].checked="false";
		document.getElementsByName("bssb")[0].checked="true";
		$(".blurbli.9").insertAfter(".blurbli.8");
		document.getElementById("blurbSlideShowBox3").style.background="Transparent";
		document.getElementById("blurbSlideShowBox4").style.background="yellow";
	}
}


function backminislide(){
	var chk1 = document.getElementsByName("mini")[0].checked;
	var chk2 = document.getElementsByName("mini")[1].checked;
	var chk3 = document.getElementsByName("mini")[2].checked;
	var tru = true;
	
	if(chk1 == tru){
		document.getElementsByName("mini")[0].checked="false";
		document.getElementsByName("mini")[2].checked="true";
		document.getElementById("miniSlideShowUl").style.marginLeft="-200%";
	}
	if(chk3 == tru){
		document.getElementsByName("mini")[2].checked="false";
		document.getElementsByName("mini")[1].checked="true";
		document.getElementById("miniSlideShowUl").style.marginLeft="-100%";
	}
	if(chk2 == tru){
		document.getElementsByName("mini")[1].checked="false";
		document.getElementsByName("mini")[0].checked="true";
		document.getElementById("miniSlideShowUl").style.marginLeft="0";
	}

}
function nextminislide(){
	var chk1 = document.getElementsByName("mini")[0].checked;
	var chk2 = document.getElementsByName("mini")[1].checked;
	var chk3 = document.getElementsByName("mini")[2].checked;
	var tru = true;
	
	if(chk1 == tru){
		document.getElementsByName("mini")[0].checked="false";
		document.getElementsByName("mini")[1].checked="true";
		document.getElementById("miniSlideShowUl").style.marginLeft="-100%";
	}
	if(chk2 == tru){
		document.getElementsByName("mini")[1].checked="false";
		document.getElementsByName("mini")[2].checked="true";
		document.getElementById("miniSlideShowUl").style.marginLeft="-200%";
	}
	if(chk3 == tru){
		document.getElementsByName("mini")[2].checked="false";
		document.getElementsByName("mini")[0].checked="true";
		document.getElementById("miniSlideShowUl").style.marginLeft="0";
	}

}














