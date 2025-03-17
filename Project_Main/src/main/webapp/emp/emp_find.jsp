<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 검색</title>
</head>
<body id="top">
      <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
         <div class="container">
             <div class="row g-2">
                 <div class="col-md-10">
                     <div class="row g-2">
                         <div class="col-md-4">
                             <input type="text" class="form-control border-0" placeholder="Keyword" />
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0">
                                 <option selected>Category</option>
                                 <option value="1">Category 1</option>
                                 <option value="2">Category 2</option>
                                 <option value="3">Category 3</option>
                             </select>
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0">
                                 <option selected>근무지역</option>
                                 <option value="1">서울</option>
                                 <option value="2">경기</option>
                                 <option value="3">광주</option>
                                 <option value="4">대구</option>
                                 <option value="5">대전</option>
                                 <option value="6">부산</option>
                                 <option value="7">울산</option>
                                 <option value="8">인천</option>
                                 <option value="9">강원</option>
                             </select>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-2">
                     <button class="btn btn-dark border-0 w-100">Search</button>
                 </div>
             </div>
         </div>
     </div>
 
    <div class="container-xxl py-5">
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Explore By 	Job</h1>
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-4" href="">
                    <i class="fa-solid fa-chart-column">‌</i>
                        <i class="fa fa-3x fa-chart-pie text-primary mb-4" ></i>
                        <h6 class="mb-3">기획·전략</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
                        <h6 class="mb-3">마케팅·홍보·조사</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-file-invoice-dollar text-primary mb-4"></i>
                        <h6 class="mb-3">회계·세무·재무</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                    <i class="fa-solid fa-arrows-down-to-people">‌</i>
                        <i class="fa fa-3x fa-user-plus text-primary mb-4"></i>
                        <h6 class="mb-3">인사·노무·HRD</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                        <h6 class="mb-3">총무·법무·사무</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                        <h6 class="mb-3">IT개발·데이터</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-edit text-primary mb-4"></i>
                        <h6 class="mb-3">디자인</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-hands-helping text-primary mb-4"></i>
                        <h6 class="mb-3">영업·판매·무역</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-headset text-primary mb-4"></i>
                        <h6 class="mb-3">고객상담·TM</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-shopping-cart text-primary mb-4"></i>
                        <h6 class="mb-3">구매·자재·물류</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-lightbulb text-primary mb-4"></i>
                        <h6 class="mb-3">상품기획·MD</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-truck text-primary mb-4"></i>
                        <h6 class="mb-3">운전·운송·배송</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-comments text-primary mb-4"></i>
                        <h6 class="mb-3">서비스</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-industry text-primary mb-4"></i>
                        <h6 class="mb-3">생산</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-wrench text-primary mb-4"></i>
                        <h6 class="mb-3">건설·건축</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-medkit text-primary mb-4"></i>
                        <h6 class="mb-3">의료	</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-flask text-primary mb-4"></i>
                        <h6 class="mb-3">연구·R&D</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-book-reader text-primary mb-4"></i>
                        <h6 class="mb-3">교육</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-trophy text-primary mb-4"></i>
                        <h6 class="mb-3">미디어·문화·스포츠</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-university text-primary mb-4"></i>
                        <h6 class="mb-3">금융·보험</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-wheelchair text-primary mb-4"></i>
                        <h6 class="mb-3">공공·복지</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>