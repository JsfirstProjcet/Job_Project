<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var IMP = window.IMP; 
IMP.init("imp01575674"); 
function requestPay() {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: "채용연계 상품",
        amount: 39800,         // 숫자 타입
        buyer_email: "json.email",
        buyer_name: "json.name",
        buyer_tel: "json.phone",
        buyer_addr: "json.address",
        buyer_postcode: "json.post"
    }, function (rsp) { // callback
    	
     });
}
</script>
<script>

  function copyurl() {
    const url = window.location.href;

    navigator.clipboard.writeText(url)
      .then(() => {
        alert('링크가 복사되었습니다!');
      })
  }
  
  function replyclear(){
	  document.getElementById('replytext').value="";
  }

</script>
</head>
<body>
	<div class="container my-5" style="max-width: 800px;">

		<!-- 해시태그와 드롭다운 -->
		<div class="d-flex align-items-center mb-2">
			<!-- 왼쪽 PICK 배지 -->
			<span class="badge bg-success">PICK</span>

			<!-- 드롭다운 버튼 (오른쪽 정렬) -->
			<div class="dropdown ms-auto">
				<button class="btn btn-sm btn-outline-secondary dropdown-toggle"
					type="button" id="reportDropdown" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fas fa-ellipsis-v"></i>
				</button>
				<c:choose>
					<c:when test="${sessionScope.id!=null and sessionScope.id==vo.id}">

						<ul class="dropdown-menu dropdown-menu-end "
							aria-labelledby="reportDropdown">
							<li><a href="../interview/commune_update.do?bno=${vo.bno }"
								class="dropdown-item">게시글 수정</a></li>
							<li><a href="../interview/commune_delete.do?bno=${vo.bno }"
								class="dropdown-item">게시글 삭제</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu dropdown-menu-end "
							aria-labelledby="reportDropdown">
							<li><a href="javascript:void(0);"
								onclick="alert('작성자만 수정 가능합니다.');" class="dropdown-item">게시글
									수정</a></li>
							<li><a href="javascript:void(0);"
								onclick="alert('작성자만 삭제 가능합니다.');" class="dropdown-item">게시글
									삭제</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<!-- 제목 -->
		<h3 class="fw-bold mb-3">${vo.subject }</h3>



		<!-- 작성 정보 -->
		<div class="text-muted mb-4">
			<small>작성 ${vo.dbday } | 조회수 ${vo.hit }</small>
		</div>

		<!-- 본문 내용 -->
		<p class="mb-4">${vo.content }</p>

		<!-- 해시태그 리스트 -->
		<div class="mb-4 d-flex flex-wrap gap-2">
			<c:forEach var="tag" items="${hash}">
				<span
					class="border border-primary text-primary rounded px-3 py-1 small">
					${tag} </span>
			</c:forEach>

		</div>

		<!-- 버튼 -->
		<div class="d-flex mb-4">
			<button class="btn btn-outline-secondary me-2 rounded-pill">
				<i class="far fa-thumbs-up"></i> 좋아요 1
			</button>
			<button class="btn btn-outline-secondary me-2 rounded-pill">
				<i class="far fa-bookmark"></i> 북마크
			</button>
			<button class="btn btn-outline-secondary me-2 rounded-pill">
				<i class="far fa-heart"></i> 찜하기
			</button>

			<a href="../interview/commune.do"
				class="btn btn-outline-primary ms-auto rounded-pill"> <i
				class="fas fa-list"></i> 목록으로
			</a>
		</div>


		<!-- 작성자 정보 -->
		<div class="card p-3 mb-4">
			<div class="d-flex align-items-center">
				<img src="../img/${pvo.poster}" alt="프로필 이미지"
					class="rounded-circle me-3" width="50" height="50">
				<div class="flex-grow-1">
					<div class="fw-bold">${vo.nickname }</div>
					<div class="text-muted small">상품기획·MD 2년차</div>
				</div>
				<button class="btn btn-outline-primary btn-sm me-2">팔로우</button>
				<button class="btn btn-outline-secondary btn-sm">프로필 보기</button>
			</div>
		</div>

		<!-- 공유하기 -->
		<div class="text-end mb-4">
			<button class="btn btn-outline-secondary btn-sm" onclick="copyurl()">
				<i class="fas fa-share"></i> 공유하기
			</button>
		</div>

		<!-- 하단 영역 -->
		<div class="p-4 rounded text-center"
			style="background: url('../img/vip.png') center/cover no-repeat; height: 170px; display: flex; flex-direction: column; justify-content: flex-start; align-items: center;">


			<a href="#" class="btn btn-danger" onclick="requestPay()" style="margin-top: auto;">
				지금 구매하기 </a>
		</div>
	</div>

	<!-- 댓글 영역 시작 -->
	<div class="container my-5" style="max-width: 800px;">

		<!-- 댓글 제목 -->
		<h5 class="fw-bold mb-4">
			댓글 <span class="text-primary">${count }</span>
		</h5>


		<!-- 댓글 입력 폼 -->
		<form action="../reply/reply_insert.do" method="post">
			<div class="card p-4 mb-4">
				<div class="d-flex align-items-center mb-3">
					<!-- 로그인 되어있으면 이미지 출력함 -->
					<c:if test="${sessionScope.id!=null }">
						<img src="../img/${poster }" alt="프로필" class="rounded-circle me-2"
							width="50" height="50">
						<span class="fw-bold text-primary" id=nickname>${sessionScope.name}님</span>
						<span class="ms-1">, 따뜻한 댓글을 남겨주세요 :)</span>
					</c:if>
					<c:if test="${sessionScope.id==null }">
						<span class="ms-1">따뜻한 댓글을 남겨주세요 :)</span>
					</c:if>
				</div>
				<textarea class="form-control mb-2" rows="5"
					placeholder="댓글을 입력해주세요 :)" id="replytext" name="msg"></textarea>
				<input type="hidden" name="bno" value="${vo.bno}"> <input
					type="hidden" name="nickname" value="${sessionScope.name}">
				<input type="hidden" name="poster" value="${poster}">
				<div class="d-flex justify-content-between align-items-center">
					<small class="text-muted">0/5000자</small>
					<div>
						<button type="button" class="btn btn-light btn-sm me-2"
							onclick="replyclear()">취소</button>


						<!-- 로그인 되어야만 댓글쓸수있음 -->
						<c:if test="${sessionScope.id!=null }">
							<button type="submit" class="btn btn-primary btn-sm">등록</button>
						</c:if>
						<c:if test="${sessionScope.id==null }">
							<a href="javascript:void(0);" onclick="alert('로그인이 필요합니다!');"
								class="btn btn-primary btn-sm">등록</a>
						</c:if>

					</div>
				</div>
			</div>
		</form>


		<!-- 댓글 리스트 아이템 -->
		<c:forEach var="rvo" items="${rList}">
			<div class="card p-4 mb-3">
				<div class="d-flex mb-3 align-items-center">

					<img src="../img/${rvo.poster }" alt="댓글 작성자"
						class="rounded-circle me-2" width="50" height="50">
					<div>
						<div class="fw-bold">${rvo.nickname }
							<span class="badge bg-light text-secondary ms-1">주식회사루미루코리아</span>
						</div>
						<div class="text-muted small">인사(HR) 8년차 · ${rvo.dbday}</div>
					</div>

					<!-- 드롭다운 버튼 (오른쪽 정렬) -->
					<div class="dropdown ms-auto">
						<button class="btn btn-sm btn-outline-secondary dropdown-toggle"
							type="button" id="reportDropdown" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fas fa-ellipsis-v"></i>
						</button>
						<c:choose>
							<c:when
								test="${sessionScope.id!=null and sessionScope.id==rvo.id}">

								<ul class="dropdown-menu dropdown-menu-end "
									aria-labelledby="reportDropdown">
									<form action="../reply/reply_update.do" method="post">
										<li><input type="hidden" name="rno" value="${rvo.rno}">
											<input type="hidden" name="bno" value="${vo.bno}"> <input
											type="hidden" name="msg" value="${rvo.msg}">
											<button type="submit" class="dropdown-item">댓글 수정</button></li>
									</form>
									<li><a
										href="../reply/reply_delete.do?rno=${rvo.rno }&bno=${vo.bno}"
										class="dropdown-item">댓글 삭제</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="dropdown-menu dropdown-menu-end "
									aria-labelledby="reportDropdown">
									<li><a href="javascript:void(0);"
										onclick="alert('작성자만 수정 가능합니다.');" class="dropdown-item">댓글
											수정</a></li>
									<li><a href="javascript:void(0);"
										onclick="alert('작성자만 삭제 가능합니다.');" class="dropdown-item">댓글
											삭제</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>


				<div class="mb-3" style="white-space: pre-line;">${rvo.msg }</div>

				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex align-items-center">
						<button class="btn btn-sm btn-light me-2">
							<i class="far fa-thumbs-up"></i> 좋아요 0
						</button>
						<button class="btn btn-sm btn-light">
							<i class="far fa-comment"></i> 답글 0
						</button>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	<!-- 댓글 영역 끝 -->
</body>
</html>