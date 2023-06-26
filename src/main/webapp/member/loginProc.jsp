<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dbConn" class="pack.jdbc.DBConn" />    
<%
request.setCharacterEncoding("UTF-8");
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
//out.print("uid : " + request.getParameter("uid"));
//out.print("upw : " + request.getParameter("upw"));
boolean accountChk = false;
accountChk = dbConn.memLogin(uid, upw);

out.print("accountChk : " + accountChk);
if (accountChk) {   
	// 로그인 성공(=입력한 ID/PW가 존재함)
	// 세션 적용하고, 메인페이지로 이동함
	
	session.setAttribute("loginSession", uid);   // 세션 설정
	session.setMaxInactiveInterval(10*60);     // 테스트용 10분 설정
	
	response.sendRedirect("/index.jsp");
	
} else {
	// 로그인 실패(=입력한 ID/PW가 없음 또는 잘못됨)
	// 자바스크립트로 오류메시지 출력하고 로그인페이지로 되돌아감
%>

	<script>
		alert("일치하는 정보가 없습니다.");
		history.back();
	</script>

<%}%>


