<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.BoardDao" %>
<%@page import="dao.GongjiDao" %>
<%@page import="dao.TourDao" %>
<%
	//공지사항
	GongjiDao gdao=new GongjiDao();
	gdao.getThree(request);
	
	//게시판
	BoardDao bdao=new BoardDao();
	bdao.getThree(request);
	
	TourDao tdao=new TourDao();
	tdao.getThree(request);
%>
<c:import url="../top.jsp" />
<div id="third">
	<img src="../img/ice.png" width="1097px" height="400px">
</div>
<div id="fourth">
	<div id="gongji">공지사항
	<table width="320" align="center">
		<c:forEach items="${glist}" var="gdto">
			<tr>
				<td width="220"><a href="../gongji/content.jsp?id=${gdto.id}">${gdto.title}</a></td>
				<td width="100">${gdto.writeday}</td> 
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="tour">여행 후기
	<table width="320" align="center">
		<c:forEach items="${tlist}" var="tdto">
			<tr>
				<td width="220"><a href="../tour/readnum.jsp?id=${tdto.id}">${tdto.title}</a></td>
				<td width="100">${tdto.writeday}</td> 
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="board">게시판
	<table width="320" align="center">
		<c:forEach items="${blist}" var="bdto">
			<tr>
				<td width="220"><a href="../board/readnum.jsp?id=${bdto.id}">${bdto.title}</a></td>
				<td width="100">${bdto.writeday}</td> 
			</tr>
		</c:forEach>
	</table>
	</div>
</div>
<div id="fifth">
	<div id="e1"></div>
	<div id="e2"></div>
	<div id="e3"></div>
	<div id="e4"></div>
	<div id="e5"></div>
</div>
<c:import url="../bottom.jsp" />
