<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Insert title here</title>
=======
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript">
$(function(){
	let check=false
	
	$('.btn-map').click(function(){
		if(check){
			$('.div-map').hide()
			check=false
		}else{
			$('.div-map').show()
			check=true
		}
	})
})
</script>
>>>>>>> branch 'main' of https://github.com/JsfirstProjcet/Job_Project.git
</head>
<<<<<<< HEAD
<body id="top">

    <!-- Header End -->
    <div class="container-xxl py-5 bg-dark page-header mb-5">
        <div class="container my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">Job Detail</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb text-uppercase">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Job Detail</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Header End -->


    <!-- Job Detail Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row gy-5 gx-4">
                <div class="col-lg-8">
                    <div class="d-flex align-items-center mb-5">
                        <img class="flex-shrink-0 img-fluid border rounded" src="../img/com-logo-2.jpg" alt="" style="width: 80px; height: 80px;">
                        <div class="text-start ps-4">
                            <h3 class="mb-3">Marketing Manager</h3>
                            <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>New York, USA</span>
                            <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>Full Time</span>
                            <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>$123 - $456</span>
                        </div>
                    </div>

                    <div class="mb-5">
                        <h4 class="mb-3">Job description</h4>
                        <p>Dolor justo tempor duo ipsum accusam rebum gubergren erat. Elitr stet dolor vero clita labore gubergren. Kasd sed ipsum elitr clita rebum ut sea diam tempor. Sadipscing nonumy vero labore invidunt dolor sed, eirmod dolore amet aliquyam consetetur lorem, amet elitr clita et sed consetetur dolore accusam. Vero kasd nonumy justo rebum stet. Ipsum amet sed lorem sea magna. Rebum vero dolores dolores elitr vero dolores magna, stet sea sadipscing stet et. Est voluptua et sanctus at sanctus erat vero sed sed, amet duo no diam clita rebum duo, accusam tempor takimata clita stet nonumy rebum est invidunt stet, dolor.</p>
                        <h4 class="mb-3">Responsibility</h4>
                        <p>Magna et elitr diam sed lorem. Diam diam stet erat no est est. Accusam sed lorem stet voluptua sit sit at stet consetetur, takimata at diam kasd gubergren elitr dolor</p>
                        <ul class="list-unstyled">
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Dolor justo tempor duo ipsum accusam</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Elitr stet dolor vero clita labore gubergren</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Rebum vero dolores dolores elitr</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Est voluptua et sanctus at sanctus erat</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Diam diam stet erat no est est</li>
                        </ul>
                        <h4 class="mb-3">Qualifications</h4>
                        <p>Magna et elitr diam sed lorem. Diam diam stet erat no est est. Accusam sed lorem stet voluptua sit sit at stet consetetur, takimata at diam kasd gubergren elitr dolor</p>
                        <ul class="list-unstyled">
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Dolor justo tempor duo ipsum accusam</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Elitr stet dolor vero clita labore gubergren</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Rebum vero dolores dolores elitr</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Est voluptua et sanctus at sanctus erat</li>
                            <li><i class="fa fa-angle-right text-primary me-2"></i>Diam diam stet erat no est est</li>
                        </ul>
                    </div>
    
                    <div class="">
                        <h4 class="mb-4">Apply For The Job</h4>
                        <form>
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control" placeholder="Your Name">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="email" class="form-control" placeholder="Your Email">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control" placeholder="Portfolio Website">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="file" class="form-control bg-white">
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control" rows="5" placeholder="Coverletter"></textarea>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100" type="submit">Apply Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
    
                <div class="col-lg-4">
                    <div class="bg-light rounded p-5 mb-4 wow slideInUp" data-wow-delay="0.1s">
                        <h4 class="mb-4">Job Summery</h4>
                        <p><i class="fa fa-angle-right text-primary me-2"></i>Published On: 01 Jan, 2045</p>
                        <p><i class="fa fa-angle-right text-primary me-2"></i>Vacancy: 123 Position</p>
                        <p><i class="fa fa-angle-right text-primary me-2"></i>Job Nature: Full Time</p>
                        <p><i class="fa fa-angle-right text-primary me-2"></i>Salary: $123 - $456</p>
                        <p><i class="fa fa-angle-right text-primary me-2"></i>Location: New York, USA</p>
                        <p class="m-0"><i class="fa fa-angle-right text-primary me-2"></i>Date Line: 01 Jan, 2045</p>
                    </div>
                    <div class="bg-light rounded p-5 wow slideInUp" data-wow-delay="0.1s">
                        <h4 class="mb-4">Company Detail</h4>
                        <p class="m-0">Ipsum dolor ipsum accusam stet et et diam dolores, sed rebum sadipscing elitr vero dolores. Lorem dolore elitr justo et no gubergren sadipscing, ipsum et takimata aliquyam et rebum est ipsum lorem diam. Et lorem magna eirmod est et et sanctus et, kasd clita labore.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Job Detail End -->
