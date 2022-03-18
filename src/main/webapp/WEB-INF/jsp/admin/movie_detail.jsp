<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<!-- 영화 수정, 삭제 -->
	<div>
		<div>
			<h3>영화 수정, 삭제</h3>
		</div>
	</div>
	
	<!-- 영화 리스트 -->
	<div class="d-flex justify-content-center pt-4">
		<div class="col-10">
			<div class="d-flex">
				
				<!-- 영화 포스터 등록 -->
				<div class="col-3">
					<div class="border mb-2">
						<img src="${movie.movieImgPath}" alt="영화 포스터" height="250" width="190">
					</div>
					<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif"> 
				</div>
				<!-- 제목, 감독, 개봉일, 정보 -->
				<div class="col-9">
					<!-- 제목 -->
					<div class="form-group d-flex">
						<label for="title" class="text-center">제목</label>
						<input type="text" id="title" name="title" class="form-control col-6 ml-2" placeholder="제목" 
						value="${movie.title}">
					</div>
					
					<!-- 감독 -->
					<div class="form-group d-flex">
						<label for="director" class="text-center">감독</label>
						<input type="text" id="director" name="director" class="form-control col-6 ml-2" placeholder="감독"
						value="${movie.director}">
					</div>
					
					<!-- 개봉일 -->
					<div class="form-group d-flex">
						<label for="openingDate" class="text-center">개봉일</label>
						<input type="text" id="openingDate" name="openingDate" class="form-control col-6 ml-2" placeholder="개봉일 ex)2022-02-22"
						value="${movie.openingDate}">
					</div>
					
					<!-- 러닝타임 -->
					<div class="form-group d-flex">
						<label for="runningTime" class="text-center">러닝타임</label>
						<input type="text" id="runningTime" name="runningTime" class="form-control col-6 ml-2" placeholder="러닝타임"
						value="${movie.runningTime}">
					</div>
					
					<!-- 정보 -->
					<div class="form-group">
						<label for="information" class="text-center">정보</label>
						<textarea id="information" name="information" class="form-control mt-2" placeholder="정보" rows="10">
						${movie.information}</textarea>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-between mt-2">
				<a href="/admin/movie_manage_view" class="btn btnCss" title="영화 목록">목록</a>
				
				<div>
					<button type="button" id="deleteBtn" class="btn btn-danger mr-3">삭제</button>
					<button type="button" id="updateBtn" class="btn btnCss" data-movie-id="${movie.id}">수정</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		// update
		$('#updateBtn').on('click', function(e) {
			// file validation check
			let file = $('#file').val();
			
			if (file == '') {
				alert("파일 등록은 필수입니다.");
				return;
			}
			
			if (file != '') {  // 값이 있으면, 
				let ext = file.split('.').pop().toLowerCase();
				if ($.inArray(ext, ['gif','png','jpeg','jpg']) == -1) {
					alert("gif, png, jpeg, jpg 파일만 업로드 할 수 있습니다.");
					$('#file').val('');  // 파일을 비운다 
					return;
				}
			}
			
			// title validation check
			let title = $('#title').val().trim();
			
			if (title == '') {
				alert("제목 입력 필수입니다.");
				return;
			}
			
			// director 
			let director = $('#director').val().trim();
			
			if (director == '') {
				alert("감독 입력 필수입니다.");
				return;
			}
			
			// openingDate
			let openingDate = $('#openingDate').val().trim();
			
			if (openingDate == '') {
				alert("개봉일 입력 필수입니다.");
				return;
			}
			
			if (openingDate.substr(4,1) != '-' || openingDate.substr(7,1) != '-') {
				alert("형태에 맞게 개봉일을 입력해주세요.");
				$('#openingDate').val('');
				return;
			}
			
			// runningTime
			let runningTime = $('#runningTime').val().trim();
			
			if (runningTime == '') {
				alert("러닝타임 입력은 필수입니다.");
				return;
			}

			if (isNaN(runningTime) == true) {
				alert("러닝타임은 숫자만 입력 가능합니다.");
				return;
			}
			
			// information - null
			let information = $('#information').val().trim();
			
			let formData = new FormData();
			let movieId = $(this).data('movie-id');
			formData.append("movieId",movieId);
			formData.append("title",title);
			formData.append("director",director);
			formData.append("openingDate",openingDate);
			formData.append("information",information);
			formData.append("runningTime", runningTime);
			formData.append("file", $('#file')[0].files[0]);
			
			// AJAX - update
			$.ajax({
				url: "/movie/update"
				, method: "PUT"
				, data: formData
				, enctype: "multipart/form-data"
				, processData: false
				, contentType: false
				, success: function(data) {
					if (data.result == "success") {
						alert("수정 완료!");
						location.href="/admin/movie_manage_view";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("영화 수정에 실패하였습니다.");
				}
			});
		});
		
		// delete
		$('#deleteBtn').on('click', function(e) {
			alert("have to do");
		});
	});
</script>
