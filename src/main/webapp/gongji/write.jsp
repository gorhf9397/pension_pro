<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<form method="post" action="write_ok.jsp">
		<table width="300" border="0" align="center">
		<caption><h1>공지사항 글쓰기</h1></caption>
			<tr>
				<td><input type="text" name="title" size="40"
					placeholder="제목을 입력해 주세요"></td>
			</tr>
			<tr>
				<td><textarea cols="60" rows="10" name="content"
						placeholder="내용을 입력해 주세요"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="gubun" value="1">
					이 글을 항상 첫페이지에 출력하고자 하면 체크하세요.
				</td>
			</tr>	
			<tr>
				<td colspan="2" align="right"><input type="submit" value="업로드">
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />