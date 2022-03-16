<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="d-flex">
	<!-- 영화 / 예매 / 극장 -->
	<div class="col-5">
		<div class="d-flex align-items-end justify-content-end h-100">
			<nav class="w-100">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link nav-text">영화</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">예매</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">극장</a></li>
				</ul>
			</nav>	
		</div>
	</div>
	
	<!-- 로고 -->
	<div class="col-2 mt-4">
		<a href="/movebox" title="MOVEBOX 메인으로 가기.">
			<img src="/static/images/main_logoo.png" alt="MOVEBOX LOGO" height="50px">
		</a>
	</div>
	
	<!-- 로그인 / 회원가입 / 빠른 예매  -->
	<!-- 이벤트 / 스토어 / 혜택 / 사용자 -->
	<div class="col-5">
		<div class="d-flex justify-content-end">
			<nav>
				<ul class="nav">
					<li class="nav-item"><a href="#" class="nav-link nav-text-small">로그인</a></li>
					<li class="nav-item"><a href="/user/sign_up_view" class="nav-link nav-text-small" title="회원가">회원가입</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text-small">빠른 예매</a></li>
				</ul>
			</nav>
		</div>
		<div>
			<nav class="w-100">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link nav-text">이벤트</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">스토어</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">혜택</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>