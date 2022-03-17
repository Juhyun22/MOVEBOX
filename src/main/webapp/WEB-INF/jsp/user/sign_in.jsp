<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- admin 아이디: admin / 비밀번호: adminadmin1 --%>
<div class="d-flex flex-column align-items-center justify-content-center h-100">

	<!-- movebox logo -->
	<div>
		<a href="/movebox" title="MOVEBOX 메인 페이지로">
			<img src="/static/images/main_logoo.png" alt="MOVEBOX logo" height="60">
		</a>
	</div>
	
	<!-- sign in part -->
	<div class="mt-4 w-50">
		<!-- 회원 정보 입력 text -->
		<div class="mt-2">
			<div class="text-center">
				<label for="loginId"><h3>로그인</h3></label>
			</div>
		</div>
		
		<!-- 정보 입력 -->
		<div class="d-flex flex-column justify-content-center">
			<!-- 아이디 -->
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="bi bi-person"></i></span>
				</div>
				<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디">
			</div>
			
			<!-- 비밀번호 -->
			<div class="input-group mt-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="bi bi-key"></i></span>
				</div>
				<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호">
			</div>
			
			<!-- 로그인 버튼 -->
			<div class="d-flex justify-content-between mt-3">
				<small>아직 비회원이세요? <a href="/user/sign_up_view">회원가입</a></small>
				<button type="button" id="signInBtn" name="signUpBtn" class="btn btnCss">로그인</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		// 로그인
		$('#signInBtn').on('click', function(e) {
			// validation check			
			let loginId = $('#loginId').val().trim();
			
			if (loginId == '') {
				alert("아이디를 입력해주세요.");
				return;
			}
			
			let password = $('#password').val().trim();
			
			if (password == '') {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			// AJAX - POST
			$.post({
				url: "/user/sign_in"
				, data: {"loginId":loginId,"password":password}
				, success: function(data) {
					if (data.result == "success") {
						location.href="/movebox";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("로그인에 실패하였습니다. 관리자에게 문의 바랍니다.");
				}
			});
		});
	});
</script>