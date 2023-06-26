<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginSession = (String)session.getAttribute("loginSession");
out.print("loginSession : " + loginSession);
%>

    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style_Common.css">
	</head>
	<body>
		<div id="wrap">
		
			<div id="accountLnbArea">
				<ul id="accLnbMainMenu" class="dFlex">
<% if (loginSession == null) { %>
					<li class="accMainLi"><a href="/member/login.html">로그인</a></li>
					<li class="accMainLi"><a href="/member/join.html">회원가입</a></li>
<% } else { %>
					<li class="accMainLi"><a href="#"><%=loginSession %> 님 접속중</a></li>
					<li class="accMainLi"><a href="/member/logoutProc.jsp">로그아웃</a></li>
					<li class="accMainLi"><a href="/member/modify.jsp">정보수정</a></li>
					<li class="accMainLi"><a href="#" id="withdrawChk">탈퇴하기</a></li>
<% } %>					
				</ul>
			</div>
			
			<header id="header" class="mainColorBG dFlex">
				<div id="headerLogoArea">
					<div id="headerLogo">
						<a href="#">
							<img src="/images/logo_header.png" alt="헤더로고이미지"
							width="200">
						</a>
					</div>
				</div>
				<!-- div#headerLogoArea -->
				
				<div id="headerGNBArea">
				
					<!-- nav#headerGnb>ul#mainMenu>li.mainLi*4>a[href=#]+ul.subMenu>li.subLi*4>a[href=#] -->
					<nav id="headerGnb">
						<ul id="mainMenu" class="dFlex">
							<li class="mainLi">
								<a href="#">소장처별</a>
								<ul class="subMenu">
									<li class="subLi"><a href="#">한국</a></li>
									<li class="subLi"><a href="#">프랑스</a></li>
									<li class="subLi"><a href="#">이탈리아</a></li>
									<li class="subLi"><a href="#">독일</a></li>
								</ul>
							</li>
							<li class="mainLi">
								<a href="#">장르별</a>
								<ul class="subMenu">
									<li class="subLi"><a href="#">회화</a></li>
									<li class="subLi"><a href="#">판화</a></li>
									<li class="subLi"><a href="#">공예/고대유물</a></li>
									<li class="subLi"><a href="#">그 외</a></li>
								</ul>
							</li>
							<li class="mainLi">
								<a href="#">테마별</a>
								<ul class="subMenu">
									<li class="subLi"><a href="#">초상화/인물</a></li>
									<li class="subLi"><a href="#">종교</a></li>
									<li class="subLi"><a href="#">신화/문학</a></li>
									<li class="subLi"><a href="#">일상/스포츠</a></li>
								</ul>
							</li>
							<li class="mainLi">
								<a href="#">시대별</a>
								<ul class="subMenu">
									<li class="subLi"><a href="#">1900년 이전</a></li>
									<li class="subLi"><a href="#">1900년대</a></li>
									<li class="subLi"><a href="#">현대</a></li>
									<li class="subLi"><a href="#">그 외</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				
				</div>
				<!-- div#headerGNBArea -->
			</header>
			<!-- header#header -->
			
			<main id="main">
			
				<div id="slideArea">
					<div id="slideFrame" class="dFlex">
					
						<a href="#">
							<img src="/images/slideShow_01.jpg" alt="슬라이드쇼이미지">
							<span>세계의 거장과 함께한 전시회</span>
						</a>
					
						<a href="#">
							<img src="/images/slideShow_02.jpg" alt="슬라이드쇼이미지">
							<span>야외 조형물 전시장도 오픈합니다.</span>
						</a>
					
						<a href="#">
							<img src="/images/slideShow_03.jpg" alt="슬라이드쇼이미지">
							<span>명화와 함께 떠나는 휴가</span>
						</a>
						
					</div>		
				
				</div>
				<!-- div#slideArea -->
				
				<div id="contents" class="dFlex">
				
					<!-- BBS 공지사항 -->
					<section id="notice">
						<div class="tabBtnArea"><button>공지사항</button></div>
						<div class="tabBtnContents">
							<table id="noticeTBL">
								<tbody>
									<tr>
										<td id="layerPopPoint">2019 시민큐레이터 프로젝트</td>
										<td>2019/05/07</td>
									</tr>
									<tr>
										<td>SeMA신소장품 멀티-엑세스 4</td>
										<td>2019/05/03</td>
									</tr>
									<tr>
										<td>월 북서울미술관 문화행사 일정</td>
										<td>2019/02/22</td>
									</tr>
								</tbody>
							</table>
							<!-- table#noticeTBL -->
						</div>
					</section>
					
					<!-- BBS 갤러리 -->
					<section id="gallery">
						<div class="tabBtnArea"><button>갤러리</button></div>
						<div class="tabBtnContents">
							<table id="galleryTBL">
								<tbody>
									<tr>
										<td>
											<a href="#">
												<img src="/images/gallery_01.jpg" alt="갤러리이미지">
											</a>
										</td>
										<td>
											<a href="#">
												<img src="/images/gallery_02.jpg" alt="갤러리이미지">
											</a>
										</td>
										<td>
											<a href="#">
												<img src="/images/gallery_03.jpg" alt="갤러리이미지">
											</a>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- table#galleryTBL -->
						</div>
					</section>
					
					<!-- 홍보(=Promotion, 프로모션) -->
					<section id="promotion">
						<a href="#">
							<img src="/images/banner.png" alt="광고홍보이미지">
						</a>
					</section>
				
				</div>
				<!-- div#contents -->
			</main>
			<!-- main#main -->
			
			<footer id="footer" class="mainColorBG dFlex">
				<div id="footerLogoArea">
					<div id="footerLogo">
						<a href="#">
							<img src="/images/logo_Footer.png" alt="푸터로고이미지"
							width="200">
						</a>
					</div>
				</div>
				<!-- div#headerLogoArea -->
				
				<div id="companyInfoArea">
					<div id="companyInfo">
						<address>
							04515  서울특별시 중구 덕수궁길 61   (서소문동)  (02) 2124-8800
						</address>
						<span style="display: block;">
							©2019 Milwaukee Art Museum   700 N. Art Museum Drive  	Milwaukee, WI 53202
						</span>
					</div>
				</div>
				<!-- div#companyInfoArea -->
				
				<div id="snsIconArea" class="dFlex">
					<a href="#"><img width="34" src="/images/ico_fb.png" alt="sns아이콘"></a>
					<a href="#"><img width="34" src="/images/ico_in.png" alt="sns아이콘"></a>
					<a href="#"><img width="34" src="/images/ico_blog.png" alt="sns아이콘"></a>
				</div>
				<!-- div#snsIconArea -->
				
				
			</footer>
			<!-- footer#footer -->
			
		</div>
		<!-- div#wrap -->
		
		
		<!-- 레이어 팝업 시작 -->
		<div id="layerBG">
			<div id="layerPopUp">
				<h1>["여름의 문턱", 5월 29일 &lt;콘서트+뮤지엄나이트&gt; 개최]</h1>
				<ul id="layerPopUpList">
					<li>
					서울시립미술관은 5월 29일 수요일 19:00∽20:00<br> 
					서소문 본관에서 옥상 세마휴에서 &lt;콘서트+뮤지엄나이트&gt; 개최합니다.<br>
					</li>
					<li>
					'여름의 문턱'이라는 주제로 진행되는 이번 콘서트는<br> 
					뮤지션 오지은의 공연으로 이루어지며, &lt;그렇게 정해진 길 위에서&gt;,<br> 
					&lt;NONE&gt; 등 10여 곡을 선보일 예정입니다.
					</li>
					<li>
					오지은은 2018 SeMA 신소장품&lt;멀티-액세스 4913&gt;전과 연계한<br> 
					뮤지엄나이트 프로그램의 뮤직 디렉터를 맡아 전시 작품과 어울리는<br>
					8개의 곡을 선곡한 바 있습니다.
					</li>
				</ul>
				<div id="layerPopUpBtnArea">
					<button type="button">닫기</button>
				</div>
			</div>
		</div>
		<!-- 레이어 팝업 끝 -->
		
		
		<script src="/script/jquery-3.6.4.min.js"></script>
		<script src="/script/script_Main.js"></script>
	</body>
</html>