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
	<input type="button" onclick="add()" value="추가"><br>
	<input type="button" onclick="del()" value="삭제">
	<hr>
	<div id="outer">
		<p class="fname"><input type="file" name="fname1"></p>
	</div>
</div>
<c:import url="../bottom.jsp" />