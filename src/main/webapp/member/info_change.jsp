<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.MemberDao"%>
<%
MemberDao mdao = new MemberDao();
mdao.info_change(request, session);
%>
<style>
#section {
	width: 1100px;
	height: 400px;
	margin: auto;
	text-align: center;
}
</style>
<c:import url="../top.jsp" />
<div id="section">
	<form method="post" action="info_change_ok.jsp">
		<table width="400" align="center">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userid" value="${mdto.userid}" disabled></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${mdto.name}" disabled></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${mdto.email}"></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td><input type="text" name="phone" value="${mdto.phone}"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />