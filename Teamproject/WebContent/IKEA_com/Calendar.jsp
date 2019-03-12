<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="new_product.Calender" %>
<%@ page import="new_product.DB_connect"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<%
	int[] date = Calender.calen();
	DB_connect DB = new DB_connect();
	String id = (String)session.getAttribute("custno");
	String history = DB.rouletteHistory(id);
	int aaaaa=0;
	ArrayList<String> total = new ArrayList<String>();
 	if(history!=null){
		String[] historyarr = history.split(",");
		for(int i=1; i<historyarr.length; i++){
			if(Integer.parseInt(historyarr[i])==date[1]){
				i++;
				total.add(historyarr[i]);
				aaaaa++;
				i++;
			}else{
				i++;
				i++;
			}
		}
		if(aaaaa==0){
			history=null;
		}
	} 
%>
<head>
<meta charset="UTF-8">
<title></title>
<style>
#all{
	width:430px;
}
#content{
	width:430px;
	margin:0 auto;
}
#all>div{
	display:inline-block;
	width:46px;
	height:46px;
	font-size:13px;
	border-right:2px solid darkgray;
	border-bottom:2px solid darkgray;
	padding:2px;
	margin:2px;
}
.nonetext{
	color:white;
}
#top{
	text-align:center;
	font-size:20px;
	font-weight:700;
	width:430px;
	margin-top:10px;
	margin-bottom:10px;
}
</style>
<script>
function abc(){
	document.getElementById("day"+<%=date[2]%>).style.color="red";
}
</script>
</head>
<body onload="abc()">
<div id="content">
<div id="top"><%=date[0]%>년 <%=date[1]%>월 Calender</div>
<div id="all">
<%	int j=0;
	int aa=99999;
	for(int i=0; i<35; i++){
		if(i<date[4]-1 || i>date[3]+date[4]-2){
%>			<div class="nonetext">'</div>
<%		}else{
			if(history!=null){
				aa = Integer.parseInt((String)total.get(j));
			}%>
			<div id="day<%=i-date[4]+2%>"><%=i-date[4]+2%>
				<%if(aa+date[4]-2==i){
					if(j<total.size()-1){j++;}%>
					참여<%;
				}else{%><%}%>
			</div>
<%		}%>
<%	}%>
</div>
</div>
</body>
</html>