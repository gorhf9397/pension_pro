<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.AdminDao" %>
<%
	AdminDao adao=new AdminDao();
	adao.member_check(request);
%>
<c:if test="${userid != 'admin' }">
	<c:redirect url="../main/index.jsp"/>
</c:if>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
<div id="section">
	<table width="500" align="center">
	<caption><h1>회원현황</h1></caption>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>전화번호</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${mlist }" var="mdto">
			<tr align="center">
				<td>${mdto.name }</td>
				<td>${mdto.userid }</td>
				<td>${mdto.phone }</td>
				<c:if test="${mdto.state == 0 }">
					<th>정상회원</th>
				</c:if>
				<c:if test="${mdto.state == 1 }">
					<th><a href="out_ok.jsp?id=${mdto.id}">탈퇴신청</a></th>
				</c:if>
				<c:if test="${mdto.state == 2 }">
					<th>탈퇴회원</th>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>
<c:import url="../bottom.jsp" />