=======
<body>
		<!-- Job Detail Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gy-5 gx-4">
                    <div class="col-lg-12">
                    	<div class="row bg-light justify-content-center">
                    		<c:if test="${vo.dbestdate!=null }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-clock-history text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>설립일</span><br>
	                    			<span>${vo.dbestdate }</span>
	                    		</div>
                    		</c:if>
                    		<c:if test="${vo.c_type!=null }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-buildings text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>기업형태</span><br>
	                    			<span>${vo.c_type }</span>
	                    		</div>
                    		</c:if>
                    		<c:if test="${vo.ecount!=0 }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-currency-exchange text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>사원수</span><br>
	                    			<span>${vo.ecount }</span>
	                    		</div>
                    		</c:if>
                    		<c:if test="${vo.take!=0 }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-clock-history text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>매출</span><br>
	                    			<span>
		                    			<c:if test="${vo.jo!=0 }">${vo.jo }조</c:if>
										<c:if test="${vo.uk!=0 }">${vo.uk }억</c:if>
										<c:if test="${vo.man!=0 }">${vo.man }만</c:if>
	                    			</span>
	                    		</div>
                    		</c:if>
                    	</div>
                    	<div class="row">
                   			<c:if test="${vo.industry!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				업종
	                    			</div>
	                    			<div class="col-9">${vo.industry }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.representative!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				대표자명
	                    			</div>
	                    			<div class="col-9">${vo.representative }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.homepage!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				홈페이지
	                    			</div>
	                    			<div class="col-9">${vo.homepage }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.bu_details!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				사업내용
	                    			</div>
	                    			<div class="col-9">${vo.bu_details }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.address!=null }">
		                   		<div class="row col-6">
		                   			<div class="col-3">
		                   				주소
		                   			</div>
		                   			<div class="col-9">
		                   				${vo.address }
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
										geocoder.addressSearch('${vo.address}', function(result, status) {
										
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
										            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
										        });
										        infowindow.open(map, marker);
										
										        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										        map.setCenter(coords);
										        
										        $('.btn-find-map').attr("href","https://map.kakao.com/link/to/${vo.name},"+result[0].y+","+result[0].x)
										        
												$('.div-map').hide();
										    } 
										});
										
										</script>
		                    		</div>
		                    	</div>
                   			</c:if>
                    	</div>
                        <div class="row mb-5">
                        	<c:if test="${vo.introduction != null }">
	                            <h4 class="mb-3">기업 소개</h4>
	                            <pre style="white-space: pre-line;">${vo.introduction }</pre>
                        	</c:if>
                        	<c:if test="${vo.history != null }">
	                            <h4 class="mb-3">연혁</h4>
	                            <table class="table">
	                            	<tr><td colspan="2"></td></tr>
	                            	<c:forEach var="history" items="${hList }" varStatus="i">
                            			<tr>
		                            		<c:forEach var="year" items="${yList }" varStatus="j">
	                            				<c:if test="${cList[j.index]==i.index }">
	                            					<td rowspan="${cList[j.index+1]==null?hList.size()-cList[j.index]:cList[j.index+1]-cList[j.index] }" width="10%">
	                            						<i class="fa fa-angle-right text-primary me-2"></i>${year }
	                            					</td>
	                            				</c:if>
		                            		</c:forEach>
	                           				<td width="90%">
	                           					${history }
	                           				</td>
                            			</tr>
	                            	</c:forEach>
	                            </table>
                        	</c:if>
                        	<c:if test="${wList[0] != null }">
	                            <h4 class="mb-3">복지</h4>
	                            <div class="row">
	                            <c:forEach var="tag" items="${wTag }" varStatus="i">
	                            	<div class="col-lg-3">
	                            		<h6><i class="bi-${icons[i.index]} text-primary me-2"></i>${tag.name }</h6>
	                            		<ul>
	                            			<c:forEach var="vo" items="${wList }">
	                            				<c:if test="${i.index+1==vo.wno2 }">
			                            			<li>${vo.name }</li>
	                            				</c:if>
	                            			</c:forEach>
	                            		</ul>
	                            	</div>
	                            </c:forEach>
	                            </div>
                        	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Job Detail End -->
        
>>>>>>> branch 'main' of https://github.com/JsfirstProjcet/Job_Project.git
</body>
</html>