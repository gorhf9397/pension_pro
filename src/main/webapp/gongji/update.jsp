<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.GongjiDao"%>
<%
GongjiDao gdao = new GongjiDao();
gdao.update(request);
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
	<form method="post" action="update_ok.jsp">
		<input type="hidden" name="id" value="${gdto.id }">
		<table width="300" border="0" align="center">
			<tr>
				<td><input type="text" name="title" size="40"
					placeholder="제목을 입력해 주세요" value="${gdto.title }"></td>
			</tr>
			<tr>
				<td><textarea cols="60" rows="10" name="content"
						placeholder="내용을 입력해 주세요">${gdto.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${gdto.gubun == 1}">
						<c:set var="gu" value="checked" />
					</c:if> 
					<input type="checkbox" name="gubun" value="1" ${gu}>
					이 글을 항상 첫페이지에 출력하고자 하면 체크하세요.</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />