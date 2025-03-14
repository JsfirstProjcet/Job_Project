<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let cno=${vo.cno}
let type=0
let ph=0
let page=1
$(function(){
	print(type,ph,page)
	
	$('.type').change(function(){
		type=$(this).val()
		print()
	})
	
	$('.ph').click(function(){
		ph=$(this).attr("data-on")
		print()
	})
	$('.emp-box').click(function(){
		alert(1234)
		let test=$(this).attr("data-on")
		print()
	})
})
function print(){
	$.ajax({
		type:'post',
		url:'../company/com_emp_list_print.do',
		data:{"cno":cno,"type":type,"ph":ph,"page":page},
		success:function(res){
			let json=JSON.parse(res)
			jsonView(json)
		}
	})
}
function jsonView(json){
	let html=''
	json.map(function(emp){
		html+=''
		+'<div class="job-item p-4 mb-4">'
			+'<div class="row g-4">'
				+'<div class="col-sm-12 col-md-8 d-flex align-items-center emp-box" >'
					+'<img class="flex-shrink-0 img-fluid border rounded" src="https://pds.saramin.co.kr/company${vo.poster}" alt="" style="width: 80px; height: 80px;">'
					+'<div class="text-start ps-4 row">'
						+'<strong class="mb-3">'+emp.title+'('+emp.hit+')'+'</strong>'
						+'<span class="text-truncate me-3"><i class="fa bi-map text-primary me-2"></i>'+emp.loc+'</span>'
						+'<span class="text-truncate me-3"><i class="far bi-clock-history text-primary me-2"></i>'+emp.emp_type+'</span>'
						+'<span class="text-truncate me-0"><i class="far bi-money-bill-alt text-primary me-2"></i>'+emp.personal_history+'</span>'
					+'</div>'
				+'</div>'
				+'<div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">'
					+'<div class="d-flex mb-3">'
						+'<a class="btn btn-outline-warning btn-square me-1" href=""><i class="far bi-eye"></i>&nbsp;'+emp.hit+'</a>'
						+'<a class="btn btn-outline-info btn-square me-1" href=""><i class="far bi-person-plus"></i>&nbsp;'+emp.se_count+'</a>'
						+'<a class="btn btn-outline-danger btn-square me-1" href=""><i class="far bi-heart"></i>&nbsp;'+emp.fo_count+'</a>'
					+'</div>'
					+'<small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>마감일:'+emp.dbdeadline+'</small>'
				+'</div>'
			+'</div>'
		+'</div>'
	})
	$('#tab').html(html)
}
</script>
</head>
<body>
	<!-- Jobs Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">진행중인 공고</h1>
            <div class="tab-class text-left wow fadeInUp" data-wow-delay="0.3s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active ph" data-bs-toggle="pill" data-on="0" href="#tab-1">
                            <h6 class="mt-n1 mb-0">전체</h6>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 pb-3 ph" data-bs-toggle="pill" data-on="1" href="#tab-2">
                            <h6 class="mt-n1 mb-0">신입</h6>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3 ph" data-bs-toggle="pill" data-on="2" href="#tab-3">
                            <h6 class="mt-n1 mb-0">경력</h6>
                        </a>
                    </li>
                </ul>
                <select class="type" style="float: right;">
                	<option value="0">마감임박순</option>
                	<option value="1">신규등록순</option>
                	<option value="2">조회수높은순</option>
                </select>
                <div class="tab-content">
                    <div id="tab" class="tab-pane fade show p-0 active">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">마감된 공고</h1>
            <div class="tab-class text-left wow fadeInUp" data-wow-delay="0.3s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                            <h6 class="mt-n1 mb-0">전체</h6>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="job-item p-4 mb-4">
                            <div class="row g-4">
                                <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                    <img class="flex-shrink-0 img-fluid border rounded" src="../img/com-logo-1.jpg" alt="" style="width: 80px; height: 80px;">
                                    <div class="text-start ps-4">
                                        <h5 class="mb-3">Software Engineer</h5>
                                        <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
                                        <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
                                        <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                    <div class="d-flex mb-3">
                                        <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
                                        <a class="btn btn-primary" href="">Apply Now</a>
                                    </div>
                                    <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: 01 Jan, 2045</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Jobs End -->
</body>
</html>