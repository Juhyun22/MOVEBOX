<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<!-- 영화 관리 -->
	<div>
		<div>
			<h3>영화 관리</h3>
		</div>
	</div>
	
	<!-- 영화 리스트 -->
	<div class="d-flex justify-content-center pt-4">
		<div class="col-10">
			<!-- 영화 리스트 -->
			<table class="table text-center">
				<thead>
					<tr>
						<th>No.</th>
						<th>포스터</th>					
						<th>제목</th>					
						<th>감독</th>					
						<th>개봉일</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${movieList}" var="movieList" varStatus="status">
					<tr>
						<th>${movieList.id}</th>
						<td>
							<img src="${movieList.movieImgPath}" alt="포스터" width="30" height="40">
						</td>
						<td>
							<a href="#">${movieList.title}</a>
						</td>
						<td>${movieList.director}</td>
						<td>${movieList.openingDate}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		
		<!-- 이전, 다음 -->
		<div class="d-flex justify-content-center">
			<a href="#" class="go-front mr-2 text-dark">&lt;&lt;이전</a>
			<a href="#" class="go-back text-dark">다음&gt;&gt;</a>
		</div>
		
		<div class="d-flex justify-content-end">
			<a href="/admin/movie_post_view" id="postMovieBtn" class="btn btnCss">영화추가</a>
		</div>
		</div>
	</div>
</div>