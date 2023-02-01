<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.TourDao_old" %>
<%
	TourDao_old tdao=new TourDao_old();
	tdao.list(request);
%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
<div id="section">
	<div id="ksg" onclick="hide()"><img width="400" id="aa"></div>
	<table width="500" align="center" border="1">
		<tr>
			<th>사진</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="tdto">
			<tr>
				<td><img src="img/${tdto.fname}" width="50" height="50"></td>
				<td><a href="readnum.jsp?id=${tdto.id }">${tdto.title }</a></td>
				<td>${tdto.userid }</td>
				<td>${tdto.readnum}</td>
				<td>${tdto.writeday}</td>
			</tr>
		</c:forEach>
		<c:if test="${userid != null }">
		<tr>
			<td colspan="5" align="right"><a href="write.jsp">글쓰기</a></td>
		</tr>
		</c:if>
	</table>
</div>
<c:import url="../bottom.jsp" />