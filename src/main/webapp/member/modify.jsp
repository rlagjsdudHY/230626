<%@page import="pack.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginSession = (String)session.getAttribute("loginSession");
//out.print("loginSession : " + loginSession);
%>

<jsp:useBean id="dbConn" class="pack.jdbc.DBConn" />

<%
MemberBean bean = dbConn.memModifyRead(loginSession);
String email = bean.getUemail();    // test2@naver.com
int idxAtMark = email.indexOf("@");    // at mart => @, test2@naver.com 에서는 idx가 5
String email1 = email.substring(0, idxAtMark);
String email2 = email.substring(idxAtMark+1);
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<link rel="stylesheet" href="/style/style_Member.css">
		<style>
	    	div#lnbArea { position: relative; }
	    	#lnbArea>span { position: absolute; right: 20px; top: 10px;  }
	    	#lnbArea>span:hover { color: #666; font-weight: bold; cursor: pointer;
	    	}
		</style>
	</head>
	<body>
		<div id="wrap">
		
		
	        <form id="modifyForm">
	        
	        	<div id="lnbArea"><span>메인페이지</span></div>
	            
	            <table>
	                <caption>회원정보 수정</caption>
	                <tbody>
	                    <tr>
	                        <th class="req">아이디</th>
	                        <td><%=loginSession %></td>
	                    </tr>
	                    <tr>
	                        <th class="req">비밀번호</th>
	                        <td>
	                            <input type="password" name="upw" id="upw" maxlength="20">
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>비밀번호 확인</th>
	                        <td>
	                            <input type="password" id="upwRe">
	                            <span id="pwChk"></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="req">이메일</th>
	                        <td>
	                            <input type="text" class="email1" id="email1" value="<%=email1%>">
	                            <span>@</span>
	                            <input type="text" class="email2" id="email2" value="<%=email2%>">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                        	<input type="hidden" name="uid" value="<%=loginSession%>">
	                        	<input type="hidden" name="uemail" id="uemail">
	                            <button type="button" id="btnSbm">수정하기</button>
	                            <button type="reset">입력취소</button>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </form>
		
		</div>
		<!-- div#wrap -->
		<script src="https://code.jquery.com/jquery-3.6.4.js"
				integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
				crossorigin="anonymous"></script>
		<script>
		$(function(){


    	    $("#upwRe").blur(function(){

				let upw = $("#upw").val().trim();
				let upwRe = $("#upwRe").val().trim();
				if (upw != upwRe) {
					$("#pwChk").text("비밀번호가 다릅니다.").css({"color": "#f80"});
				} else {
					$("#pwChk").text("");
				}
    	    	
    	    });
    	    
    	    
			$("#btnSbm").click(function(){				
				
				// 유효성검사 시작
				let upw = $("#upw").val().trim();
				let upwRe = $("#upwRe").val().trim();
				let email1 = $("#email1").val().trim();
				let email2 = $("#email2").val().trim();

				if (upw == upwRe) $("#pwChk").text("");
				
				if (upw == "") {
					alert("비밀번호를 입력하세요.");
					$("#upw").focus();
				} else if (upw != upwRe) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#pwChk").text("비밀번호가 다릅니다.").css({"color": "#f80"});
					$("#upwRe").focus();
				} else if (email1 == "") {
					alert("이메일을 입력하세요.");
					$("#email1").focus();
				} else if (email2 == "") {
					alert("이메일을 입력하세요.");
					$("#email2").focus();
				} else {
					
					let uemail = email1 + "@" + email2;
					//console.log("uemail : " + uemail);
					$("#uemail").val(uemail);
					
					
					$("#modifyForm").attr("action", "/member/modifyProc.jsp");
					$("#modifyForm").submit();
				}				
				// 유효성검사 끝
				
			
			});
			
			
			$("#lnbArea>span").click(function(){
				location.href="/index.jsp";
			});
			
		});
		</script>
	</body>
</html>