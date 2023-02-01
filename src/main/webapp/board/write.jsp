<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
<c:import url="../top.jsp" />
<div id="section">
	<form method="post" action="write_ok.jsp">
		<table width="300" border="0" align="center">
			<tr>
				<td><input type="text" name="title" size="40"
					placeholder="제목을 입력해 주세요"></td>
			</tr>
			<tr>
				<td><textarea cols="60" rows="10" name="content"
						placeholder="내용을 입력해 주세요"></textarea></td>
			</tr>
			<c:if test="${userid == null }">
			<tr>
				<td><input type="password" name="pwd" size="4"
					placeholder="비밀번호"></td>
			</tr>
			</c:if>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="업로드">
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />