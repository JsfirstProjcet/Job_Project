<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>JobEntry - Job Portal Website Template</title>
<style type="text/css">

.pagination{display:block; width:100%; text-align:center; clear:both; color: #8EC837; }
.pagination .page-link:hover{ background-color: #8EC837; color: white; border:1px solid gray; }
.pagination li{display:inline-block; margin:0 2px 0 0;}
.pagination li:last-child{margin-right:0;}
.pagination .page-link, .pagination strong{display:block; padding:8px 11px; border:1px solid gray; background-clip:padding-box; font-weight:normal;}
.mb-3 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container-xxl bg-white p-0">
		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
			
				<h1 class="text-center mb-5">Our Clients Say!!!</h1>
				<div class="owl-carousel testimonial-carousel">
					<div class="testimonial-item bg-light rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
							dolor stet amet eirmod eos labore diam</p>
						<div class="d-flex align-items-center">
							<img class="../img-fluid flex-shrink-0 rounded"
								src="../img/testimonial-1.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Client Name</h5>
								<small>Profession</small>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-light rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
							dolor stet amet eirmod eos labore diam</p>
						<div class="d-flex align-items-center">
							<img class="../img-fluid flex-shrink-0 rounded"
								src="../img/testimonial-2.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Client Name</h5>
								<small>Profession</small>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-light rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
							dolor stet amet eirmod eos labore diam</p>
						<div class="d-flex align-items-center">
							<img class="../img-fluid flex-shrink-0 rounded"
								src="../img/testimonial-3.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Client Name</h5>
								<small>Profession</small>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-light rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
							dolor stet amet eirmod eos labore diam</p>
						<div class="d-flex align-items-center">
							<img class="../img-fluid flex-shrink-0 rounded"
								src="../img/testimonial-4.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Client Name</h5>
								<small>Profession</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Testimonial End -->

		<!-- Jobs Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Job
					Listing</h1>
				<div class="tab-class text-center wow fadeInUp"
					data-wow-delay="0.3s">
					<ul
						class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-3" >

						<li class="nav-item"><a
							class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active"
							data-bs-toggle="pill" href="#tab-1">
								<h6 class="mt-n1 mb-0">Featured</h6>
						</a></li>
						<li class="nav-item"><a
							class="d-flex align-items-center text-start mx-3 pb-3"
							data-bs-toggle="pill" href="#tab-2">
								<h6 class="mt-n1 mb-0">Full Time</h6>
						</a></li>
						<li class="nav-item"><a
							class="d-flex align-items-center text-start mx-3 me-0 pb-3"
							data-bs-toggle="pill" href="#tab-3">
								<h6 class="mt-n1 mb-0">Part Time</h6>
						</a></li>
						
					</ul>
					<div class="text-end" style="margin-right: 200px; margin-bottom: 30px;">
					 <c:if test="${sessionScope.id!=null }">
					 <a class="btn btn-primary py-3 px-5" href="../interview/commune_insert.do">새글 작성</a>
					 </c:if>
					 <c:if test="${sessionScope.id==null }">
					 <a href="javascript:void(0);" onclick="alert('로그인이 필요합니다!');" class="btn btn-primary py-3 px-5">새글 작성</a>
					 </c:if>
					  
					</div>
					<div class="tab-content">
						<div id="tab-1" class="tab-pane fade show p-0 active">
							<c:forEach var="vo" items="${list }">
							  
								<div class="job-item p-4 mb-4"	style="max-width: 900px; margin: 0 auto;">
									<div>
										<div class="d-flex align-items-center">
											<div class="text-start ps-4" style="flex-grow: 1;">
											  <a href="../interview/commune_detail.do?bno=${vo.bno }">
												<h5 class="mb-3">${vo.subject }</h5>
												<p class="mb-3" style="color:gray;">${vo.content }</p>
											  </a>
												<div
													class="d-flex align-items-center justify-content-between mt-2">
													<div class="d-flex">
														<span class="text-truncate me-3"> <i class="fa fa-map-marker-alt text-primary me-2"></i>
														${vo.bno}
														</span> 
														<span class="text-truncate me-3"> <i class="far fa-clock text-primary me-2"></i>
														${vo.nickname}
														</span> 
														<span class="text-truncate me-0"> <i class="far fa-calendar-alt text-primary me-2"></i>
														${vo.dbday}
														</span>
													</div>

													<div class="d-flex">
														<span class="text-truncate me-3"> 
														<i class="far fa-heart text-primary me-1"></i>좋아요${vo.likes }
														</span> <span class="text-truncate me-3"> 
														<i class="far fa-comment text-primary me-1"></i>댓글${vo.reply }
														</span> <span class="text-truncate me-3"> 
														<i class="far fa-eye text-primary me-1"></i>조회수${vo.hit }
														</span>
													</div>
												</div>
											 
											</div>
										</div>
									</div>
								</div>
								
							</c:forEach>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- Jobs End -->
				<nav class="pagination">
					<ul>
						<c:if test="${startPage>1 }">
							<li><a class="page-link" href="../interview/commune.do?page=${startPage-1 }"><i class="fa fa-angle-double-left" aria-hidden="true"></i>이전</a></li>
						 </c:if>
						 
						 <c:forEach var="i" begin="${startPage }" end="${endPage }">
                            <li class="${i==curpage?'current':'' }"><a class="page-link" href="../interview/commune.do?page=${i }">${i }</a></li>
                          </c:forEach>
                         
						  <c:if test="${endPage<totalpage }">
                           <li class="page-item">
                               <a class="page-link" href="../interview/commune.do?page=${endPage+1 }">다음<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                           </li>
                          </c:if>
					</ul>
				</nav>
	</div>
</body>

</html>