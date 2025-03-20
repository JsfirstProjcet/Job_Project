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
$(function(){
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
	    $("a.btn-find-map").attr("target","_blank");
	}, 100)
})
</script>
<style type="text/css">
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
	                            <strong><a href="../company/com_emp_list.do?cno=${cvo.cno }" >${evo.name }</a></strong>
	                            <a href="#" class="btn btn-sm btn-light" style="border: 1px solid gray; border-radius: 5px;">
	                            	<i class="far bi-star me-2" style="color: gray"></i>관심기업
	                            </a>
                                <h3 class="mb-3">${evo.title }</h3>
                        	</div>
                            <div class="col-4">
	                           	<div class="row">
									<div class="row mb-3" style="height: 20px; float: right">
										<p">
			                           		<span class="me-3"><i class="far bi-eye text-dark me-2"></i>${evo.hit }</span>
											<span class="me-3"><i class="far fa-heart text-danger me-2"></i>${evo.fo_count }</span>
					                        <span class="me-3"><i class="fas fa-user-tie text-primary me-2"></i>${evo.se_count }</span>
										</p>
									</div>
	                           		<a class="btn btn-light btn-square me-3 col-3" href="#"><i class="far fa-heart text-primary"></i></a>
									<a class="btn btn-primary mb-3 col-9" href="#">지원하기</a>
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
		                            <a href="#" class="btn btn-sm btn-light" style="border: 1px solid gray; border-radius: 5px;">
		                            	<i class="far bi-star me-2" style="color: gray"></i>관심기업
		                            </a>
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
		                    			<a href="${cvo.homepage }" target="_blank">${cvo.homepage }</a>
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