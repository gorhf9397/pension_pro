<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDao"%>
<%
	MemberDao mdao=new MemberDao();
	mdao.pwd_change_ok(request, session, response);
%>