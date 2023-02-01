<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="dao.GongjiDao" %>
    <%
    	GongjiDao gdao=new GongjiDao();
    	gdao.content(request);
    %>
    <c:import url="../top.jsp"/>
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
	<div id="section">
		<table width="400" align="center"> 
			<caption><h1>공지사항</h1></caption>
			<tr>
				<th>제목</th>
				<td>${gdto.title }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${gdto.writeday }</td>
			</tr>
			<tr height="200">
				<th>내용</th>
				<td colspan="2">${gdto.content }</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<a href="list.jsp">목록</a>
					<c:if test="${userid == 'admin' }">
					<a href="update.jsp?id=${gdto.id }">수정</a>
					<a href="delete.jsp?id=${gdto.id }">삭제</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
<c:import url="../bottom.jsp" />
