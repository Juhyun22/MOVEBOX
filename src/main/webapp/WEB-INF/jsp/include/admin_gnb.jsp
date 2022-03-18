<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자 화면 -->
<div class="d-flex">

	<!-- 로고 -->
	<div class="col-2 mt-4">
		<a href="/movebox" title="MOVEBOX 메인으로 가기">
			<img src="/static/images/main_logoo.png" alt="MOVEBOX LOGO" height="50px">
		</a>
	</div>
	
	<!-- 영화관리 / 극장관리(영화시간관리) / 예매관리 / 이벤트 관리 / 스토어 관리-->
	<div class="col-10">
		<div class="d-flex justify-content-end">
			<nav>
				<ul class="nav">
					<li class="nav-item"><span class="nav-link nav-text-small">${userName}님 안녕하세요.</span></li>
					<li class="nav-item"><a href="/user/sign_out" class="nav-link nav-text-small" title="로그아웃">로그아웃</a></li>
				</ul>
			</nav>
		</div>
		<div>
			<nav class="w-100">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="/admin/movie_manage_view" class="nav-link nav-text" title="영화관리">영화관리</a></li>
					<li class="nav-item"><a href="/admin/theather_manage_view" class="nav-link nav-text">극장관리</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">예매관리</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">이벤트 관리</a></li>
					<li class="nav-item"><a href="#" class="nav-link nav-text">스토어 관리</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>