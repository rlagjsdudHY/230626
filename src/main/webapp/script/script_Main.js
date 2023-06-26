/**
 * 
 */
 
 
 $(function(){

	// a요소 #링크 적용제한
	$("a[href='#']").click(function(){
		return false;
	});
	

	// HeaderGNB 메뉴 시작
	$("ul#mainMenu>li").mouseover(function(){
		$(this).children("ul.subMenu").stop().slideDown(600);
	});	

	$("ul#mainMenu>li").mouseout(function(){
		$(this).children("ul.subMenu").stop().slideUp(300);
	});
	// HeaderGNB 메뉴 끝
	

	// 슬라이드쇼(div#slideAre) 시작
	function fnSlide() {
		
		$("div#slideFrame").animate(
				{"margin-left": "-1200px"},
				1000,
				function(){
					$(this).children("a").eq(0).insertAfter("div#slideFrame a:last-child");
					$(this).css({"margin-left": "0"});
				}
		);
	}
	
	setInterval(fnSlide, 5000);
	// 슬라이드쇼(div#slideAre) 끝
	

	// 레이어 팝업 시작
	$("#layerPopPoint").click(function(){
		$("#layerBG").show();
		/*
		$("#layerBG>div#layerPopUp").css({"display": "block"});
		 */
	});
	$("#layerPopUpBtnArea>button").click(function(){
		$("#layerBG").hide();
	});
	
	// 레이어 팝업 끝


	// 회원 탈퇴 처리 (/index.jsp)
	 $("#withdrawChk").click(function(){
		let msg = "확인을 누르시면 회원에서 탈퇴합니다.\n확인 또는 취소를 클릭하세요.";
		let chkToF = confirm(msg);
		if (chkToF) {
			location.href="/member/withdrawProc.jsp";	
		} else {
			alert("취소하셨습니다.");
		}
	 });
	

});





