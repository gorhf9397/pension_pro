<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.TourDao" %>
<%
	TourDao tdao=new TourDao();
	tdao.content(request, response);
%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 1100px;
	margin: auto;
}
</style>
<div id="section">
	<table width="500" align="center" border="1">
		<tr>
			<th>제목</th>
			<td>${tdto.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${tdto.userid }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td height="300">
				<!-- tdto.file => 배열 -->
			<c:forEach items="${tdto.file}" var="my">	
				<img src="img/${my}" width="50%" hight="50%" align="center">
			</c:forEach>	
				<p>
				${tdto.content }
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${tdto.readnum }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${tdto.writeday}</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<a href="list.jsp">목록</a>
			<c:if test="${userid == tdto.userid }">
				<a href="update.jsp?id=${tdto.id }">수정</a>
				<a href="delete.jsp?id=${tdto.id }">삭제</a>
			</c:if>
			</td>
		</tr>
	</table>
</div>
<c:import url="../bottom.jsp" />