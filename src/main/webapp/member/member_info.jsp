<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="dao.MemberDao"%>
<%
MemberDao mdao = new MemberDao();
mdao.member_info(session, request);
// jsp에 출력할 내용은 request객체영역에 저장을한다
// el 표현식으로 접근 , jstl을 사용
%>
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}

#section table {
	margin-top: 100px;
}
</style>

<c:import url="../top.jsp" />
<div id="section">
	<table width="400" align="center">
		<caption>
			<h2>회원정보</h2>
		</caption>
		<tr>
			<td>아이디</td>
			<td>${mdto.userid}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${mdto.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${mdto.email}</td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td>${mdto.phone}</td>
		</tr>
		<tr>
			<td colspan="2">
				<span onclick="location='info_change.jsp'">정보수정</span> 
				<span onclick="location='pwd_change.jsp'">비밀번호 변경</span>
				<span onclick="location='member_out.jsp'">회원탈퇴</span>
			</td>
		</tr>
	</table>
</div>
<c:import url="../bottom.jsp" />
