<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
<div id="section">
	<form method="post" action="write_ok.jsp" enctype="multipart/form-data">
		<table width="600" align="center">
		<caption><h1>여행후기</h1></caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="40"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="60" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
				<th>업로드</th>
				<td><input type="file" name="fname"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="글작성"></td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />