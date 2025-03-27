<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <title></title>
    <script type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<div class="container my-5" style="max-width: 800px;">
    <div class="d-flex justify-content-between align-items-center mb-2">
        <c:if test="${svo.visible == 1 }">
            <span class="badge bg-success">공개</span>
        </c:if>
        <c:if test="${svo.visible == 0 }">
            <span class="badge bg-success">비공개</span>
        </c:if>
        <c:if test="${sessionScope.id == svo.pid }">
            <button type="button"
                    onclick="deleteQuestion()"
                    class="btn btn-sm btn-outline-secondary">
                삭제
            </button>
        </c:if>
    </div>

    <!-- 제목 -->
    <h3 class="fw-bold mb-3">${svo.qtitle }</h3>
    <!-- 작성 정보 -->
    <div class="text-muted mb-4">
        <small>작성 ${svo.qdate }</small>
    </div>
    <!-- 본문 내용 -->
    <p class="mb-4">${svo.qcontent }</p>
    <!-- 작성자 정보 -->
    <div class="card p-3 mb-4">
        <div class="d-flex align-items-center">
            <c:if test="${!uvo.poster}">
                <div class="flex animate-pulse space-x-4">
                    <div class="size-10 mr-4 rounded-full bg-gray-200"></div>
                </div>
            </c:if>
            <c:if test="${uvo.poster}">
                <img src="../img/${uvo.poster}" alt="profile"
                     class="rounded-circle me-3" width="50" height="50">
            </c:if>
            <div class="flex-grow-1">
                <div class="fw-bold">${uvo.nickname }</div>
                <c:if test="${uvo.isadmin == 1}">
                    <div class="text-muted small">관리자</div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- 하단 광고 영역 -->
    <div class="p-4 rounded text-center"
         style="background: url('../img/vip.png') center/cover no-repeat; height: 170px; display: flex; flex-direction: column; justify-content: flex-start; align-items: center;">
        <a href="#" class="btn btn-danger" onclick="requestPay()"
           style="margin-top: auto;"> 지금 구매하기 </a>
    </div>
</div>

<!-- 답변 -->
<c:if test="${svo.ok == 1}">
    <div class="container my-5" style="max-width: 800px;">
        <span class="badge bg-success my-2">
        답변
        </span>
        <!-- 제목 -->
        <h3 class="fw-bold my-2">${svo.atitle }</h3>
        <!-- 작성 정보 -->
        <div class="text-muted my-2">
            <small>작성 ${svo.adate }</small>
        </div>
        <!-- 본문 내용 -->
        <p class="mt-4 mb-12">${svo.acontent }</p>
    </div>
</c:if>
</body>
<script>
  const deleteQuestion = () => {
    if (confirm("정말 삭제하시겠습니까?")) {
      fetch('/service/delete.do?id=${svo.id }', {method: 'get'});
      alert("삭제되었습니다!")
      setInterval(() => {
        location.href = "/service/main.do"
      }, 2000)
    }
  }
</script>