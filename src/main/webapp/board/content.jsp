<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="dao.BoardDao" %>
    <%
    	BoardDao bdao=new BoardDao();
    	bdao.content(request);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
</head>
<body>
<c:import url="../top.jsp"/>
<div id="section">
	<table width="50%" border="1" align="center">
		<tr>
			<th> 제목 </th>
			<td align="center">${bdto.title}</td>
		</tr>
		<tr>
			<th> 작성자 </th>
			<td align="center">${bdto.userid}</td>
		</tr>
		<tr>
			<th> 내용 </th>
			<td align="center" height="300">${bdto.content}</td>
		</tr>
		<tr>
			<th> 조회수 </th>
			<td align="center">${bdto.readnum}</td>
		</tr>
		<tr>
			<th> 작성일 </th>
			<td align="center">${bdto.writeday}</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<a href="list.jsp">목록</a>
				<!-- 보이는경우
					- board테이블의 userid값이 guest인 경우
					- board테이블의 userid와 세션의 userid가 같은경우
				안보이는경우
					- board테이블의 userid값이 guest가 아니고
					- board테이블의 userid와 세션의 userid가 다른경우 -->
					
				 <!-- board테이블의 userid필드 guest인 경우 -->
				<c:if test="${(bdto.userid == 'guest') || (bdto.userid == userid) }">
						<a href="update.jsp?id=${bdto.id }">수정</a>
					<c:if test="${bdto.userid == 'guest'}"> <!-- guest일 경우 삭제 입력폼이 존재 -->
						<a href="javascript:del_form()">삭제</a>
					</c:if>
					<c:if test="${bdto.userid == userid}"> <!-- 로그인을 한경우 자신이 작성한 글 -->
						<a href="delete.jsp?id=${bdto.id }">삭제</a>
					</c:if>
				</c:if>
				<c:if test="${userid == 'admin' }">
					<!-- jsp의 내장객체 4가지 "." 을 생략하면 우선순위 context,request,session,application 의 순서로 불러옴
					 dto로 불러왔을때는 작성자가 admin 인지 체크하는것이고 session으로 불러왔을때는 접속자가 admin이냐 체크하는것.-->
					<a href="admindelete.jsp?id=${bdto.id }">관리자삭제</a>
				</c:if>
			</td>
		</tr>
		<tr id="del"> <!-- 삭제폼을 가지는 행 --> 
			<td colspan="4" align="right">
				<form method="post" action="delete.jsp">
					<input type="hidden" name="id" value="${bdto.id }">
					<input type="password" name="pwd">
					<input type="submit" value="삭제">
				</form>
			</td>
		</tr>
	</table>
	<div id="del"> <!-- 삭제 비밀번호를 입력할 폼 -->
	
	</div>
</div>
<script>
	function del_form() {
		//삭제폼을 보이게 한다.
		document.getElementById("del").style.display="table-row";
	}
</script>
<style>
	#del {
		display:none;
	}
</style>
<c:import url="../bottom.jsp" />
</body>
</html>