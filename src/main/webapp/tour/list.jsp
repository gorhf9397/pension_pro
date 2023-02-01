<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.TourDao" %>
<%
	TourDao tdao=new TourDao();
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
	<table width="600" align="center">
		<tr>
			<th>제목</th>
			<th>아이디</th>
			<th>사진갯수</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list}" var="tdto">
			<tr>
				<td><a href="readnum.jsp?id=${tdto.id}">${tdto.title}</a></td>
				<td>${tdto.userid}</td>
				<td><img src="img/${tdto.img}" width="30"> 외 ${tdto.cnt-1}개</td>
				<td>${tdto.readnum}</td>
				<td>${tdto.writeday}</td>
			</tr>
		</c:forEach>
		<c:if test="${userid != null}">
			<tr>
				<td colspan="5" align="right"><a href="write.jsp">글쓰기</a></td>
			</tr>
		</c:if>
	</table>
</div>
<c:import url="../bottom.jsp" />