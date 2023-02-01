<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 1300px;
	margin: auto;
	padding-top:100px;
}
#topdiv{
	position:relative;
	left:200px;
}
#bottomdiv{
	position:relative;
	left:210px;
}
#pricetable{
	margin-left: 208px;
	border-spacing:0px;
}
</style>
<div id="section">

	<div id="topdiv"><img src="../img/guide_top.JPG"></div>
	<br>
	<br>
<table id="pricetable"width="900" border="1">
	<tr>
		<th rowspan="2">객실명</th>
		<th rowspan="2">구조</th>
		<th colspan="2">인원</th>
		<th colspan="2">비수기</th>
		<th colspan="2">준성수기</th>
		<th colspan="2">성수기</th>
	</tr>
	<tr align="center">
		<th>기준</th>
		<th>최대</th>
		<th>주중</th>
		<th>주말</th>
		<th>주중</th>
		<th>주말</th>
		<th>주중</th>
		<th>주말</th>
	</tr>
	<tr align="center">
		<td>풍동</td>
		<td>15평</td>
		<td>2명</td>
		<td>4명</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
	</tr>
	<tr align="center">
		<td>중산동</td>
		<td>25평</td>
		<td>2명</td>
		<td>6명</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
	</tr>
	<tr align="center">
		<td>식사동</td>
		<td>26평</td>
		<td>3명</td>
		<td>7명</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
	</tr>
	<tr align="center">
		<td>주엽동</td>
		<td>28평</td>
		<td>5명</td>
		<td>10명</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
	</tr>
	<tr align="center">
		<td>덕이동</td>
		<td>50평</td>
		<td>10명</td>
		<td>20명</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
	</tr>
	<tr align="center">
		<td>운정1동</td>
		<td>120평</td>
		<td>13명</td>
		<td>100명</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
		<td>50,000원</td>
	</tr>
</table>
	<br>
	<br>
	<div id="bottomdiv"><img src="../img/guide_bottom.JPG"></div>

</div>
<c:import url="../bottom.jsp" />