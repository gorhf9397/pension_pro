<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dao.ReserveDao"%>
<%
ReserveDao rdao = new ReserveDao();
rdao.reserve(request);
rdao.getRoom(request);
%>
<c:import url="../top.jsp" />
<style>
#section {
	width: 1100px;
	height: 2000px;
	margin: auto;
}
</style>
<div id="section">
	     <table width="1000" align="center" border="1">
       <caption>
        <c:if test="${m==1}">
          <a href="reserve.jsp?y=${y-1}&m=12"> 이전 </a>
        </c:if>
        <c:if test="${m!=1}">
          <a href="reserve.jsp?y=${y}&m=${m-1}"> 이전 </a>
        </c:if>
          ${y}년 ${m}월  
        <c:if test="${m==12}">
          <a href="reserve.jsp?y=${y+1}&m=1"> 다음 </a>
        </c:if>
        <c:if test="${m!=12}">
          <a href="reserve.jsp?y=${y}&m=${m+1}"> 다음 </a>
        </c:if>  
          
       </caption>
       <tr>
         <td width="142"> 일 </td>
         <td width="142"> 월 </td>
         <td width="142"> 화 </td>
         <td width="142"> 수 </td>
         <td width="142"> 목 </td>
         <td width="142"> 금 </td>
         <td width="142"> 토 </td>
       </tr>
     <c:set var="day" value="1"/>
     <c:forEach  var="i" begin="1" end="${ju}"> <!-- 행 -->
       <tr height="170">
         <c:forEach var="j" begin="0" end="6">  <!-- 열 -->
          <c:if test="${(j < yoil && i==1) || (chong < day) }">
           <td>&nbsp;  </td>
          </c:if>
          <c:if test="${ ( (j >= yoil && i==1) || i>1 ) && ( chong >= day )   }">
           <td> ${day} <p>
             <!-- 방의 이름을 출력 -->
             <!-- td에 출력되는 날짜가  오늘 이전인지 이후인지를 체크 -->
            <%
                // 년,월은 request영역, 일은 pageContext => 스크립트릿변수
                String y=request.getAttribute("y").toString();
                String m=request.getAttribute("m").toString();
                String d=pageContext.getAttribute("day").toString();
                String dday=y+"-"+m+"-"+d;  // YYYY-MM-DD
           
                rdao.getcheck(y,m,d,request);
            %>
            <c:if test="${tt==1}"> 
             <c:forEach items="${rlist}" var="rdto">
               <!-- 방의 예약여부를 확인  =>dao메소드 (년,월,일,방id) -->
               <c:set var="bang_id" value="${rdto.id}"/>
               <% 
                  String bang_id=pageContext.getAttribute("bang_id").toString();
                  rdao.getEmpty(dday,bang_id,request);
               %>
               <!-- request영역의 cnt변수의 값이 1이면 예약불가, 0이면 예약가능 -->
              <c:if test="${cnt==0}"> 
               <a href="reserve_next.jsp?y=${y}&m=${m}&d=${day}&id=${rdto.id}"> ${rdto.bang} </a> <br>
              </c:if>
              <c:if test="${cnt==1}"> 
               <span style="color:red">${rdto.bang} </span> <br>
              </c:if> 
             </c:forEach> <!-- 방 목록 출력 for -->
            </c:if>
           </td>
           <c:set var="day" value="${day+1}"/>   <!-- 날짜값을 1씩 증가 -->
         </c:if>
          
         </c:forEach>
       </tr>
        
     </c:forEach>
     </table>
</div>
<c:import url="../bottom.jsp" />