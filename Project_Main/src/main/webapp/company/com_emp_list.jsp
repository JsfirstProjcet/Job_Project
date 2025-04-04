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
let page0=1//진행중 전체
let page1=1//진행중 신입
let page2=1//진행중 경력
let page3=1//마감된 전체
$(function(){
	print()
	print1()
	$('.dead').hide()
	
	$('.type').change(function(){
		type=$(this).val()
		page0=1
		page1=1
		page2=1
		print()
	})
	$('.ph').click(function(){
		ph=$(this).attr("data-on")
		print()
	})
	$('.emp-box').click(function(){
		let test=$(this).attr("data-on")
	})
	$('.type2').change(function(){
		let type2=$(this).val()
		if(type2==0){
			$('.ing').show()
			$('.dead').hide()
		}else if(type2==1){
			$('.ing').hide()
			$('.dead').show()
		}
	})
})
function pageChange0(p){
	if(ph==0){
		page0=p
	}else if(ph==1){
		page1=p
	}else if(ph==2){
		page2=p
	}
	print()
}
function pageChange1(p){
	page3=p
	print1()
}
//진행중인 공고 출력
function print(){
	if(ph==0){
		page=page0
	}else if(ph==1){
		page=page1
	}else if(ph==2){
		page=page2
	}
	$.ajax({
		type:'post',
		url:'../company/com_emp_list_print.do',
		data:{"cno":cno,"type":type,"ph":ph,"page":page},
		success:function(res){
			let json=JSON.parse(res)
			$('#tab1').html(jsonView(json))
			$('.e-count0').text("("+json[0].e_count0+")");
			$('.e-count1').text("("+json[0].e_count1+")");
			$('.e-count2').text("("+json[0].e_count2+")");
		}
	})
}
//마감된 공고 출력
function print1(){
	$.ajax({
		type:'post',
		url:'../company/com_emp_list_print.do',
		data:{"cno":cno,"type":-1,"ph":-1,"page":page3},
		success:function(res){
			let json=JSON.parse(res)
			$('#tab2').html(jsonView(json))
			$('.ed-count').text("("+json[0].ed_count+")")
		}
	})
}
function jsonView(json){
	let html=''
	json.map(function(emp){
		html+=''
		+'<div class="job-item p-4 mb-2">'
			+'<div class="row g-4">'
				+'<div class="col-sm-12 col-md-9 d-flex align-items-center emp-box" >'
					+'<div class="text-start ps-4 row text-loc">'
						+'<strong class="mb-3">'
							if(json[0].mode==0){
								html+=''
								+'<a href="../emp/emp_detail.do?no='+emp.eno+'">'
								+emp.title
								+'</a>'
							}else{
								html+=''
								+emp.title
							}
						html+=''
						+'</strong>'
						+'<small class="text-truncate me-3" title="'+emp.loc+'">'
							+'<i class="fas fa-map-marker-alt text-primary me-2"></i>'+emp.loc
						+'</small>'
						+'<small class="text-truncate me-3"><i class="fas bi-clock-history text-primary me-2"></i>'+emp.emp_type+'</small>'
						+'<small class="text-truncate me-0"><i class="fas fa-project-diagram text-primary me-2"></i>'+emp.personal_history+'</small>'
					+'</div>'
				+'</div>'
				+'<div class="col-sm-12 col-md-3 d-flex flex-column align-items-start align-items-md-end justify-content-center">'
					+'<div class="d-flex mb-1">'
					if(json[0].mode==0){
						if(emp.check==0){
							html+=''
							+'<a class="btn btn-light btn-square me-3 fo-insert-'+emp.eno+'" onclick="insertEmpFollow('+emp.eno+')"><i class="far bi-heart text-primary"></i></a>'
						}else if(emp.check==1){
							html+=''
							+'<a class="btn btn-light btn-square me-3 fo-delete-'+emp.eno+'" onclick="deleteEmpFollow('+emp.eno+')"><i class="far bi-heart-fill text-primary"></i></a>'
						}
						html+=''
						+'<a class="btn btn-primary" href="../emp/emp_detail.do?no='+emp.eno+'">Recruit</a>'
					}else{
						html+=''
						+'<input type="button" class="btn btn-primary" disabled value="접수마감">'
					}
				html+=''
					+'</div>'
					+'<div class="text-start ps-4 row text-loc">'
						+'<strong>'
						+'<span class="text-truncate me-3"><i class="far bi-eye text-dark me-2"></i>'+emp.hit+'</span>'
						+'<span class="text-truncate me-3 follow-'+emp.eno+'"><i class="far fa-heart text-danger me-2"></i>'+emp.fo_count+'</span>'
                        +'<span class="text-truncate me-3 seeker-'+emp.eno+'"><i class="fas fa-user-tie text-primary me-2"></i>'+emp.se_count+'</span>'
						+'</strong>'
					+'</div>'
					+'<div class="row">'
						+'<small class="text-truncate"><i class="far fa-calendar-times text-primary me-2"></i>'+emp.dbdeadline+'</small>'
						+'<small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>'+emp.dbregdate+'등록</small>'
					+'</div>'
				+'</div>'
			+'</div>'
		+'</div>'
	})
	html+=''
		+'<div class="col-12">'
			+'<div class="row" style="justify-content: space-between;">'
				+'<ul class="pagination col-9">'
					if(json[0].startPage>1){
						html+=''
						+'<li class="page-item">'
							+'<a class="page-link" onclick="pageChange'
							if(json[0].mode==0){
								html+='0'
							}else{
								html+='1'
							}
						html+='('+(json[0].startPage-1)+')"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>'
						+'</li>'
					}
					for(let i=json[0].startPage;i<=json[0].endPage;i++){
						html+=''
						+'<li class="page-item '+(json[0].curpage==i?"active":"")+'"><a class="page-link" onclick="pageChange'
						if(json[0].mode==0){
							html+='0'
						}else{
							html+='1'
						}
						html+='('+i+')">'+i+'</a></li>'
					}
					if(json[0].endPage<json[0].totalpage){
						html+=''
						+'<li class="page-item">'
							+'<a class="page-link" onclick="pageChange'
							if(json[0].mode==0){
								html+='0'
							}else{
								html+='1'
							}
						html+='('+(json[0].endPage+1)+')"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>'
						+'</li>'
					}
			html+=''
				+'</ul>'
				+'<div class="page-status col-3" style="float: right;">'
					+'<p>Page '+json[0].curpage+' of '+json[0].totalpage+' pages</p>'
				+'</div>'
			+'</div>'
		+'</div>'
	return html
}
// 공고 팔로우
function insertEmpFollow(eno){
	let id='${sessionScope.id}'
	let ftype=1
	if(${sessionScope.id!=null} && ${sessionScope.isadmin==0}){
		$.ajax({
			type:'post',
			url:'../follow/follow_insert.do',
			data:{"no":eno,"id":id,"type":ftype},
			success:function(res){
				printEmpFollow(eno)
			}
		})
	}else if(${sessionScope.cid!=null}){
		if(confirm("기업계정으로 이용 불가능한 기능입니다\n일반 사용자 계정으로 로그인 후 이용가능한 기능입니다\n로그아웃 하시겠습니까?")){
			location.href='../personal/logout.do?mode=1&no='+cno
			return
		}else{
			return
		}
	}else{
		alert("일반 사용자 계정으로 로그인 후 이용가능한 기능입니다")
		javascript:login()
		return
	}
}
function deleteEmpFollow(eno){
	let id='${sessionScope.id}'
	let ftype=1
	$.ajax({
		type:'post',
		url:'../follow/follow_delete.do',
		data:{"no":eno,"id":id,"type":ftype},
		success:function(res){
			printEmpFollow(eno)
		}
	})
}
function printEmpFollow(eno){
	let id='${sessionScope.id}'
	let ftype=1
	if(${sessionScope.id!=null} && ${sessionScope.isadmin==0}){
		$.ajax({
			type:'post',
			url:'../follow/follow_print.do',
			data:{"no":eno,"id":id,"type":ftype},
			success:function(res){
				if(res.check==0){
					$('.fo-delete-'+eno+' .bi-heart-fill').removeClass("bi-heart-fill").addClass("bi-heart")
					$('.fo-delete-'+eno).attr("onclick","insertEmpFollow("+eno+")")
					
					$('.fo-delete-'+eno).removeClass("fo-delete-"+eno).addClass("fo-insert-"+eno)
				}else if(res.check==1){
					$('.fo-insert-'+eno+' .bi-heart').removeClass("bi-heart").addClass("bi-heart-fill")
					$('.fo-insert-'+eno).attr("onclick","deleteEmpFollow("+eno+")")
					
					$('.fo-insert-'+eno).removeClass("fo-insert-"+eno).addClass("fo-delete-"+eno)
				}
				html='<i class="far fa-heart text-danger me-2"></i>'+res.fCount
				$('.follow-'+eno).html(html)
			}
		})
	}
}
</script>
<style type="text/css">
.text-loc{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<!-- Jobs Start -->
    <div class="container-xxl py-5">
    	<select class="type2">
        	<option value="0">진행중인 공고</option>
        	<option value="1">마감된 공고</option>
        </select>
        <div class="container ing">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">진행중인 공고</h1>
            <div class="tab-class text-left wow fadeInUp" data-wow-delay="0.3s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active ph" data-bs-toggle="pill" data-on="0" href="#tab-1">
                            <h6 class="mt-n1 mb-0">전체<span class="e-count0"></span></h6>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 pb-3 ph" data-bs-toggle="pill" data-on="1" href="#tab-2">
                            <h6 class="mt-n1 mb-0">신입<span class="e-count1"></span></h6>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3 ph" data-bs-toggle="pill" data-on="2" href="#tab-3">
                            <h6 class="mt-n1 mb-0">경력<span class="e-count2"></span></h6>
                        </a>
                    </li>
                </ul>
                <select class="type" style="float: right;">
                	<option value="0">마감임박순</option>
                	<option value="1">신규등록순</option>
                	<option value="2">조회수높은순</option>
                </select>
                <div class="tab-content">
                    <div id="tab1" class="tab-pane fade show p-0 active">
                    </div>
                </div>
            </div>
        </div>
        <div class="container dead">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">마감된 공고<span class="ed-count"></span></h1>
            <div class="tab-class text-left wow fadeInUp" data-wow-delay="0.3s">
                <div class="tab-content">
                    <div id="tab2" class="tab-pane fade show p-0 active">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Jobs End -->
</body>
</html>