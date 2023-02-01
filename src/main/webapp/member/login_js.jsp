<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
#section input[type=text] {
    width:300px;
    height:40px;
    border:1px solid orange;
    outline:none;
  }
  #section input[type=password] {
    width:300px;
    height:40px;
    border:1px solid orange;
    outline:none;
  }
  #section input[type=submit] {
    width:300px;
    height:40px;
    border:1px solid orange;
    outline:none;
    background:orange;
    color:white;
    font-size:20px;
  }
  #userid_form , #pwd_form {
    display:none;
  }
  #loginform{
  	text-align: center;
  }
</style>
<script>
	function userid_func() {
		document.getElementById("userid_form").style.display="block";
		document.getElementById("pwd_form").style.display="none";
		document.pf.userid.value="";
		document.pf.name.value="";
		document.pf.phone.value="";
	}
	function pwd_func() {
		document.getElementById("pwd_form").style.display="block";
		document.getElementById("userid_form").style.display="none";
		document.pf.name.value="";
		document.pf.phone.value="";
	}
</script>
<div id="section">
	<h2>로그인</h2>
	<form id="loginform" method="post" action="login_ok.jsp">
		<c:if test="${chk == 5 }">
			<div id="msg_print">아이디, 비밀번호 정보가 일치하지 않습니다.</div>
			<% session.removeAttribute("chk"); %>
		</c:if>
		<input type="text" name="userid" placeholder="아이디"><p>
		<input type="password" name="pwd" placeholder="비밀번호"><p>
		<input type="submit" value="로그인">
	</form>
	
	<div>
		<span id="btn" onclick="userid_func()">아이디 찾기</span> <!-- 아이디폼은 보이고 비밀번호 폼은 숨기기 + 숨기는 폼의 값을 비우기 -->
		<span id="btn" onclick="pwd_func()">비밀번호 찾기</span> <!-- 비밀번호폼은 보이고 아이디폼은 숨기기 + 숨기는 폼의 값을 비우기 -->
	</div>
	<c:if test="${chk == 1}">
		<div id="msg_print"> 당신의 아이디는 ${imsiuser}입니다.</div>
		<%
			session.removeAttribute("imsiuser");
			session.removeAttribute("chk");
		%>
	</c:if>
	<c:if test="${chk == 2}">
		<div id="msg_print">이름, 전화번호 정보가 일치하지 않습니다.</div>
		<% session.removeAttribute("chk"); %>
	</c:if>
	<c:if test="${chk == 3}">
		<div id="msg_print">당신의 비밀번호는 ${pwd}입니다.</div>
		<%
			session.removeAttribute("pwd");
			session.removeAttribute("chk");
		%>
	</c:if>
	<c:if test="${chk == 4}">
		<div id="msg_print">이름, 전화번호 정보가 일치하지 않습니다.</div>
		<%
			session.removeAttribute("chk");
		%>
	</c:if>
	<div id="userid_form">
		<form name="uf" method="post" action="userid_search_js.jsp">
			<input type="text" placeholder="이름" name="name"> <p>
			<input type="text" placeholder="전화번호" name="phone"><p>
			<input type="submit" value="아이디찾기">
		</form> 
	</div>
	<div id="pwd_form">
		<form name="pf" method="post" action="pwd_search_js.jsp">
			<input type="text" placeholder="아이디" name="userid"><p>
			<input type="text" placeholder="이름" name="name"><p>
			<input type="text" placeholder="전화번호" name="phone"><p>
			<input type="submit" value="비밀번호찾기">
		</form>
	</div>
</div>
<c:import url="../bottom.jsp" />