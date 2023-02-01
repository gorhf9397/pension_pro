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
</style>
<script>
	var size=1; // id="outer" 안에 있는 type='file' 의 갯수 , name을 서로 다르게 하기 위해 사용
	function add() {
		size++;
		var outer = document.getElementById("outer");
		var inner="<p class='fname'> <input type='file' name='fname"+size+"'></p>";
		outer.innerHTML=outer.innerHTML+inner;
		//alert(inner);
	}
	function del() {
		if(size>1){
		document.getElementsByClassName("fname")[size-1].remove();
		size--;
		}
	}// input type=file 외에도 다른곳에서 사용가능
</script>
<div id="section">
	<form method="post" action="write_ok.jsp" enctype="multipart/form-data">
		<table width="500" align="center" border="0">
			<caption><h1>여행후기</h1></caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="40"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea cols="60" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
				<th>업로드</th>
				<td id="outer">
					<input type="button" onclick="add()" value="추가">
					<input type="button" onclick="del()" value="삭제">
					<p class="fname"><input type="file" name="fname1"></p>
				</td>
				
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="글작성"></td>
			</tr>
		</table>
	</form>
</div>
<c:import url="../bottom.jsp" />