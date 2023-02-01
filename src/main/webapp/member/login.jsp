<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}

.login_form {
	text-align: center;
	margin-top: 100px;
}

.login_form input {
	width: 300px;
	height: 40px;
	border: 1px solid skyblue;
}

.login_form input[type=submit] {
	width: 306px;
	background: skyblue;
}

#search {
	text-align: center;
}

#userid, #pwd {
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid skyblue;
	padding-top: 7px;
	cursor: pointer;
}

#userid_search {
	margin: auto;
	width: 160px;
	height: 140px;
	margin-top: 30px;
	display: none;
}

.us {
	margin-top: 30px;
	width: 160px;
	height: 140px;
	border: 1px solid skyblue;
	text-align: center;
}

.us input {
	width: 120px;
	height: 26px;
}

.us input[type=button] {
	width: 128px;
	height: 28px;
}
</style>
</head>
<body>
	<div id="section">
		<form method="post" action="login_ok.jsp" class="login_form">
			<%
			if (request.getParameter("chk") != null) {
			%>
			<div style="font-size: 12px; color: red">아이디 or 비밀번호 오류</div>
			<%
			}
			%>
			<input type="text" name="userid" placeholder="아이디 입력">
			<p>
				<input type="password" name="pwd" placeholder="비밀번호 입력">
			<p>
				<input id="loginsubmit" type="submit" value="로그인">
			<p>
		</form>
		<div id="search">
			<div id="userid" onclick="us_view(0)">아이디 찾기</div>
			<div id="pwd" onclick="us_view(1)">비밀번호 찾기</div>
		</div>
		<div id="userid_search">
			<span id=inn></span>
			<form name="us" class="us">
				<input type="text" name="name" placeholder="이름">
				<p>
					<input type="text" name="phone" placeholder="번호">
				<p>
					<input type="button" value="ID찾기" onclick="search_userid()">
				<p>
			</form>
			<form name="ps" class="ps">
				<input type="text" name="userid" placeholder="아이디">
				<p>
					<input type="text" name="name" placeholder="이름">
				<p>
					<input type="text" name="phone" placeholder="번호">
				<p>
					<input type="button" value="비밀번호 찾기" onclick="search_pwd()">
			</form>
		</div>
	</div>
	<script>
		function us_view(n) {
			document.querySelector("#userid_search").style.display = "block";
			if (n == 0) {
				document.ps.style.display = "none";
				document.us.style.display = "block";
			} else {
				document.us.style.display = "none";
				document.ps.style.display = "block";
			}
			document.querySelector("#inn").innerText = "";
		}
		function search_pwd() {
			const name = document.ps.name.value;
			const phone = document.ps.phone.value;
			const userid = document.ps.userid.value;
			const chk = new XMLHttpRequest();
			chk.open("get", "pwd_search.jsp?name=" + name + "&phone=" + phone
					+ "&userid=" + userid);
			chk.send();
			chk.onreadystatechange = function() {
				if (chk.readyState == 4) {
					const pwd = chk.responseText.trim();
					if (pwd == "1") {
						alert("틀렷다");
					} else {
						document.querySelector("#inn").innerText = "비밀번호 : "+pwd;
						document.ps.style.display = "none";
						document.ps.userid.value = "";
						document.ps.name.value = "";
						document.ps.phone.value = "";
					}
				}
			}
		}
		function search_userid() {
			const name = document.us.name.value;
			const phone = document.us.phone.value;
			const chk = new XMLHttpRequest();

			chk.open("get", "userid_search.jsp?name=" + name + "&phone="
					+ phone);

			chk.send();
			chk.onreadystatechange = function() {
				if (chk.readyState == 4) {
					let uid = chk.responseText.trim();
					if (uid == "1") {
						alert("정보 틀림");
					} else {
						document.querySelector("#inn").innerText = "ID : "
								+ uid;
						document.us.style.display = "none";
						document.us.name.value = "";
						document.us.phone.value = "";
					}
				}
			}
		}
	</script>
	<c:import url="../bottom.jsp" />
</body>
</html>