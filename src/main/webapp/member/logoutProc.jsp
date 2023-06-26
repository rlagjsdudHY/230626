<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();   // 세션 강제 소멸
%>    
<script>
	alert("로그아웃하셨습니다.");		
	location.href="/index.jsp";
</script>