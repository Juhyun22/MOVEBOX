<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<!-- 박스오피스 / 더 많은 영화 보기 -->
	<div class="d-flex mb-2">
		<div class="col-4"></div>
		<div class="col-4 d-flex justify-content-center align-items-center">
			<div>
				<h5>박스오피스</h5>
			</div>
		</div>
		<div class="col-4">
			<div class="d-flex justify-content-end">
				<label for="lookMoreMovie">더 많은 영화 보기</label>
				<a href="#" class="lookMoreMovie text-dark"><i class="bi bi-plus-lg"></i></a>
			</div>
		</div>
	</div>
	
	<!-- 네개의 영화 -->
	<div class="d-flex mb-4">
		<div class="col-3">
			<div>
				<img src="/static/images/box_logo.png" alt="영화 사진1" height="352px" width="245px">
				<span class="d-none">영화설명</span>
				<div class="mt-3">
					<button type="button" class="movieLike btn btn-outline-dark">
						<i class="bi bi-heart"></i> 22
						<i class="d-none bi bi-heart-fill"></i>
					</button>
					<button type="button" class="btn btn-info col-8">예매</button>
				</div>
			</div>
		</div>
		<div class="col-3">
			<img src="/static/images/box_logo.png" alt="영화 사진1" height="352px" width="245px">
				<span class="d-none">영화설명</span>
				<div class="mt-3">
					<button type="button" class="movieLike btn btn-outline-dark">
						<i class="bi bi-heart"></i> 22
						<i class="d-none bi bi-heart-fill"></i>
					</button>
					<button type="button" class="btn btn-info col-8">예매</button>
				</div>
		</div>
		<div class="col-3">
			<img src="/static/images/box_logo.png" alt="영화 사진1" height="352px" width="245px">
				<span class="d-none">영화설명</span>
				<div class="mt-3">
					<button type="button" class="movieLike btn btn-outline-dark">
						<i class="bi bi-heart"></i> 22
						<i class="d-none bi bi-heart-fill"></i>
					</button>
					<button type="button" class="btn btn-info col-8">예매</button>
				</div>
		</div>
		<div class="col-3">
			<img src="/static/images/box_logo.png" alt="영화 사진1" height="352px" width="245px">
				<span class="d-none">영화설명</span>
				<div class="mt-3">
					<button type="button" class="movieLike btn btn-outline-dark">
						<i class="bi bi-heart"></i> 22
						<i class="d-none bi bi-heart-fill"></i>
					</button>
					<button type="button" class="btn btn-info col-8">예매</button>
				</div>
		</div>
	</div>
	
	<!-- 영화명 검색, 상영시간표, 박스오피스, 빠른예매 -->
	<div class="d-flex my-5">
		<div class="col-3 d-flex">
			<div class="line d-flex">
				<input type="text" id="searchMovie" class="form-control col-8" placeholder="영화명을 입력해주세요.">
				<button type="button" class="searchMovieBtn btn m-0"><i class="bi bi-search" style="font-size: 25px;"></i></button>
			</div>
		</div>
		<div class="col-3">
			<div class="line d-flex justify-content-center align-items-center">
				<label for="timetable"><i class="bi bi-calendar-week" style="font-size: 30px"></i> </label>
				<a href="#" title="상영시간표" class="timetable text-dark">상영 시간표</a>
			</div>
		</div>
		<div class="col-3">
			<div class="line d-flex justify-content-center align-items-center">
				<label for="boxoffice"><i class="bi bi-film" style="font-size: 30px"></i> </label>
				<a href="#" title="박스오피스" class="boxoffice text-dark">박스오피스</a>
			</div>
		</div>
		<div class="col-3">
			<div class="d-flex justify-content-center align-items-center">
				<label for="reserve"><i class="bi bi-ticket-perforated" style="font-size: 35px"></i> </label>
				<a href="#" title="빠른예매" class="reserve text-dark">빠른예매</a>
			</div>
		</div>
	</div>
</div>