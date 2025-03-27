<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JobEntry - Job Portal Website Template</title>
<link rel="stylesheet" href="../interview/map.css">

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
						<div class="row g-5 align-items-center" style="width: 1300px;">
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



			</div>
		</c:when>
		<c:otherwise>
			<!-- pastimg 출력 이전양식임 -->

			<div class="container-xxl bg-white p-0">
				<!-- About Start -->
				<div class="container-xxl py-5">
					<div class="container">
						<div class="row g-5 align-items-center">
							<div class="col-lg-7 mx-auto wow fadeIn" data-wow-delay="0.1s">
								<h3 class="detail_top" style="margin-top: 70px;">[
									${vo.company} ]&nbsp;${vo.name }</h3>
								<hr style="border: 0; height: 1px; background-color: #000;">
								<c:forEach var="img" items="${pastimg }">
									<img class="../img-fluid w-100" src="${img }"
										style="margin-top: 20px; border: 1px solid gray">
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>



		</c:otherwise>
	</c:choose>
	<!-- 카카오지도 -->
	<div>
			<div class="map_wrap" style="width: 800px; margin: 0 auto;">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;" ></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="${vo.company}" id="keyword" size="15">

							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0776a8d199dc3f39cb4a1c340a565fcc&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>

</body>
</html>