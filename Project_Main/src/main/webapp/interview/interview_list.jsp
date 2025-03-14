<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<!--
Template Name: Spourmo
Author: <a href="https://www.os-templates.com/">OS Templates</a>
Author URI: https://www.os-templates.com/
Copyright: OS-Templates.com
Licence: Free to use under our free template licence terms
Licence URI: https://www.os-templates.com/template-terms
-->
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
<style type="text/css">
.heading{
	margin-top: 50px;
}
#gallery .nospace.clear {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개씩 배치 */
    gap: 20px; /* 아이템 사이 간격 */
    list-style: none;
    padding: 0;
    width: 1000px;
    margin: 0px auto;
}

#gallery .item-box {
	background-color: #ffffff; /* 흰색 배경 */
	padding: 30px;
	border-radius: 5px;
	border: 1px solid #dcdcdc; /* 약한 회색 테두리 */
	width: 310px; /* 너비를 설정 */
	height: 350px;
	transition: all 0.3s ease;
	margin: 0px auto;
}

#gallery .item-box:hover {
	background-color: #f0f0f0;
	border: 1px solid #1C8C30; /* 연두색 테두리 */
}

/* 제목 */
#gallery .item-box .title_3 {
	font-size: 20px;
	margin-top: 20px;
	margin-bottom: 60px;
	line-height: 1.4;
	font-weight: bold;
	 display: -webkit-box;
    -webkit-line-clamp: 2; /* 두 줄로 제한 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis; /* 넘치는 부분에 '...' 표시 */
}

/* 서브 타이틀 */
#gallery .item-box .sub_title {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 16px;
	color: #47AB67;
	margin-bottom: 30px;
	font-weight: 900; /* 또는 font-weight: 700; */
	
	white-space: nowrap; /* 텍스트가 한 줄로만 표시되도록 설정 */
	overflow: hidden; /* 넘치는 부분을 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트를 ...으로 표시 */
}

/* 회사명 */
#gallery .item-box .company {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 18px;
	margin-top: 10px;
	white-space: nowrap; /* 텍스트가 한 줄로만 표시되도록 설정 */
	overflow: hidden; /* 넘치는 부분을 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트를 ...으로 표시 */
}

/* 부서명 */
#gallery .item-box .department {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 16px;
	color: #888;
	margin: 5px 0;
	white-space: nowrap; /* 텍스트가 한 줄로만 표시되도록 설정 */
	overflow: hidden; /* 넘치는 부분을 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트를 ...으로 표시 */
}

/* 날짜 및 조회수 */
#gallery .item-box .dayline {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 14px;
	color: #888;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* 날짜 스타일 */
#gallery .item-box .idate {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 14px;
	color: #555;
}

/* 조회수 스타일 */
#gallery .item-box .hit {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 14px;
	color: #555;
	margin-left: 10px;
	text-align: left;
}

/* 이미지 스타일 */
#gallery .item-box img {
	max-width: 150px;
	height: auto;
	border-radius: 50px;
	margin-left: 30px;
	border: 1px solid #ddd;
	margin-top: 10px;
}
#gallery .item-box .gubun {
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
	font-size: 16px;
	color: #47AB67;
	margin-bottom: 10px;
	font-weight: bold; /* 또는 font-weight: 700; */
	
	/* gubun에 선을 추가 */
	position: relative;
}
#gallery .item-box .gubun::after {
	content: "";
	position: absolute;
	bottom: 12px; /* 과 선 사이의 간격 */
	left: 0;
	width: 10%; /* 선이 전체 너비를 차지하도록 설정 */
	height: 1px; /* 선의 두께 */
	background-color: #122B1A; /* 선의 색상 */
	z-index: 1
}

.tcontainer {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 4개의 같은 크기의 컬럼 생성 */
    grid-template-rows: repeat(3, 30px); /* 행을 3개로 생성 */ 
}

.cell {
    text-align: left;
    height: 30px;
}

