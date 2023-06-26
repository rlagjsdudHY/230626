<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 1. join.html 에서 수신한 데이터를 DTO에 초기화 -->
<% request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id="memBean" class="pack.member.MemberBean" />
<jsp:setProperty name="memBean" property="*" />

<!-- 2. DAO의 객체를 생성(액션태그) -->
<jsp:useBean id="dbConn" class="pack.jdbc.DBConn" />
<%
boolean chkToF = dbConn.memModify(memBean);

if (chkToF) {
%>	
	<script>
		let chkMsg = "정상 수정되었습니다.";
		alert(chkMsg);
		location.href="/member/modify.jsp";
	</script>
<% } %>    
    