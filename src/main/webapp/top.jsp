<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
body {
	margin: 0px;
}
a {
	text-decoration:none;
	color:black;
}

#first {
	width: 1100px;
	height: 33px;
	margin: auto;
	background: skyblue;
	text-align: center;
	color: white;
	padding-top: 7px;
}

#second {
	width: 1200px;
	height: 60px;
	margin: auto;
	padding-left: 90px;
	/*     background:yellow; */
}

#second>#left {
	width: 200px;
	height: 50px;
	padding-top:5px;
	padding-left: 5px;
}

#second>#right {
	width: 950px;
	height: 60px;
}

#second>#left, #second>#right {
	display: inline-block;
}

#second>#right>ul>li {
	list-style-type: none;
	display: inline-block;
	width: 140px;
}
#second>#right>ul>li:last-child {
	width:280px;
}

#second #right #main { /* 주메뉴 */
	position: relative;
	bottom:17px;
}
#second #right #logintag {
	position:absolute;
	top:60px;
}

#second #right #main .sub { /* 부메뉴 ul태그 */
	position: absolute; /* 부메뉴의 기준점이 주메뉴로 된다 */
	padding-left: 0px;
	visibility: hidden;
	background:white;
	padding:8px;
}

#second #right #main .sub li {
	list-style-type: none;
}

#third {
	width: 1100px;
	height: 400px;
	margin: auto;
	/*     background:#cccccc; */
}

#fourth {
	width: 1100px;
	height: 130px;
	margin: auto;
	/*     background:green; */
}

#fourth>div {
	width: 360px;
	height: 130px;
	border: 1px solid skyblue;
	display: inline-block;
}

#fifth {
	width: 1100px;
	height: 150px;
	margin: auto;
	/*     background:pink; */
}

#fifth>div {
	width: 213px;
	height: 150px;
	border: 1px solid skyblue;
	display: inline-block;
}

#sixth {
	width: 1100px;
	height: 100px;
	margin: auto;
	background: skyblue;
	color: white;
}
</style>
<script>
	function view(n) {
		document.getElementsByClassName("sub")[n].style.visibility = "visible";
	}
	function hide(n) {
		document.getElementsByClassName("sub")[n].style.visibility = "hidden";
	}
</script>
</head>
<body>
	<!-- index.jsp -->
	<div id="first">
		펜션 오픈 기념 1박에 100원에 !!! <span id="aa">X</span>
	</div>
	<div id="second">
		<div id="left">
			<a href="../main/index.jsp"><img src="../img/lllooo.png" height="50"></a>
		</div>
		<div id="right">
			<ul id="taglist">
				<li id="main" onmouseover="view(0)" onmouseout="hide(0)">펜션소개
					<ul class="sub">
						<li><a href="../sogae/intro.jsp"> 인사말 </a></li>
						<li>객실소개</li>
						<li>오시는길</li>
					</ul>
				</li>
				<li id="main" onmouseover="view(1)" onmouseout="hide(1)">여행정보
					<ul class="sub">
						<li>주문진 항</li>
						<li>장사해수욕장</li>
						<li>설악산</li>
						<li>정동진</li>
					</ul>
				</li>
				<li id="main" onmouseover="view(2)" onmouseout="hide(2)">예약관련
					<ul class="sub">
						<li><a href="../reserve/reserve_guide.jsp">예약안내</a></li>
						<li><a href="../reserve/reserve.jsp">예약하기</a></li>
					</ul>
				</li>
				<li id="main" onmouseover="view(3)" onmouseout="hide(3)">커뮤니티
					<ul class="sub">
						<li><a href="../gongji/list.jsp">공지사항</a></li>
						<li><a href="../tour/list.jsp">여행후기</a></li>
						<li><a href="../board/list.jsp">자유게시판</a></li>
					</ul>
				</li>
				<li id="logintag">
					<c:if test="${userid == null}">
					<a href="../member/login.jsp">로그인</a> 
					<a href="../member/member_input.jsp">회원가입</a>
					</c:if>
					
					<c:if test="${userid != null }">
					${name} 님 
					<a href="../member/logout.jsp"> 로그아웃 </a>
					<c:if test="${userid != 'admin' }">
						<a href="../member/member_info.jsp"> 회원정보 </a>
						<a href="../reserve/reserve_view.jsp">예약정보</a>
					</c:if>
					<c:if test="${userid == 'admin' }">
						<div id="admin" onmouseover="admin_view()" onmouseout="admin_hide()">관리자 메뉴
							<ul id="sub">
								<li><a href="../admin/room_view.jsp">객실관리</a></li>
								<li><a href="../admin/reserve_check.jsp">예약관리</a></li>
								<li><a href="../admin/member_check.jsp">회원관리</a></li>
							</ul>
						</div>
					</c:if>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
	<script>
		function admin_view() {
			document.querySelector("#second #admin #sub").style.visibility="visible";
			//css선택자를 사용할 수 있다
		}
		function admin_hide(){
			document.querySelector("#second #admin #sub").style.visibility="hidden";
		}
	</script>
	<style>
		#second #admin {
        display:inline-block;
        position:relative;
      }
      #second #admin #sub {
        position:absolute;
        padding-left:0px;
        background:white;
        padding:8px;
        visibility:hidden;
      }
      #second #admin #sub li {
        list-style-type:none;
        height:25px;
      }
	</style>