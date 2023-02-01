<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="dao.ReserveDao" %>
<%
	ReserveDao rdao=new ReserveDao();
	rdao.reserve_view(session, request);
	//rdao.getRoom(request);
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
	<table width="900" align="center">
		<caption><h2>${name}님의 예약내용</h2></caption>
		<tr align="center">
			<td>방</td>
			<td>입실일</td>
			<td>입실시간</td>
			<td>퇴실일</td>
			<td>숯패키지</td>
			<td>bbq</td>
			<td>총결제금액</td>
			<td>예약일</td>
			<td>상태</td>
			<td>&nbsp;</td>
		</tr>
		<c:forEach items="${rlist}" var="rdto">
		<tr align="center">
			<td>${rdto.bang}</td>
			<td>${rdto.inday }</td>
			<td>14:00</td>
			<td>${rdto.outday }</td>
			<td>${rdto.charcoal }개</td>
			<td>${rdto.bbq }개</td>
			<td><fmt:formatNumber value="${rdto.total }"/>원</td>
			<td>${rdto.writeday}</td>
			<c:set var="state" value=""/>
			<c:if test="${rdto.state == 0 }">
				<c:set var="state" value="예약완료"/>
			</c:if>
			<c:if test="${rdto.state == 1 }">
				<c:set var="state" value="예약취소중"/>
			</c:if>
			<c:if test="${rdto.state == 2 }">
				<c:set var="state" value="취소완료"/>
			</c:if>
			<c:if test="${rdto.state == 3 }">
				<c:set var="state" value="사용완료"/>
			</c:if>
			<td>${state}</td>
			<!-- 버튼 만들 td -->
			<!-- 예약완료일 경우 에약취소버튼 -->
			<c:if test="${rdto.state==0 }">
				<td><input type="button" value="예약취소" onclick="location='state_change.jsp?id=${rdto.id}&state=1&ck=${ck}'"></td>  <!-- reserve 테이블의 state필드의 값을 1로 변경 -->
			</c:if>
			<!-- 예약취소중일 경우 취소철회버튼 -->
			<c:if test="${rdto.state==1 }">
				<td><input type="button" value="취소철회" onclick="location='state_change.jsp?id=${rdto.id}&state=0&ck=${ck}'"></td>	<!-- reserve 테이블의 state필드의 값을 0로 변경 -->
			</c:if>		<!-- rdto.state==2 || rdto.state==3 -->
			<c:if test="${!(rdto.state==0 || rdto.state==1)}">
				<td>&nbsp;</td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
</div>
<c:import url="../bottom.jsp" />
<!-- 
1. join은 2개이상의 테이블에 필요한 데이터를 가져올때
2. 필드명 부분에 각각테이블의 읽어올 필드명을 적는다
	테이블,필드명으로 적는다
	=> 예외 : 2개이상의 테이블에서 유일한 필드명은 테이블명을 생략해도 된다
3. 테이블명의 별칭을 정할 수 있다
	테이블명 as 별칭
4. select 필드명 from 테이블1,테이블2 where조건;
	select 필드명 from 테이블1 inner join 테이블2 on조건;
	 -->