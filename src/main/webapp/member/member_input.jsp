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

#err {
	font-size: 12px;
}
</style>
<script>
	var uchk = 0; // 아이디의 중복체크 여부를 확인하는 변수 0이면 확인x  1이면 확인하였다.
	function userid_check(userid) {
		if (userid.trim() == "") {
			alert("아이디는 빈값을 쓰지 마세요")
			uchk = 0; // 사용가능한 아이디에서 지웟을때
			document.getElementById("err").innerText = "";
		} else {
			var chk = new XMLHttpRequest();
			// XMLHttpRequest 새로고침 없이도 URL에서 데이터를 가져올 수 있다.
			// readyState 로 요청의 상태를 나타내는 숫자를 반환한다.
			chk.open("get", "userid_check.jsp?userid=" + userid);
			chk.send();

			chk.onreadystatechange = function() {
				if (chk.readyState == 4) { //사용가능하면0, 사용불가능1
					//httprequest.readyState==4 데이터를 전부 받았을 때.
					if (chk.responseText.trim() == "0") { //trim()은 문자열 양 끝의 공백을 제거
						//responseText 는 서버에요청하여 응답받은 데이터를 문자로 반환.
						// member의 userid값을 count하여 공백을 제거한 text 0 or 1 로 받아온다
						document.getElementById("err").innerText = "사용 가능한 아이디";
						document.getElementById("err").style.color = "blue";
						uchk = 1;
					} else {
						document.getElementById("err").innerText = "사용 불가능한 아이디";
						document.getElementById("err").style.color = "red";
						uchk = 0;
					}
				}
			}
		}
	}
	var pchk = 0; //비밀번호의 확인 여부를 확인하는 변수 0이면 확인x 1이면 확인ㅇ
	function pwd_check(pwd2) {
		var pwd = document.pkc.pwd.value;
		if (pwd == pwd2) {
			document.getElementById("perr").innerText = "비번이 맞다!";
			document.getElementById("perr").style.color = "blue";
			pchk = 1;
		} else {
			document.getElementById("perr").innerText = "비번이 틀리다!";
			document.getElementById("perr").style.color = "red";
			pchk = 0;
		}
	}
	function check(my) {
		//아이디, 비번, 이름, 전화번호
		if (uchk == 0) {
			alert("아이디 중복체크 ㄱㄱ");
			return false;
		} else if (pchk == 0) {
			alert("비번 체크 ㄱㄱㄱ");
			return false;
		} else if (my.name.value.trim() == "") {
			alert("이름 체크ㄱㄱㄱ");
			return false;
		} else if (my.phone.value.trim() == "") {
			alert("전화번호 체크 ㄱㄱㄱㄱ")
			return false;
		} else {
			return true;
		}
	}
</script>
<!-- 
	1.회원아이디조회
	2.비밀번호의 일치여부
	3.필수입력(아이디,이름,전화번호)
	 -->

<div id="section">
	<form name="pkc" method="post" action="member_input_ok.jsp"
		onsubmit="return check(this)">
		<table width="300" align="center">
			<caption>
				<h2>회원 가입</h2>
			</caption>
			<tr>
				<th>ID</th>
				<td><input type="text" name="userid"
					onblur="userid_check(this.value)"><br> <span id="err"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" name="pwd2"
					onkeyup="pwd_check(this.value)"> <br> <span id="perr"></span>
				</td>
			</tr>
			<tr>
				<th>e-mail</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="가입하기"></td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />