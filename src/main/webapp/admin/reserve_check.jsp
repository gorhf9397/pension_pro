<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.AdminDao" %>
<%
	AdminDao adao=new AdminDao();
	adao.reserve_check(request);
%>
<c:if test="${userid != 'admin' }">
	<c:redirect url="../main/index.jsp"/>
</c:if>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 1000px;
	margin: auto;
}
</style>
<div id="section">
	<table width="800" align="center">
	<caption><h2>예약현황</h2></caption>
		<tr>
			<th>예약자</th>
			<th>입실일</th>
			<th>퇴실일</th>
			<th>인원</th>
			<th>숯패키지</th>
			<th>bbq</th>
			<th>결제금액</th>
			<th>객실명</th>
			<th>예약일</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${rlist }" var="rdto">
			<tr align="center">
				<td> ${rdto.userid} </td>
		        <td> ${rdto.inday} </td>
		        <td> ${rdto.outday} </td>
		        <td> ${rdto.inwon} </td>
		        <td> ${rdto.charcoal} </td>
		        <td> ${rdto.bbq} </td>
		        <td> ${rdto.total} </td>
		        <td> ${rdto.bang} </td>
		        <td> ${rdto.writeday} </td>
		        <c:if test="${rdto.state == 0 }">
		        	<td>예약완료</td>
		        </c:if>
		        <c:if test="${rdto.state == 1 }">
		        	<td><a href="reserve_cancel.jsp?id=${rdto.id}">예약취소중</a></td>
		        </c:if>
		        <c:if test="${rdto.state == 2 }">
		        	<c:set var="state" value="취소완료"/>
		        </c:if>
		        <c:if test="${rdto.state == 3 }">
		        	<c:set var="state" value="사용완료"/>
		        </c:if>
		        	<td>${state}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<c:import url="../bottom.jsp" />