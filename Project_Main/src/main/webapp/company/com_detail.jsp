<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
})
</script>
</head>
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
                    		<c:if test="${vo.jo!=0 or vo.uk!=0 or vo.man!=0}">
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
                    	<div class="row mt-5">
                   			<c:if test="${vo.industry!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				업종
	                    			</div>
	                    			<div class="col-9">${vo.industry }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.representative!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				대표자명
	                    			</div>
	                    			<div class="col-9">${vo.representative }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.homepage!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				홈페이지
	                    			</div>
	                    			<div class="col-9">
		                    			<a href="${vo.homepage }" target="_blank">${vo.homepage }</a>
	                    			</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.bu_details!=null }">
	                    		<div class="row col-6 mt-3">
	                    			<div class="col-3">
	                    				사업내용
	                    			</div>
	                    			<div class="col-9">${vo.bu_details }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.address!=null }">
		                   		<div class="row col-6 mt-3">
		                   			<div class="col-3">
		                   				주소
		                   			</div>
		                   			<div class="col-9">
		                   				${vo.address }<br>
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
                        <div class="row mt-5 mb-5">
                        	<c:if test="${vo.introduction != null }">
                        		<hr>
	                            <h4 class="mb-3">기업 소개</h4>
	                            <pre style="white-space: pre-line;">${vo.introduction }</pre>
                        	</c:if>
                        	
                        	<c:if test="${yList.size()!=0 }">
                        		<hr>
	                            <h4 class="mb-3">연혁</h4>
								<table class="table">
									<c:forEach var="yvo" items="${yList }">
										<tr>
											<th class="text-center" width="15%" rowspan="${yvo.count }">
												<i class="fa fa-angle-right text-primary me-2"></i>${yvo.year }
											</th>
											<c:forEach var="hvo" items="${hList }">
												<c:if test="${hvo.year==yvo.year and hvo.month==yvo.month and hvo.step==1 }">
													<td class="text-center" width="10%" >
														${hvo.month }월
													</td>
													<td class="text-left" width="75%" >
														${hvo.content}
													</td>
												</c:if>
											</c:forEach>
										</tr>
										<c:forEach var="hvo" items="${hList }">
											<c:if test="${hvo.year==yvo.year and !(hvo.month==yvo.month and hvo.step==1) }">
												<tr>
													<td class="text-center" width="10%" >
														${hvo.month }월
													</td>
													<td class="text-left" width="75%" >
														${hvo.content}
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</table>
							</c:if>
                        	
                        	<c:if test="${wList[0] != null }">
                        		<hr>
	                            <h4 class="mb-3">복지</h4>
	                            <div class="row">
	                            <c:forEach var="tag" items="${wTag }" varStatus="i">
	                            	<div class="col-lg-3">
	                            		<h6><i class="bi-${icons[i.index]} text-primary me-2"></i>${tag.name }</h6>
	                            		<ul>
	                            			<c:forEach var="vo" items="${wList }">
	                            				<c:if test="${tag.wno==vo.wno2 }">
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
        
</body>
</html>