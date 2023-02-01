<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.GongjiDao"%>
<%
GongjiDao gdao = new GongjiDao();
gdao.list(request);
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
	<caption><h1>공지사항</h1></caption>
		<tr id="tr">
			<td class="td1">제목</td>
			<td class="td2">작성자</td>
			<td class="td4">작성일</td>
		</tr>
		<!-- forEach = ArrayList에 지정해둔값을 하나씩 꺼내온다 -->
		<c:forEach items="${list}" var="gdto">
			<tr id="tr2">
				<td class="td1">
				<!-- 그림은 gubun값이 1일경우 -->
				<c:if test="${gdto.gubun == 1}">
				<img src="../img/gg.png" width="20">
				</c:if>
					<a href="content.jsp?id=${gdto.id }">${gdto.title}</a>
				</td>
				<td class="td2">관리자</td>
				<td class="td4">${gdto.writeday}</td>
			</tr>
		</c:forEach>
		<c:if test="${userid == 'admin'}">
		<tr>
			<td colspan="3" align="right"><a href="write.jsp">글쓰기</a></td>
		</tr>
		</c:if>
	</table>
</div>
<c:import url="../bottom.jsp" />