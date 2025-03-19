<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function copyurl() {
    const url = window.location.href;

    navigator.clipboard.writeText(url)
      .then(() => {
        alert('링크가 복사되었습니다!');
      })
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
    <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="reportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
      <i class="fas fa-ellipsis-v"></i>
    </button>
	<c:if test="${sessionScope.id!=null and sessionScope.id==vo.id}">
	    <ul class="dropdown-menu dropdown-menu-end " aria-labelledby="reportDropdown">
	      <li><a href="../interview/commune_update.do?bno=${vo.bno }" class="dropdown-item" >게시글 수정</a></li>
	      <li><a href="../interview/commune_delete.do?bno=${vo.bno }" class="dropdown-item">게시글 삭제</a></li>
	    </ul>
    </c:if>
	              	 
  </div>
</div>

  <!-- 제목 -->
  <h3 class="fw-bold mb-3">${vo.subject }</h3>

	

  <!-- 작성 정보 -->
  <div class="text-muted mb-4">
    <small>작성 ${vo.dbday } | 조회수 ${vo.hit }</small>
  </div>

  <!-- 본문 내용 -->
  <p class="mb-4">${vo.content }  </p>

  <!-- 해시태그 리스트 -->
 <div class="mb-4 d-flex flex-wrap gap-2">
  <c:forEach var="tag" items="${hash}">
    <span class="border border-primary text-primary rounded px-3 py-1 small">
      ${tag}
    </span>
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
	
	  <button class="btn btn-outline-secondary me-2 rounded-pill">
	    <i class="far fa-calendar-alt"></i> 예약하기
	  </button>
	    <a href="../interview/commune.do" class="btn btn-outline-primary ms-auto rounded-pill">
		  <i class="fas fa-list"></i> 목록으로
		</a>
  </div>
  

  <!-- 작성자 정보 -->
  <div class="card p-3 mb-4">
    <div class="d-flex align-items-center">
      <img src="../img/man.png" alt="프로필 이미지" class="rounded-circle me-3" width="50" height="50">
      <div class="flex-grow-1">
        <div class="fw-bold">JVHYUR</div>
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
  <div class="bg-light p-4 rounded text-center">
    <h5 class="fw-bold mb-2">고민이 연결되고 해결되는 공간</h5>
    <a href="#" class="btn btn-primary">새로워진 커리어피드</a>
  </div>
</div>

<!-- 댓글 영역 시작 -->
<div class="container my-5" style="max-width: 800px;">

  <!-- 댓글 제목 -->
  <h5 class="fw-bold mb-4">댓글 <span class="text-primary">5</span></h5>

  <!-- 댓글 입력 폼 -->
  <div class="card p-4 mb-4">
    <div class="d-flex align-items-center mb-3">
      <img src="../img/woman.png" alt="프로필" class="rounded-circle me-2"  width="50" height="50">
      <span class="fw-bold text-primary">우기99님</span><span class="ms-1">, 따뜻한 댓글을 남겨주세요 :)</span>
    </div>
    <textarea class="form-control mb-2" rows="5" placeholder="댓글을 입력해주세요 :)"></textarea>
    <div class="d-flex justify-content-between align-items-center">
      <small class="text-muted">0/5000자</small>
      <div>
        <button class="btn btn-light btn-sm me-2">취소</button>
        <button class="btn btn-primary btn-sm">등록</button>
      </div>
    </div>
  </div>

  <!-- 댓글 리스트 아이템 -->
  <div class="card p-4 mb-3">
    <div class="d-flex mb-3 align-items-center">
      <img src="../img/woman.png" alt="댓글 작성자" class="rounded-circle me-2" width="50" height="50">
      <div>
        <div class="fw-bold">HR백풍원 <span class="badge bg-light text-secondary ms-1">주식회사루미루코리아</span></div>
        <div class="text-muted small">인사(HR) 8년차 · 6시간 전</div>
      </div>
    </div>

    <div class="mb-3" style="white-space: pre-line;">
      안녕하세요~ 사람인 공식 멘토이자 인사담당자 9년차 경험을 가지고 있는 HR백풍원 입니다~  
      인원이 적으면 잘못 채용한 사람 하나만 잘못 들어올 경우 내부 분위기를 해치는 데 있어서  
      상당히 리스크가 큽니다.  
      면접보시면 정말 다양한 수단을 통해서 면접자를 걸러내게 되긴 하는데  
      솔직히 합하면 이렇게 해도 사람 속은 모르죠
    </div>

    <div class="d-flex justify-content-between align-items-center">
      <div class="d-flex align-items-center">
        <button class="btn btn-sm btn-light me-2">
          <i class="far fa-thumbs-up"></i> 좋아요 0
        </button>
        <button class="btn btn-sm btn-light">
          <i class="far fa-comment"></i> 답글 0
        </button>
      </div>
      <button class="btn btn-outline-primary btn-sm">멘토링 신청</button>
    </div>
  </div>

</div>
<!-- 댓글 영역 끝 -->
</body>
</html>