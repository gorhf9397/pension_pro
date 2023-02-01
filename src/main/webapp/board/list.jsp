<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.BoardDao"%>
<%
BoardDao bdao = new BoardDao();
bdao.list(request);
%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}

#table {
	margin-top: 10px;
	width: 70%;
}

#tr {
	background-color: skyblue;
	font-weight: bold;
	text-align: center;
	border: 1px solid skyblue;
	border-collapse: collapse;
}

#tr2 {
	font-weight: bold;
	text-align: center;
}

.td1 {
	width: 150px;
	text-align: center;
}

.td2 {
	width: 3px;
	text-align: center;
}

.td3 {
	width: 3px;
	text-align: center;
}

.td4 {
	width: 3px;
	text-align: center;
}
</style>

<div id=section>
	<table id="table" align="center">
		<tr id="tr">
			<td class="td1">제목</td>
			<td class="td2">작성자</td>
			<td class="td3">조회수</td>
			<td class="td4">작성일</td>
		</tr>
		<!-- forEach = ArrayList에 지정해둔값을 하나씩 꺼내온다 -->
		<c:forEach items="${list}" var="bdto">
			<tr id="tr2">
				<td class="td1"><a href="readnum.jsp?id=${bdto.id}">${bdto.title}</a></td>
				<td class="td2">${bdto.userid}</td>
				<td class="td3">${bdto.readnum }</td>
				<td class="td4">${bdto.writeday }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="right"><a href="write.jsp">글쓰기</a></td>
		</tr>
	</table>
</div>
<c:import url="../bottom.jsp" />