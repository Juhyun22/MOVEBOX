<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<!-- 이벤트 등록 -->
	<div>
		<div>
			<h3>이벤트 등록</h3>
		</div>
	</div>
	
	<!-- 이벤트 등록 값 받기 -->
	<div class="d-flex justify-content-center pt-4">
		<div class="col-10">
			<div class="d-flex">
				<div class="col-10">
					<!-- 이벤트 제목 -->
					<div class="form-group d-flex">
						<label for="title" class="text-center">제목</label>
						<input type="text" id="title" name="title" class="form-control col-10 ml-2" placeholder="이벤트 제목">
					</div>
					
					<!-- 이벤트 이미지 파일 -->
					<div class="form-group d-flex">
						<label for="file" class="text-center">이미지 파일 </label>
						<input type="file" id="file" name="file" placeholder="이미지 파일(필수X)">
					</div>
					
					<!-- 이벤트 내용 -->
					<div class="form-group d-flex">
						<label for="content" class="text-center">내용</label>
						<textarea id="content" name="content" class="form-control col-10 ml-2" placeholder="이벤트 내용"></textarea>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-between mt-2">
				<a href="/admin/event_manage_view" class="btn btnCss" title="이벤트 목록">목록</a>
				<button type="button" id="postBtn" class="btn btnCss">저장</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		$('#postBtn').on('click', function(e) {
			// title validation check
			let title = $('#title').val().trim();
			
			if (title == '') {
				alert("제목 입력 필수입니다.");
				return;
			}
			
			// file validation check - null
			let file = $('#file').val();
			
			if (file != '') {  // 값이 있으면, 
				let ext = file.split('.').pop().toLowerCase();
				if ($.inArray(ext, ['gif','png','jpeg','jpg']) == -1) {
					alert("gif, png, jpeg, jpg 파일만 업로드 할 수 있습니다.");
					$('#file').val('');  // 파일을 비운다 
					return;
				}
			}

			// content - null
			let content = $('#content').val().trim();

			let formData = new FormData();
			formData.append("title",title);
			formData.append("file", $('#file')[0].files[0]);
			formData.append("content", content);
			
			// AJAX - POST
			$.post({
				url: "/event/post"
				, data: formData
				, enctype: "multipart/form-data"
				, processData: false
				, contentType: false
				, success: function(data) {
					if (data.result == "success") {
						alert("저장 완료!");
						location.href="/admin/event_manage_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("이벤트 등록에 실패하였습니다.");
				}
				});
			});
		});
	});
</script>
