<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<!-- 극장 등록 -->
	<div>
		<div>
			<h3>극장 등록</h3>
		</div>
	</div>
	
	<!-- 극장 등록 값 받기 -->
	<div class="d-flex justify-content-center pt-4">
		<div class="col-10">
			<div class="d-flex">
				<div class="col-10">
					<!-- 극장 이름 -->
					<div class="form-group d-flex">
						<label for="name" class="text-center">극장명</label>
						<input type="text" id="name" name="name" class="form-control col-6 ml-2" placeholder="극장 이름">
					</div>
					
					<!-- 극장 주소 -->
					<div class="form-group d-flex">
						<label for="address" class="text-center">극장 주소</label>
						<input type="text" id="address" name="address" class="form-control col-6 ml-2" placeholder="극장 주소">
					</div>
					
					<!-- 극장 전화번호 -->
					<div class="form-group d-flex">
						<label for="number" class="text-center">극장 전화번호</label>
						<input type="text" id="number" name="number" class="form-control col-6 ml-2" placeholder="극장 전화번호">
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-between mt-2">
				<a href="/admin/theather_manage_view" class="btn btnCss" title="극장 목록">목록</a>
				<button type="button" id="postBtn" class="btn btnCss">저장</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		$('#postBtn').on('click', function(e) {
			// validation check
			let name = $('#name').val().trim();
			
			if (name == '') {
				alert("극장 명은 입력 필수입니다.");
				return;
			}
			
			let address = $('#address').val().trim();
			
			if (address == '') {
				alert("극장 주소는 입력 필수입니다.");
				return;
			}
			
			let number = $('#number').val().trim();
			
			if (number.length > 1) {  // 값이 있으면, 
				if (isNaN(number) == true && number.includes('-') == false) {  // 숫자가 아니고 -가 아니면
					alert("영화 전화번호는 숫자와 -만 입력 가능합니다.");
					return;
				}
			}
			
			// AJAX - POST
			$.post({
				url: "/theather/post"
				, data: {"name":name,"address":address,"number":number}
				, success: function(data) {
					if (data.result == "success") {
						alert("등록 성공!");
						location.href = "/admin/theather_manage_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("극장 등록에 실패하였습니다.");
				}
			});
		});
	});
</script>
