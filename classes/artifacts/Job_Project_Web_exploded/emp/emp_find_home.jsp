<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 검색</title>
</head>
<body id="top">
	<form action="emp_find.do" method="get">
      <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
         <div class="container">
             <div class="row g-2">
                 <div class="col-md-10">
                     <div class="row g-2">
                         <div class="col-md-4">
							<input type="text" class="form-control border-0" name="keyword" value="${param.keyword}" placeholder="Keyword" />
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0" name="jno">
                                 <option value="">직업별</option>
                                 <option value="16" ${param.jno == '16' ? 'selected' : ''}>기획·전략</option>
                                 <option value="14" ${param.jno == '14' ? 'selected' : ''}>마케팅·홍보·조사</option>
                                 <option value="3" ${param.jno == '3' ? 'selected' : ''}>회계·세무·재무</option>
                                 <option value="5" ${param.jno == '5' ? 'selected' : ''}>인사·노무·HRD</option>
                                 <option value="4" ${param.jno == '4' ? 'selected' : ''}>총무·법무·사무</option>
                                 <option value="2" ${param.jno == '2' ? 'selected' : ''}>IT개발·데이터</option>
                                 <option value="15" ${param.jno == '15' ? 'selected' : ''}>디자인</option>
                                 <option value="8" ${param.jno == '8' ? 'selected' : ''}>영업·판매·무역</option>
                                 <option value="21" ${param.jno == '21' ? 'selected' : ''}>고객상담·TM</option>
                                 <option value="18" ${param.jno == '18' ? 'selected' : ''}>구매·자재·물류</option>
                                 <option value="12" ${param.jno == '12' ? 'selected' : ''}>상품기획·MD</option>
                                 <option value="7" ${param.jno == '7' ? 'selected' : ''}>운전·운송·배송</option>
                                 <option value="10" ${param.jno == '10' ? 'selected' : ''}>서비스</option>
                                 <option value="11" ${param.jno == '11' ? 'selected' : ''}>생산</option>
                                 <option value="22" ${param.jno == '22' ? 'selected' : ''}>건설·건축</option>
                                 <option value="6" ${param.jno == '6' ? 'selected' : ''}>의료</option>
                                 <option value="9" ${param.jno == '9' ? 'selected' : ''}>연구·R&D</option>
                                 <option value="19" ${param.jno == '19' ? 'selected' : ''}>교육</option>
                                 <option value="13" ${param.jno == '13' ? 'selected' : ''}>미디어·문화·스포츠</option>
                                 <option value="17" ${param.jno == '17' ? 'selected' : ''}>금융·보험</option>
                                 <option value="20" ${param.jno == '20' ? 'selected' : ''}>공공·복지</option>
                             </select>
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0" name="loc">
                                 <option value="">지역별</option>
                                 <option value="18" ${param.loc == '18' ? 'selected' : ''}>전국</option>
                                 <option value="1" ${param.loc == '1' ? 'selected' : ''}>서울</option>
                                 <option value="2" ${param.loc == '2' ? 'selected' : ''}>경기</option>
                                 <option value="3" ${param.loc == '3' ? 'selected' : ''}>광주</option>
                                 <option value="4" ${param.loc == '4' ? 'selected' : ''}>대구</option>
                                 <option value="5" ${param.loc == '5' ? 'selected' : ''}>대전</option>
                                 <option value="6" ${param.loc == '6' ? 'selected' : ''}>부산</option>
                                 <option value="7" ${param.loc == '7' ? 'selected' : ''}>울산</option>
                                 <option value="8" ${param.loc == '8' ? 'selected' : ''}>인천</option>
                                 <option value="9" ${param.loc == '9' ? 'selected' : ''}>강원</option>
                                 <option value="10" ${param.loc == '10' ? 'selected' : ''}>경남</option>
                                 <option value="11" ${param.loc == '11' ? 'selected' : ''}>경북</option>
                                 <option value="12" ${param.loc == '12' ? 'selected' : ''}>전남</option>
                                 <option value="13" ${param.loc == '13' ? 'selected' : ''}>전북</option>
                                 <option value="14" ${param.loc == '14' ? 'selected' : ''}>충북</option>
                                 <option value="15" ${param.loc == '15' ? 'selected' : ''}>충남</option>
                                 <option value="16" ${param.loc == '16' ? 'selected' : ''}>제주</option>
                                 <option value="17" ${param.loc == '17' ? 'selected' : ''}>세종</option>
                                 <option value="19" ${param.loc == '19' ? 'selected' : ''}>해외</option>
                                 <option value="20" ${param.loc == '20' ? 'selected' : ''}>기타</option>
                             </select>
                         </div>
                     </div>
                 </div>                 
                 <div class="col-md-2">
                     <button class="btn btn-dark border-0 w-100" type="submit">Search</button>
                 </div>
             </div>
         </div>
     </div>
 </form>	
    <div class="container-xxl py-5">
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Explore By Job</h1>
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=16">
                    <i class="fa-solid fa-chart-column">‌</i>
                        <i class="fa fa-3x fa-chart-pie text-primary mb-4" ></i>
                        <h6 class="mb-3">기획·전략</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=14">
                        <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
                        <h6 class="mb-3">마케팅·홍보·조사</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=3">
                        <i class="fa fa-3x fa-file-invoice-dollar text-primary mb-4"></i>
                        <h6 class="mb-3">회계·세무·재무</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=5">
                    <i class="fa-solid fa-arrows-down-to-people">‌</i>
                        <i class="fa fa-3x fa-user-plus text-primary mb-4"></i>
                        <h6 class="mb-3">인사·노무·HRD</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=4">
                        <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                        <h6 class="mb-3">총무·법무·사무</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=2">
                        <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                        <h6 class="mb-3">IT개발·데이터</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=15">
                        <i class="fa fa-3x fa-edit text-primary mb-4"></i>
                        <h6 class="mb-3">디자인</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=8">
                        <i class="fa fa-3x fa-hands-helping text-primary mb-4"></i>
                        <h6 class="mb-3">영업·판매·무역</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=21">
                        <i class="fa fa-3x fa-headset text-primary mb-4"></i>
                        <h6 class="mb-3">고객상담·TM</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=18">
                        <i class="fa fa-3x fa-shopping-cart text-primary mb-4"></i>
                        <h6 class="mb-3">구매·자재·물류</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=12">
                        <i class="fa fa-3x fa-lightbulb text-primary mb-4"></i>
                        <h6 class="mb-3">상품기획·MD</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=7">
                        <i class="fa fa-3x fa-truck text-primary mb-4"></i>
                        <h6 class="mb-3">운전·운송·배송</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=16">
                        <i class="fa fa-3x fa-comments text-primary mb-4"></i>
                        <h6 class="mb-3">서비스</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=10">
                        <i class="fa fa-3x fa-industry text-primary mb-4"></i>
                        <h6 class="mb-3">생산</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=22">
                        <i class="fa fa-3x fa-wrench text-primary mb-4"></i>
                        <h6 class="mb-3">건설·건축</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=6">
                        <i class="fa fa-3x fa-medkit text-primary mb-4"></i>
                        <h6 class="mb-3">의료	</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=9">
                        <i class="fa fa-3x fa-flask text-primary mb-4"></i>
                        <h6 class="mb-3">연구·R&D</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=19">
                        <i class="fa fa-3x fa-book-reader text-primary mb-4"></i>
                        <h6 class="mb-3">교육</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=13">
                        <i class="fa fa-3x fa-trophy text-primary mb-4"></i>
                        <h6 class="mb-3">미디어·문화·스포츠</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=17">
                        <i class="fa fa-3x fa-university text-primary mb-4"></i>
                        <h6 class="mb-3">금융·보험</h6>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="emp_find.do?jno=20">
                        <i class="fa fa-3x fa-wheelchair text-primary mb-4"></i>
                        <h6 class="mb-3">공공·복지</h6>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>