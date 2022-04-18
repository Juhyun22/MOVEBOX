<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<!-- 이벤트 관리 -->
	<div>
		<div>
			<h3>이벤트 관리</h3>
		</div>
	</div>
	
	<!-- 이벤트 리스트 -->
	<div class="d-flex justify-content-center pt-4">
		<div class="col-10">
			<!-- 이벤트 리스트 -->
			<div>
				<table class="table text-center">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>					
						<th>작성자</th>					
						<th>이벤트 삭제</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${eventList}" var="eventList" varStatus="status">
					<tr>
						<th>${eventList.id}</th>
						<td>
							<button type="button" class="btn text-dark">${eventList.title}</button>
						</td>
						<td>${eventList.writter}</td>
						<td>
							<button type="button" id="deleteEventBtn" class="deleteEventBtn btn btn-danger" 
							data-event-id="${evnetList.id}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		
			<div class="d-flex justify-content-end">
				<a href="/admin/event_post_view" id="addEventBtn" class="btn btnCss">이벤트 추가</a>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
	});
</script>


