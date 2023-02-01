<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.BoardDao"%>
<%
	//readnum 1씩 증가시킨후 content로 이동
	BoardDao bdao=new BoardDao();
	bdao.readnum(request,response);
%>