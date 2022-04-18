<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<!-- 극장 관리 -->
	<div>
		<div>
			<h3>극장 관리</h3>
		</div>
	</div>
	
	<!-- 극장 리스트 -->
	<div class="d-flex justify-content-center pt-4">
		<div class="col-10">
			<!-- 극장 리스트 -->
			<div>
				<table class="table text-center">
				<thead>
					<tr>
						<th>No.</th>
						<th>극장명</th>					
						<th>극장 위치</th>					
						<th>극장 삭제</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${theatherList}" var="theatherList" varStatus="status">
					<tr>
						<th>${theatherList.id}</th>
						<td>
							<button type="button" class="btn text-dark">${theatherList.name}</button>
						</td>
						<td>${theatherList.address}</td>
						<td>
							<button type="button" id="deleteTheatherBtn" class="deleteTheatherBtn btn btn-danger" 
							data-theather-id="${theatherList.id}">삭제</button>
						</td>
					</tr>
					<tr class="d-none">
						<td colspan="4">
							<div>영화와 영화 상영 시간</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		
		<div class="d-flex justify-content-end">
			<a href="/admin/theather_post_view" id="addTheatherBtn" class="btn btnCss">극장 추가</a>
		</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 극장 삭제 
		$('.deleteTheatherBtn').on('click', function(e) {
			let theatherId = $(this).data('theather-id');
			// alert(theatherId);
			
			$.ajax({
				url: "/theather/delete"
				, method: "DELETE"
				, data: {"theatherId":theatherId}
				, success: function(data) {
					if (data.result == "success") {
						alert("삭제 성공");
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("극장 삭제에 실패하였습니다.");
				}
			});
		});
	});
</script>


