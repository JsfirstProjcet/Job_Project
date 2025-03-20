<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JobEntry - Job Portal Website Template</title>


<style type="text/css">
.iquestion {
	font-weight: bold;
	color: #009C67;
	margin-bottom: 10px;
}

.interview_answer {
	font-size: 16px;
	color: #6a6a6a;
	line-height: 1.6;
	margin-bottom: 50px;
}

.interview_question {
	margin-bottom: 10px;
}

.botbox {
	margin: 70px;
}

.topbox {
	margin-right: 50px;
}

.icard {
	border-radius: 20px; /* 테두리 둥글게 */
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	margin: 0 auto 40px; /* 카드끼리 간격 */
	width: 1100px;
	margin-top: 80px;
}

.col-lg-7 {
	margin: 0px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${(year >= 19) || (year >= 18 && month >= 8)}">
			<div class="container-xxl bg-white p-0">


				<!-- About Start -->
				<div class="container-xxl py-5">
					<div class="container">
						<div class="icard">
							<div class="row g-5 align-items-center">
								<div class="col-lg-7 wow fadeIn" data-wow-delay="0.1s">
									<div class="row g-0 about-bg rounded overflow-hidden">
										<div class="col-6 text-start">
											<img class="../img-fluid w-1000" src="${vo.main_poster }"
												style="width: 688px; height: 455px;">
										</div>
									</div>
								</div>
								<div class="col-lg-5 wow fadeIn" data-wow-delay="0.5s">
									<h4 style="margin-bottom: 15px;">
										<i></i>${vo.company }</h4>
									<h2 class="mb-4">${vo.title }</h2>
									<br>
									<p>
										<i class="fa fa-check text-primary me-3"></i>${vo.department }</p>
									<p>
										<i class="fa fa-check text-primary me-3"></i>${vo.name }</p>
									<p>
										<i class="fa fa-check text-primary me-3"></i>${vo.idate} |
										${vo.hit}
									</p>
									<a class="btn btn-primary py-3 px-5 mt-3" href="">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- question -->

				<div class="container-xxl py-5">
					<div class="container">
						<div class="row g-5 align-items-center" style="width:1300px;">
							<div class="col-lg-5 wow fadeIn" data-wow-delay="0.1s">
								<div class="col-6 text-start">
									<img class="../img-fluid w-1000" src="${vo.sub_poster }"
										style="width: 430px; height: 500px; margin-left: 70px;">
								</div>
							</div>
							<div class="col-lg-7 wow fadeIn" data-wow-delay="0.5s"
								style="text-align: left;">
								<div class="topbox">
									<h4 class="iquestion">Q1</h4>
									<h5 class="interview_question">${ques1[0] }</h5>
									<p class="interview_answer">${ans[0] }</p>
									<h4 class="iquestion">Q2</h4>
									<h5 class="interview_question">${ques1[1] }</h5>
									<p class="interview_answer">${ans[1] }</p>
								</div>
							</div>
						</div>
						<div class="wow fadeIn" data-wow-delay="0.5s">
							<div class="botbox">
								<h4 class="iquestion">Q3</h4>
								<h5 class="interview_question">${ques1[2] }</h5>
								<p class="interview_answer">${ans[2] }</p>
								<h4 class="iquestion">Q4</h4>
								<h5 class="interview_question">${ques1[3] }</h5>
								<p class="interview_answer">${ans[3] }</p>
								<h4 class="iquestion">Q5</h4>
								<h5 class="interview_question">${ques1[4] }</h5>
								<p class="interview_answer">${ans[4] }</p>
							</div>
						</div>
					</div>
				</div>
				<!-- About End -->


				<!-- Back to Top -->
				<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top">
				<i class="bi bi-arrow-up"></i></a>
			</div>
		</c:when>
		<c:otherwise>
	<!-- pastimg 출력 이전양식임 -->

<div class="container-xxl bg-white p-0">


				<!-- About Start -->
				<div class="container-xxl py-5">
					<div class="container">
							<div class="row g-5 align-items-center">
								<div class="col-lg-7 mx-auto wow fadeIn" data-wow-delay="0.1s" >
									<h3 class="detail_top"  style="margin-top:70px;">[ ${vo.company} ]&nbsp;${vo.name }</h3>
										<hr style="border:0; height:1px; background-color:#000;">
									<c:forEach var="img" items="${pastimg }">
										<img class="../img-fluid w-100" src="${img }" style="margin-top: 20px; border: 1px solid gray">
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>

		</c:otherwise>
	</c:choose>
</body>
</html>