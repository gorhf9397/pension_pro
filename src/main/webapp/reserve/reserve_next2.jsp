<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="dao.ReserveDao"%>
<%
	ReserveDao rdao=new ReserveDao();
	rdao.reserve_next(request);
%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 500px;
	margin: auto;
}
</style>
<script>
	function total_price(){ //총 가격 구하는 함수
		//숙박,인원,숯,bbq의 선택값을 가져와서 각각의 금액을 구한다..
		//숙박
		var ss=document.reser.suk.value;
		var ssprice=ss*${rdto.price};
		document.getElementById("suk").innerText=new Intl.NumberFormat().format(ssprice);
		//인원
		var ii=document.reser.inwon.value;
		ii=ii-${rdto.min};
		var iiprice=ii*20000;
		document.getElementById("inwon").innerText=new Intl.NumberFormat().format(iiprice);
		//숯
		var cc=document.reser.charcoal.value;
		var ccprice=cc*20000;
		document.getElementById("charcoal").innerText=new Intl.NumberFormat().format(ccprice);
		//bbq
		var bb=document.reser.bbq.value;
		var bbprice=bb*50000;
		document.getElementById("bbq").innerText=new Intl.NumberFormat().format(bbprice);
		
		//total
		var tt=ssprice+iiprice+ccprice+bbprice;
		document.getElementById("total").innerText=new Intl.NumberFormat().format(tt);
		
		// form태그내에 총금액을 전달
		//document.reser.total.value=tt;
		function comma(pp){
			return new intl.NumberFormat().format(pp);
		}
	}
</script>
<div id="section">
	<form name="reser" method="post" action="reserve_ok.jsp">
	<input type="hidden" name="inday" value="${ymd}">
	<input type="hidden" name="bang_id" value="${rdto.id}">
	<input type="hidden" name="total" value="${rdto.price}">
	<table width="600" align="center">
		<caption><h2>${rdto.bang}예약정보</h2></caption>
		<tr>
			<td>입실일</td>
			<td>${ymd}</td>
			<td>숙박일수</td>
			<td><select name="suk" onchange="total_price()">
					<option value="1">1박</option>
					<option value="2">2박</option>
					<option value="3">3박</option>
					<option value="4">4박</option>
					<option value="5">5박</option>
					<option value="6">6박</option>
			</select></td>
		</tr>
		<tr>
			<td>기준인원</td>
			<td>(${rdto.min}/${rdto.max})</td>
			<td>입실인원</td>
			<td><select name="inwon" onchange="total_price()">
					<c:forEach begin="${rdto.min}" end="${rdto.max}" var="i">
						<option value="${i}">${i}명</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>숯패키지</td>
			<td><select name="charcoal" onchange="total_price()">
					<option value="0">선택안함</option>
					<option value="1">1개</option>
					<option value="2">2개</option>
					<option value="3">3개</option>
					<option value="4">4개</option>
					<option value="5">5개</option>
			</select></td>
			<td>bbq(삼겹살및 재료)</td>
			<td><select name="bbq" onchange="total_price()">
					<option value="0">선택안함</option>
					<option value="1">1개</option>
					<option value="2">2개</option>
					<option value="3">3개</option>
					<option value="4">4개</option>
					<option value="5">5개</option>
			</select></td>
		</tr>
		<tr>
			<td>숙박 가격</td>
			<td colspan="3"><span id="suk"><fmt:formatNumber value="${rdto.price}" type="number"/></span>원</td>
		</tr>
		<tr>
			<td>인원 추가</td>
			<td colspan="3"><span id="inwon"></span>원</td>
		</tr>
		<tr>
			<td>숯 패키지</td>
			<td colspan="3"><span id="charcoal"></span>원</td>
		</tr>
		<tr>
			<td>bbq재료</td>
			<td colspan="3"><span id="bbq"></span>원</td>
		</tr>
		<tr>
			<td>총 가격</td>
			<td colspan="3"><span id="total"><fmt:formatNumber value="${rdto.price}" type="number"/></span>원</td>
		</tr>								<!-- fmt:formatNumber:가격의 "," 를 추가해서 가격을구분한다 ex)100000 => 100,000 -->
		<tr>
			<td colspan="4" align="right">
				<input type="submit" value="예약">
			</td>
		</tr>
	</table>
	</form>
</div>
<c:import url="../bottom.jsp" />

<!-- 상태 state int default 0 

	reserve jsp =>방이름클릭 =>reserve_next.jsp
	(년월일 방의 id)
	
	기본정보 몇박? 인원 옵션
	
	숯패키지
	bbq
	
	입실일출력 몇박입력
 -->
 <!-- 
 예약하기 => reserve테이블
 1.입실일		inday date
 2.퇴실일		outday date
 3.아이디		userid char
 4.어떤방		bang_id int
 5.인원		inwon int
 6.숯		charcoal int
 7.bbq		bbq int
 8.total금액	total int
 9.writeday(예약날짜)writeday date
  -->
