function viewdetail(aa,size){
	//var test=document.getElementById("detail"+aa);
	/*for(var i=0; i<size; i++){
		document.getElementById("detail"+aa+i).style.display="block";
	}*/
	/*for(var i=0; i<size; i++){
		if(document.getElementById("detail"+aa+i).style.display=="block"){
			document.getElementById("detail"+aa+i).style.display="none";
		}
	}*/
	
	if($('div#detail'+aa+0).css('display')=="none"){
		for(var i=0; i<size; i++){
			$('div#detail'+aa+i).css('display','block');
		}
	}
	else if($('div#detail'+aa+0).css('display')=="block"){
		for(var i=0; i<size; i++){
			$('div#detail'+aa+i).css('display','none');
		}
	}
}