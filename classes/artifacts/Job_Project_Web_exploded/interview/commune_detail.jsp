<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
<!-- 댓글 수정버튼 클릭 시 동작 -->
<script type="text/javascript">
 let bClick=false
 
$(function(){
 	$('.updates').click(function(){
 	let rno=$(this).attr("data-rno")
 	$('.ups').hide()
 		if(bClick==false){
			$('#up'+rno).show()
			$(this).text("수정 취소")
			bClick=true
		}
 		else
		{			
			$('#up'+rno).hide()
			$(this).text("댓글 수정")
			bClick=false
    	}
 	
 	/* 취소 버튼 눌렀을때 사라지게 */
 	$('.replycancel').click(function(){
 		$('#up'+rno).hide()
 		$('.updates').text("댓글 수정")
 		bClick=false
    })
    
   })
   
})
 
 
</script>
<!-- 댓글 좋아요 -->
<script type="text/javascript">
$(function(){
	  $('.reply-like').click(function(){
	    let rno = $(this).data('rno')
	    let bno = $(this).data('bno')
		console.log(rno+"알엔오")
		console.log(bno+"비엔오")
	    $.ajax({
		      type: 'POST',
		      url: '../jjim/jjim_insert_ajax.do',
		      data: { bno: bno, rno:rno, type: 3 },
		      success: function(result) {
		        if (result === 'liked') {
		          alert('좋아요 완료!')
		          // 현재 숫자 가져옴
		          let countSpan = $('#like-count-' + rno);
		          let currentCount = parseInt(countSpan.text());

		          // 댓글 좋아요수 증가
		          countSpan.text(currentCount + 1);
		        } else if (result === 'unliked') {
		          alert('좋아요 취소됨!')
		     	  // 현재 숫자 가져옴
		          let countSpan = $('#like-count-' + rno);
		          let currentCount = parseInt(countSpan.text());

		          // 댓글 좋아요수 감소
		          countSpan.text(currentCount - 1);
		        } else if (result === 'nologin') {
		          alert('로그인 후 이용해주세요!')
		        }
		      },
		      error: function() {
		        alert('서버 오류 발생!')
		      }
		    })

	  })
	  
})
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
			<c:if test="${sessionScope.id!=null }">

				<!-- 좋아요 버튼 -->
				<c:if test="${jcount1==0 }">
					<button class="btn btn-outline-secondary me-2 rounded-pill"
						onclick="location.href='../jjim/jjim_insert.do?bno=${vo.bno }&type=1'">
						<i class="far fa-heart"></i> 좋아요
					</button>

				</c:if>
				<c:if test="${jcount1==1 }">

					<button class="btn btn-outline-secondary me-2 rounded-pill"
						onclick="location.href='../jjim/jjim_cancel.do?bno=${vo.bno}&type=1'">
						<i class="fas fa-heart text-danger"></i> 좋아요
					</button>
				</c:if>

				<!-- 찜하기 버튼 -->
				<c:if test="${jcount2 == 0}">
					<button class="btn btn-outline-secondary me-2 rounded-pill"
						onclick="location.href='../jjim/jjim_insert.do?bno=${vo.bno}&type=2'">
						<i class="far fa-star"></i> 찜하기
					</button>
				</c:if>
				<c:if test="${jcount2 == 1}">
					<button class="btn btn-outline-secondary me-2 rounded-pill"
						onclick="location.href='../jjim/jjim_cancel.do?bno=${vo.bno}&type=2'">
						<i class="fas fa-star text-warning"></i> 찜하기
					</button>
				</c:if>

			</c:if>

			<!-- 로그인 안했을때  -->
			<c:if test="${sessionScope.id==null }">
				<button class="btn btn-outline-secondary me-2 rounded-pill"
					onclick="alert('로그인 후 사용 가능합니다.')">
					<i class="far fa-heart"></i> 좋아요
				</button>

				<button class="btn btn-outline-secondary me-2 rounded-pill"
					onclick="alert('로그인 후 사용 가능합니다.')">
					<i class="far fa-heart"></i> 찜하기
				</button>
			</c:if>

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
				<!-- 공유하기 -->
				<button class="btn btn-outline-secondary btn-sm" onclick="copyurl()">
					<i class="fas fa-share"></i> 공유하기
				</button>
			</div>
		</div>



		<!-- 하단 영역 -->
		<div class="p-4 rounded text-center"
			style="background: url('../img/vip.png') center/cover no-repeat; height: 170px; display: flex; flex-direction: column; justify-content: flex-start; align-items: center;">


			<a href="#" class="btn btn-danger" onclick="requestPay()"
				style="margin-top: auto;"> 지금 구매하기 </a>
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
									<li>
										<button type="submit" class="dropdown-item updates"
											data-rno="${rvo.rno }">댓글 수정</button>
									</li>
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
				<!-- 댓글 내용표시 -->
				<div class="mb-3" style="white-space: pre-line;">${rvo.msg }</div>



				<!-- 댓글 수정 박스 표시 -->
				<div class="comment-form ups"
					style="display: none; text-align: right;" id="up${rvo.rno }">
					<form action="../reply/reply_update.do" method="post">
						<textarea class="form-control mb-2" rows="5" id="replytext"
							name="msg" id="msg">${rvo.msg }</textarea>
						<button type="button"
							class="btn btn-light btn-sm me-2 replycancel text-end">취소</button>
						<button type="submit" class="btn btn-primary btn-sm text-end">등록</button>
						<input type="hidden" name="rno" value="${rvo.rno}"> <input
							type="hidden" name="bno" value="${vo.bno}">
					</form>
				</div>

				<!-- 댓글 좋아요 ajax로  -->
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex align-items-center">
						<button class="btn btn-sm btn-light me-2 reply-like"
							data-bno="${vo.bno}" data-rno="${rvo.rno}">
							<i class="far fa-thumbs-up"></i> 좋아요 <span
								id="like-count-${rvo.rno}">${rvo.like_count}</span>
						</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- 댓글 영역 끝 -->
</body>
</html>