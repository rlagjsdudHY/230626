<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dbConn" class="pack.jdbc.DBConn" />    
<%
String loginSession = (String)session.getAttribute("loginSession");
//out.print("loginSession : " + loginSession);

boolean accountChk = false;
accountChk = dbConn.memWithdraw(loginSession);

if (accountChk==true && loginSession != null) {
	// 탈퇴소스 구현
	session.invalidate();
%>
	<script>
		alert("탈퇴되었습니다. 그동안 이용해주셔서 고맙습니다.");
		location.href = "/index.jsp";
	</script>
<%	} else {  %>
	<script>
		alert("다시 로그인해주세요.");
		location.href = "/index.jsp";
	</script>

<% } %>    