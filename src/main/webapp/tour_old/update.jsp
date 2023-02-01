<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.TourDao_old" %>
<%
	TourDao_old tdao=new TourDao_old();
	tdao.update(request);
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
	<form method="post" action="update_ok.jsp" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${tdto.id }">
		<input type="hidden" name="fname2" value="${tdto.fname }">
		<table width="500" align="center">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${tdto.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="40" name="content" rows="9">${tdto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="file" name="fname"><p>
					<img src="img/${tdto.fname }" width="50%" height="50%" align="center">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />