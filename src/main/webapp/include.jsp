<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#pkc").load("imsi.jsp");
	});
</script>
</head>
<body>
<%@ include file="imsi.jsp" %>
<hr>
<c:import url="imsi.jsp"/>
<hr>
<jsp:include page="imsi.jsp"/>
<hr>
<div id="pkc"></div>
</body>
</html>