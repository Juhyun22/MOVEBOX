<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="d-flex flex-column align-items-center justify-content-center h-100">

	<!-- movebox logo -->
	<div>
		<a href="/movebox" title="MOVEBOX 메인 페이지로">
			<img src="/static/images/main_logoo.png" alt="MOVEBOX logo" height="60">
		</a>
	</div>
	
	<!-- sign up part -->
	<div class="mt-4 w-75">
		<!-- 회원 정보 입력 text -->
		<div class="my-2">
			<div class="text-center">
				<h3>회원 정보 입력</h3>
			</div>
		</div>
		
		<!-- 정보 입력 -->
		<div class="d-flex flex-column justify-content-start">
			<!-- 아이디 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="loginId">ID</label>
					<div class="d-flex ml-2 w-100">
						<input type="text" id="loginId" name="loginId" class="form-control col-5" placeholder="ID를 입력해주세요.">
						<button type="button" id="isDuplicatedBtn" name="isDuplicatedBtn" class="btn btnCss ml-2">중복확인</button>
					</div>
				</div>
				
				<div>
					<small id="checkIdLength" class="text-danger d-none">ID를 4자 이상 입력해주세요.</small>
					<small id="checkDuplicated" class="text-danger d-none">중복된 ID입니다.</small>
					<small id="checkIdOk" class="textCss d-none">사용가능한 ID입니다.</small>
				</div>
			</div>
			
			<!-- 비밀번호 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="password">비밀번호</label>
					<input type="password" id="password" name="password" class="form-control col-6 ml-2" placeholder="비밀번호를 입력해주세요.">
				</div>
				
				<div>
					<small id="checkPwdLength" class="text-danger">최소 8자 하나 이상의 문자</small>
				</div>
			</div>
			
			<!-- 비밀번호 확인 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="checkPwd">비밀번호 확인</label>
					<input type="password" id="checkPwd" name="checkPwd" class="form-control col-6 ml-2" placeholder="비밀번호를 다시 입력해주세요.">
				</div>
			</div>
			
			<!-- 이름 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="name">이름</label>
					<input type="text" id="name" name="name" class="form-control col-5 ml-2" placeholder="이름을 입력해주세요.">
				</div>
			</div>
			
			<!-- 생일 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="birth">생년월일</label>
					<input type="text" id="birth" name="birth" class="form-control col-5 ml-2" placeholder="예)2022-02-22">
				</div>
			</div>
			
			<!-- 이메일 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="email">이메일</label>
					<input type="text" id="email" name="email" class="form-control col-6 ml-2" placeholder="이메일을 입력해주세요.">
				</div>
			</div>
			
			<!-- 프로필 이미지 -->
			<div class="form-group mt-2">
				<div class="d-flex">
					<label for="file">
						프로필 이미지
						<i class="bi bi-file-earmark-arrow-down"></i>
						<span id="fileName"></span>
					</label>
					
					<input type="file" id="file" name="file" accept=".png,.jpeg,.gif,.jpg" class="ml-2 d-none">
				</div>
			</div>
			
			<!-- 회원가입 버튼 -->
			<div class="d-flex justify-content-end">
				<button type="button" id="signUpBtn" name="signUpBtn" class="btn btnCss">회원가입</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// ID 중복확인 
		$('#isDuplicatedBtn').on('click', function(e) {
			let loginId = $('#loginId').val().trim();
			
			// 상황 문구 안보이게 모두 초기화 
			$('#checkIdLength').addClass('d-none');
			$('#checkDuplicated').addClass('d-none');
			$('#checkIdOk').addClass('d-none');
			
			if (loginId < 4) {
				$('#checkIdLength').removeClass('d-none');
				return;
			}
			
			// AJAX - 중복확인 
			$.ajax({
				url: "/user/is_duplicated_id"
				, data: {"loginId":loginId}
				, success: function(data) {
					if (data.result == true) {  // 중복 
						$('#checkDuplicated').removeClass('d-none');
					} else if (data.result == false) {  // 중복이 아님. 사용 가능함. 
						$('#checkIdOk').removeClass('d-none');
					} else {
						alert("아이디 중복 확인을 할 수 없습니다. 관리자에게 문의해주세요.");
					}
				}
				, error: function(e) {
					alert("아이디 중복 확인에 실패하였습니다. 관리자에게 문의해주세요.");
				}
			});
		});
		
		///////////////////////////////////////////////////////////////////////////////
		// 파일 업로드 
		// 사용자가 파일 업로드 했을 때, 유효성 확인 및 업로드 된 파일 이름 노출 
		$('#file').on('change', function(e) {
			let fileName = e.target.files[0].name;
			let extension = fileName.split('.');
			
			// 확장자 유효성 확인
			if (extension.length < 2 || 
					(extension[extension.length - 1]) != 'gif' &&
						(extension[extension.length - 1]) != 'jpeg' &&
							(extension[extension.length - 1]) != 'png' &&
								(extension[extension.length - 1]) != 'jpg' ) {
				alert("gif, jpeg, png, jpg파일만 업로드 할 수 있습니다.");
				$(this).val();  // 비워주어야 한다. 
				$('#fileName').text('');
				return;
			}
			
			if (fileName.length > 30) {
				fileName = " ~" + fileName.slice(-30);
			}
								
			$('#fileName').text(fileName);
		});
		
		///////////////////////////////////////////////////////////////////////////
		// 회원가입 
		$('#signUpBtn').on('click', function(e) {
			// ID validation check
			let loginId = $('#loginId').val().trim();
			if (loginId == '') {
				alert("아이디를 입력해주세요.");
				return;
			}
			
			if ($('#checkIdOk').hasClass('d-none')) {
				alert("아이디 중복 확인을 해주세요.");
				return;
			}
			
			// password validation check
			let password = $('#password').val().trim();
			let checkPwd = $('#checkPwd').val().trim();
			let reg = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
			
			if (password == '' || checkPwd == '') {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			if (reg.test(password) == false) {
				alert("비밀번호를 다시 설정해주세요.");
				return;
			}
			
			if (password != checkPwd) {
				alert("비밀번호가 일치하지 않습니다.");
				// 텍스트 값 초기화 
				$('#password').val('');
				$('#checkPwd').val('');
				return;
			}
				
			// 이름 validation check
			let name = $('#name').val().trim();
			
			if (name == '') {
				alert("이름을 입력해주세요.");
				return;
			}
			
			// 생일 validation check
			let birth = $('#birth').val().trim();
			
			if (birth == '') {
				alert("생년월일을 입력해주세요.");
				return;
			}
			
			if ((birth.substr(4,1) != '-') ||(birth.substr(7,1) != '-')) {
				alert("형태에 맞게 생년월일을 입력해주세요.");
				$('#birth').val('');
				return;
			}
			
			// 이메일 validation check
			let email = $('#email').val().trim();
			
			if (email == '') {
				alert("이메일을 입력해주세요.");
				return;
			}
			
			if (email.indexOf('@') == -1) {
				alert("이메일 형식에 맞게 입력해주세요. 예) '@' 포함");
				return;
			}
			
			// 파일 - Not must
			let file = $('#file').val(); // 파일의 경로만 들고오기!
			
			let formData = new FormData();
			formData.append("loginId", loginId);
			formData.append("password", password);
			formData.append("name", name);
			formData.append("birth", birth);
			formData.append("email", email);
			formData.append("file", $('#file')[0].files[0]);
			
			// AJAX - POST
			$.post({
				url: "/user/sign_up"
				, data: formData
				, enctype: "multipart/form-data"
				, processData: false
				, contentType: false
				, success: function(data) {
					if (data.result == "success") {
						alert("회원가입 완료! 로그인해주세요!");
						location.href = "/movebox";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("회원가입에 실패하셨습니다. 관리자에게 문의하여주시기바랍니다.");
				}
			});
		});
	});
</script>



