<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- 1. join.html 에서 수신한 데이터를 DTO에 초기화 -->
<% request.setCharacterEncoding("UTF-8"); %>


<jsp:useBean id="memBean" class="pack.member.MemberBean" />
<jsp:setProperty name="memBean" property="*" />

<!-- 2. DAO의 객체를 생성(액션태그) -->
<jsp:useBean id="dbConn" class="pack.jdbc.DBConn" />
<%
int rtnCnt = dbConn.memInsert(memBean);
//int rtnCnt = dbConn.memInsert(uid, upw, uemail);
String chkMsg = null;
if (rtnCnt == 1) {
	chkMsg = "정상 처리되었습니다.";
}
%>


<!-- 3. DAO에서 커스텀메서드로 HTML에서 입력받은 자료를 accountTest.memberList 테이블에 저장 -->
<!-- 4. 위의 작업이 정상적으로 처리되도록 HTML, JSP, DAO, DTO를 직접 구현하고 실행 -->    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
		<style>
		div#wrap { width: 600px; padding: 10px; border: 3px solid #aaa; border-radius: 6px; margin: 30px auto; }
		hr { margin: 20px 0px; }
		</style>
	</head>
	<body>
		<div id="wrap">
			<h1><%= chkMsg %></h1>
			<button id="goMain">메인페이지로 이동</button>
			
		</div>
		<!-- div#wrap -->
		<script src="https://code.jquery.com/jquery-3.6.4.js"
				integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
				crossorigin="anonymous"></script>
		<script>
		$(function(){
			$("#goMain").click(function(){
				location.href = "/";   // 메인페이지 /index.jsp
			});
		});
		</script>
	</body>
</html>