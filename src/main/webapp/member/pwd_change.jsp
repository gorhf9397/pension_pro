<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <style>
    	#section {
		width: 1100px;
		height: 400px;
		margin: auto;
		text-align:center;
	}
	#section form {
		margin-top:100px;
	}
    </style>
<c:import url="../top.jsp" />
	<div id="section">
		<form method="post" action="pwd_change_ok.jsp">
			<%if(request.getParameter("chk") != null) { %>
				<div style="color:red;font-size:13;">기존 비밀번호가 틀립니다.</div>
			<%} %>
			<input type="password" name="old_pwd" placeholder="기존 비밀번호"><p>
			<input type="password" name="pwd" placeholder="변경할 비번"><p>
			<input type="password" name="pwd2" placeholder="비번 확인"><p>
			<input type="submit" value="비밀번호 변경">
		</form> 
	</div>
<c:import url="../bottom.jsp" />