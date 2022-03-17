<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 일반 사용자 화면 -->
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
		<a href="/movebox" title="MOVEBOX 메인으로 가기">
			<img src="/static/images/main_logoo.png" alt="MOVEBOX LOGO" height="50px">
		</a>
	</div>
	
	<!-- 로그인 / 회원가입 / 빠른 예매  -->
	<!-- 이벤트 / 스토어 / 혜택 / 사용자 -->
	<div class="col-5">
		<div class="d-flex justify-content-end">
			<nav>
				<ul class="nav">
					<c:if test="${empty userName}">
						<li class="nav-item"><a href="/user/sign_in_view" class="nav-link nav-text-small" title="로그인">로그인</a></li>
						<li class="nav-item"><a href="/user/sign_up_view" class="nav-link nav-text-small" title="회원가입">회원가입</a></li>
						<li class="nav-item"><a href="#" class="nav-link nav-text-small">빠른 예매</a></li>
					</c:if>
					<c:if test="${not empty userName}">
						<li class="nav-item"><span class="nav-link nav-text-small">${userName}님 안녕하세요.</span></li>
						<li class="nav-item"><a href="/user/sign_out" class="nav-link nav-text-small" title="로그아웃">로그아웃</a></li>
					</c:if>
					<c:if test="${userId == 1}">
						<li class="nav-item"><a href="/admin/movie_manage_view" class="nav-link nav-text-small"><i class="bi bi-gear-fill"></i>admin</a></li>
					</c:if>
					<c:if test="${not empty UserName && userId != 1}">
						<li class="nav-item"><a href="#" class="nav-link nav-text-small">빠른 예매</a></li>
					</c:if>
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