.cell-colspan-2 {
    grid-column: span 2;
    height: 35px;
    
	white-space: nowrap; /* 텍스트가 한 줄로만 표시되도록 설정 */
	overflow: hidden; /* 넘치는 부분을 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트를 ...으로 표시 */
}
.cell-rowspan-2 {
	text-align:right;
    grid-row: span 3;  /* 2개의 행을 차지 */
}
.item-box a.iblock {
    display: block; /* 박스 전체 클릭 가능 */
    text-decoration: none; /* 밑줄 제거 */
    color: inherit;
}
.pagination{display:block; width:100%; text-align:center; clear:both; color: #8EC837; }
.pagination a:hover{ background-color: #8EC837; color: white; border:1px solid gray; }
.pagination li{display:inline-block; margin:0 2px 0 0;}
.pagination li:last-child{margin-right:0;}
.pagination a, .pagination strong{display:block; padding:8px 11px; border:1px solid gray; background-clip:padding-box; font-weight:normal;}
</style>
<style type="text/css">
		h2 {
			font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
            font-size: 30px;
            margin-bottom: 5px;
        } 
        .category-box {
        	width : 1000px;
        	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
            border: 1px solid #ccc;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-template-columns: repeat(auto-fill, minmax(170px, 1fr));
            gap: 10px;
            margin: 50px auto;
        }  
        
        .category-box a {
        	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
            text-decoration: none;
            color: #333;
            padding: 2px 2px;
            border-radius: 5px;
            font-size:15px;
            text-align: left;
            display: block;
        }
        .category-box a:hover {
        	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
            background-color: #ddd;
        }

</style>
</head>
<body id="top">
	<!-- End Top Background Image Wrapper -->
	<div class="wrapper row3">
		<main class="hoc container clear">
			<!-- main body -->
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading"></header>
						<h2 style="margin-bottom: 50px;">현직자 인터뷰 리스트</h2>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${list }">

								<li class="col-12 col-md-6 col-lg-4">
									<div class="item-box" ><a href="../interview/interview_detail.do?ino=${vo.ino }" class="iblock">
										<p class="sub_title">${vo.sub_title}</p> 
										<p class="gubun"></p>
										<p class="title_3">
											<b>${vo.title}</b>
										</p>
										<div class="tcontainer">
											<div class="cell cell-colspan-2"><p class="company">${vo.company}</p></div>
											<div class="cell cell-rowspan-2"><img src="${vo.poster}" alt="Poster"></div>
											<div class="cell cell-colspan-2"><p class="department">${vo.department}</p></div>
											<div class="cell cell-colspan-2"><p class="name">${vo.name}</p></div>
											<div class="cell cell-colspan-2"><span class="idate">${vo.idate}</span>  |<span class="hit">${vo.hit}</span></div>
										</div></a>
									</div>
								</li>

							</c:forEach>
						</ul>
						<br>
						<div class="page-status" style="text-align: right; margin-right:100px;">
                            <p>Page ${curpage } of ${totalpage } results</p>
               			 </div>					
                </figure>
				</div>
				<br>
				<nav class="pagination">
					<ul>
						<c:if test="${startPage>1 }">
							<li><a href="../interview/interview_list.do?page=${startPage-1 }"><i class="fa fa-angle-double-left" aria-hidden="true"></i>이전</a></li>
						 </c:if>
						 
						 <c:forEach var="i" begin="${startPage }" end="${endPage }">
                            <li class="${i==curpage?'current':'' }"><a class="page-link" href="../interview/interview_list.do?page=${i }">${i }</a></li>
                          </c:forEach>
                         
						  <c:if test="${endPage<totalpage }">
                           <li class="page-item">
                               <a class="page-link" href="../interview/interview_list.do?page=${endPage+1 }">다음<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                           </li>
                          </c:if>
					</ul>
				</nav>
				<br><br>
			</div>
		</main>
	</div>
	       <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    
        <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>
</html>