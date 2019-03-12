<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/IKEA_COM.css">
<%
	String pageName=request.getParameter("pageName");
	if(pageName==null){	pageName="new_product.jsp";}

	String itemno=request.getParameter("itemno");
	if(itemno==null){	itemno="";}
	if(pageName.equals("view_product.jsp")){
		pageName="view_product.jsp?itemno="+itemno;
	}

%>
<meta charset="UTF-8">
<title>이케아</title>
</head>
<body>
<div id="zindex">
<div>
<jsp:include page="../index/Header.jsp"></jsp:include>
</div>
<div>
<jsp:include page="<%=pageName %>"></jsp:include>
</div>
<jsp:include page="../index/footer.jsp" flush="false"></jsp:include>
</div>
</body>
</html>