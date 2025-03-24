<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
let check=false
let deadline='${evo.dbdeadline}'
let date=new Date(deadline.replace(" ", "T"));
$(function(){
	if(${evo.deadline==null}){
		$('.deadline-text').text("상시 모집")
	}else{
		updateDeadline();
	    const timer = setInterval(updateDeadline, 1000);
	}
	
	$('.btn-map').click(function(){
		if(check){
			$('.div-map').hide()
			check=false
		}else{
			$('.div-map').show()
			check=true
		}
	})
	$('.job-tag').click(function(){
		let jno=$(this).attr("data-jno")
		
	})
	setTimeout(() => {
	    $("a").removeAttr("target");
	    $(".content a").attr("target","_blank");
	    $(".btn-find-map").attr("target","_blank");
	    $(".homepage").attr("target","_blank");
	}, 1000)
})
function updateDeadline() {
    const now = new Date();
    const timeDiff = date - now;
    if (timeDiff <= 0) {
    	$('.deadline-text').text("지원 마감")
    	$('.recruit-btn').removeAttr("href")
    	$('.recruit-btn').css({"background-color":"gray","border":"black","cursor":"default"})

        clearInterval(timer);
        return;
    }

    const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
    const hours = String(Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).padStart(2, '0');
    const minutes = String(Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60))).padStart(2, '0');
    const seconds = String(Math.floor((timeDiff % (1000 * 60)) / 1000)).padStart(2, '0');
    
    let deadlineStr=days+'일 '+hours+":"+minutes+":"+seconds
	$('.deadline').text(deadlineStr)
}
function insertComFollow(cno){
	let id='${sessionScope.id}'
	let type=0
	if(${sessionScope.id!=null} && ${sessionScope.isadmin==0}){
		$.ajax({
			type:'post',
			url:'../follow/follow_insert.do',
			data:{"no":cno,"id":id,"type":type},
			success:function(res){
				printComFollow(cno)
			}
		})
	}else if(${sessionScope.cid!=null}){
		if(confirm("기업계정으로 이용 불가능한 기능입니다\n일반 사용자 계정으로 로그인 후 이용가능한 기능입니다\n로그아웃 하시겠습니까?")){
		}else{
			return
		}
	}else {
		alert("일반 사용자 계정으로 로그인 후 이용가능한 기능입니다")
		javascript:login()
		return
	}
}
function deleteComFollow(cno){
	let id='${sessionScope.id}'
	let type=0
	$.ajax({
		type:'post',
		url:'../follow/follow_delete.do',
		data:{"no":cno,"id":id,"type":type},
		success:function(res){
			printComFollow(cno)
		}
	})
}
// 기업 팔로우
function printComFollow(cno){
	let id='${sessionScope.id}'
	let type=0
	let html=''
	$.ajax({
		type:'post',
		url:'../follow/follow_print.do',
		data:{"no":cno,"id":id,"type":type},
		success:function(res){
			if(res.check==0){
				$('.follow-com').attr("onclick","insertComFollow("+cno+")")
				$('.follow-com .bi-star-fill').css("color","gray")
				
				$('.follow-com .bi-star-fill').removeClass("bi-star-fill").addClass("bi-star")
			}else if(res.check==1){
				$('.follow-com').attr("onclick","deleteComFollow("+cno+")")
				$('.follow-com .bi-star').css("color","orange")
				
				$('.follow-com .bi-star').removeClass("bi-star").addClass("bi-star-fill")
			}
		}
	})
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
					$('.follow-emp .bi-heart-fill').removeClass("bi-heart-fill").addClass("bi-heart")
					$('.follow-emp').attr("onclick","insertEmpFollow("+eno+")")
				}else if(res.check==1){
					$('.follow-emp .bi-heart').removeClass("bi-heart").addClass("bi-heart-fill")
					$('.follow-emp').attr("onclick","deleteEmpFollow("+eno+")")
				}
				html='<i class="far fa-heart text-danger me-2"></i>'+res.fCount
				$('.follow-span').html(html)
			}
		})
	}
}
// 지원
function recruit(eno){
    Shadowbox.open({
        content:'../personal/recruit.do?eno='+eno,
        player:'iframe',
        width:800,
        height:600,
        title:'${evo.title} 지원하기'
    })	
}
</script>
<style type="text/css">
#content script {
    display: none;
}
#content style {
    display: none;
}
</style>
</head>
<body id="top">
	<!-- Header End -->
        <div class="container-xxl py-5 bg-dark page-header">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">Job Detail</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">공고 상세보기</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Header End -->


        <!-- Job Detail Start -->
        <div class="container-xxl py-5 wow fadeInUp mt-5 bi-light" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gy-5 gx-4">
                    <div class="row" style="margin: 0px auto; width: 860px">
                        <div class="row d-flex align-items-center mb-5">
                        	<div class="col-8" style="float: left;">
	                            <strong><a href="../company/com_emp_list.do?cno=${cvo.cno }">${evo.name }</a></strong>
	                            <c:if test="${cCheck==0 }">
		                            <a class="btn btn-sm btn-light follow-com" style="border: 1px solid gray; border-radius: 5px;" onclick="insertComFollow(${cvo.cno })">
		                            	<i class="far bi-star me-2" style="color: gray"></i>관심기업
		                            </a>
	                            </c:if>
	                            <c:if test="${cCheck==1 }">
		                            <a class="btn btn-sm btn-light follow-com" style="border: 1px solid gray; border-radius: 5px;" onclick="deleteComFollow(${cvo.cno })">
		                            	<i class="far bi-star-fill me-2" style="color: orange"></i>관심기업
		                            </a>
	                            </c:if>
                                <h3 class="mb-3">${evo.title }</h3>
                        	</div>
                            <div class="col-4">
	                           	<div class="row">
									<div class="row mb-3" style="height: 20px; float: right">
										<p">
			                           		<span class="me-3"><i class="far bi-eye text-dark me-2"></i>${evo.hit }</span>
											<span class="me-3 follow-span"><i class="far fa-heart text-danger me-2"></i>${evo.fo_count }</span>
					                        <span class="me-3 seeker-span"><i class="fas fa-user-tie text-primary me-2"></i>${evo.se_count }</span>
										</p>
									</div>
									<c:if test="${eCheck==0 }">
		                           		<a class="btn btn-light btn-square me-3 col-3 follow-emp" onclick="insertEmpFollow(${evo.eno})"><i class="far bi-heart text-primary"></i></a>
									</c:if>
									<c:if test="${eCheck==1 }">
		                           		<a class="btn btn-light btn-square me-3 col-3 follow-emp" onclick="deleteEmpFollow(${evo.eno})"><i class="far bi-heart-fill text-primary"></i></a>
									</c:if>
									<a class="btn btn-primary col-9 recruit-btn" onclick="recruit(${evo.eno })">지원하기</a>
									<span class="text-end deadline-text">남은 기간:&nbsp;<span class="deadline" style="color: red;">${evo.dbdeadline }</span></span>
	                           	</div>
                            </div>
                            <hr>
                            <c:if test="${evo.personal_history!=null }">
	                            <div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				경력
	                    			</div>
	                    			<div class="col-9">${evo.personal_history }</div>
	                    		</div>
                            </c:if>
                            <c:if test="${evo.salary_str!=null }">
	                            <div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				급여
	                    			</div>
	                    			<div class="col-9">${evo.salary_str }</div>
	                    		</div>
                            </c:if>
                            <c:if test="${evo.education!=null }">
	                            <div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				학력
	                    			</div>
	                    			<div class="col-9">${evo.education }</div>
	                    		</div>
                            </c:if>
                            <c:if test="${evo.emp_type!=null }">
	                            <div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				근무형태
	                    			</div>
	                    			<div class="col-9">${evo.emp_type }</div>
	                    		</div>
                            </c:if>
                            <c:if test="${evo.loc!=null }">
	                            <div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				근무지역
	                    			</div>
	                    			<div class="col-9">${evo.loc }</div>
	                    		</div>
                            </c:if>
                        </div>
                        
						<hr>
						
                        <div class="content row">
                        	${evo.content }
                        </div>
                        
                        <div class="com-introduction row pt-3 pb-3" style="border: 1px solid gray; border-radius: 10px">
                        	<div class="row">
                        		<div class="col-10">
		                        	<h3>기업정보</h3>
	                        		<strong><a href="../company/com_emp_list.do?cno=${cvo.cno }" >${evo.name }</a></strong>
		                            <c:if test="${cCheck==0 }">
			                            <a class="btn btn-sm btn-light follow-com" style="border: 1px solid gray; border-radius: 5px;" onclick="insertComFollow(${cvo.cno })">
			                            	<i class="far bi-star me-2" style="color: gray"></i>관심기업
			                            </a>
		                            </c:if>
		                            <c:if test="${cCheck==1 }">
			                            <a class="btn btn-sm btn-light follow-com" style="border: 1px solid gray; border-radius: 5px;" onclick="deleteComFollow(${cvo.cno })">
			                            	<i class="far bi-star-fill me-2" style="color: orange"></i>관심기업
			                            </a>
		                            </c:if>
                        		</div>
                        		<div class="col-2">
		                        	<c:if test="${cvo.poster!=null }">
			                        	<img class="flex-shrink-0 img-fluid border rounded" src="https://pds.saramin.co.kr/company${cvo.poster }"
											style="width: 80px; height: 80px;background-color: white; border-radius: 50px; border: none;">
		                        	</c:if>
		                        	<c:if test="${cvo.poster==null }">
			                        	<img class="flex-shrink-0 img-fluid border rounded" src="../img/logo/noimg2.png"
											style="width: 100%; height: 80px;background-color: white; border-radius: 50px; border: none">
		                        	</c:if>
                        		</div>
                        	</div>
                        	<c:if test="${cvo.dbestdate!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				설립일
	                    			</div>
	                    			<div class="col-9">${cvo.dbestdate }</div>
	                    		</div>
                   			</c:if>
                        	<c:if test="${cvo.c_type!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				기업형태
	                    			</div>
	                    			<div class="col-9">${cvo.c_type }</div>
	                    		</div>
                   			</c:if>
                        	<c:if test="${cvo.ecount!=0 }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				사원수
	                    			</div>
	                    			<div class="col-9">${cvo.ecount }</div>
	                    		</div>
                   			</c:if>
                        	<c:if test="${cvo.take!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				매출액
	                    			</div>
	                    			<div class="col-9">
	                    				<span>
		                    			<c:if test="${cvo.jo!=0 }">${cvo.jo }조</c:if>
										<c:if test="${cvo.uk!=0 }">${cvo.uk }억</c:if>
										<c:if test="${cvo.man!=0 }">${cvo.man }만</c:if>
	                    				</span>
	                    			</div>
	                    		</div>
                   			</c:if>
                        	<c:if test="${cvo.industry!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				업종
	                    			</div>
	                    			<div class="col-9">${cvo.industry }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${cvo.representative!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				대표자명
	                    			</div>
	                    			<div class="col-9">${cvo.representative }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${cvo.homepage!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				홈페이지
	                    			</div>
	                    			<div class="col-9">
		                    			<a class="homepage" href="${cvo.homepage }" target="_blank">${cvo.homepage }</a>
	                    			</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${cvo.bu_details!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				사업내용
	                    			</div>
	                    			<div class="col-9">${cvo.bu_details }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${cvo.address!=null }">
		                   		<div class="row col-6 mt-3">
		                   			<div class="col-3">
		                   				주소
		                   			</div>
		                   			<div class="col-9">
		                   				${cvo.address }<br>
		                   				<a href="javascript:map()" class="btn btn-sm btn-outline-primary btn-map" style="border: 1px solid; border-radius: 2px;cursor: pointer;">
		                   					<i class="bi-map-fill"></i>지도
		                   				</a>
		                   				<a href="#" target="_blank" class="btn btn-sm btn-outline-primary btn-find-map" style="border: 1px solid; border-radius: 2px;cursor: pointer;">
		                   					<i class="bi-binoculars"></i>길찾기
		                   				</a>
		                   			</div>
		                   		</div>
		                    	<div class="row map">
		                    		<div class="content div-map">
										<div id="map" style="width:100%;height:350px; border-radius: 10px"></div>
		                    			<p>
										    <em class="link">
										        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
										            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
										        </a>
										    </em>
										</p>
										
										<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5c499003a5ed7ef16b41579b19a32a3&libraries=services"></script>
										<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new kakao.maps.Map(mapContainer, mapOption); 
										
										// 주소-좌표 변환 객체를 생성합니다
										var geocoder = new kakao.maps.services.Geocoder();
										// 주소로 좌표를 검색합니다
										geocoder.addressSearch('${cvo.address}', function(result, status) {
										
										    // 정상적으로 검색이 완료됐으면 
										     if (status === kakao.maps.services.Status.OK) {
										
										        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										
										        // 결과값으로 받은 위치를 마커로 표시합니다
										        var marker = new kakao.maps.Marker({
										            map: map,
										            position: coords
										        });
										
										        // 인포윈도우로 장소에 대한 설명을 표시합니다
										        var infowindow = new kakao.maps.InfoWindow({
										            content: '<div style="width:150px;text-align:center;padding:6px 0;">${cvo.name}</div>'
										        });
										        infowindow.open(map, marker);
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										        
										        $('.btn-find-map').attr("href","https://map.kakao.com/link/to/${cvo.name},"+result[0].y+","+result[0].x)
										        
												$('.div-map').hide();
										    } 
										});
										
										</script>
		                    		</div>
		                    	</div>
                   			</c:if>
	                        <div class="emp-job mt-3">
	                        	<c:forEach var="jvo" items="${jList }">
	                        		<a class="btn btn-xs btn-light mb-1 me-1 job-tag"
	                        			style="font-size: 10px; color: gray; border: 1px solid gray; border-radius: 5px" data-jno=${jvo.jno }>
	                        			#&nbsp;${jvo.name }
	                        		</a>
	                        	</c:forEach>
	                        </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </div>
        <!-- Job Detail End -->
</body>
</html>