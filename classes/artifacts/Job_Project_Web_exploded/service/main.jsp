<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <title></title>
    <style type="text/css">
      .pagination {
        display: block;
        width: 100%;
        text-align: center;
        clear: both;
        color: #8EC837;
      }

      .pagination .page-link:hover {
        background-color: #8EC837;
        color: white;
        border: 1px solid gray;
      }

      .pagination li {
        display: inline-block;
        margin: 0 2px 0 0;
      }

      .pagination li:last-child {
        margin-right: 0;
      }

      .pagination .page-link, .pagination strong {
        display: block;
        padding: 8px 11px;
        border: 1px solid gray;
        background-clip: padding-box;
        font-weight: normal;
      }

      .mb-3 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    </style>
</head>
<body>
<div class="container-xxl bg-white p-0">
    <div class="container-xxl py-5">
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">
                게시글
            </h1>
            <div class="tab-class text-center wow fadeInUp"
                 data-wow-delay="0.3s">
                <div class="text-end" style="margin-right: 200px; margin-bottom: 30px;">
                    <c:if test="${sessionScope.id!=null }">
                        <a class="btn btn-primary py-3 px-5"
                           href="/service/write.do?id=${sessionScope.id}">
                            새글 작성
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.id==null }">
                        <a href="#"
                           onclick="alert('로그인이 필요합니다!')"
                           class="btn btn-primary py-3 px-5">
                            새글 작성
                        </a>
                    </c:if>
                </div>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <c:forEach var="v" items="${vo}">
                            <div class="job-item p-4 mb-4"
                                 style="max-width: 900px; margin: 0 auto;">
                                <div>
                                    <div class="d-flex align-items-center">
                                        <div class="text-start ps-4" style="flex-grow: 1;">
                                            <a href="/service/detail.do?page=${cur}&id=${v.id}">
                                                <h5 class="mb-3">
                                                        ${v.qtitle }
                                                </h5>
                                                <p class="mb-3" style="color:gray;">
                                                        ${v.qcontent }
                                                </p>
                                            </a>
                                            <div class="d-flex align-items-center justify-content-start mt-2">
                                                <div class="d-flex">
                                                    <span class="text-truncate me-3">
                                                        <i class="fa fa-map-marker-alt text-primary me-2"></i>
														${v.id}
														</span>
                                                    <span class="text-truncate me-0">
                                                        <i class="far fa-calendar-alt text-primary me-2"></i>
														${v.qdate}
														</span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Jobs End -->
    <nav class="pagination">
        <ul>
            <c:if test="${start>1 }">
                <li>
                    <a class="page-link" href="/service/main.do?page=${start-1 }">
                        <i class="fa fa-angle-double-left" aria-hidden="true"></i>
                        이전
                    </a>
                </li>
            </c:if>
            <c:forEach var="i" begin="${start }" end="${end }">
                <li class="${i==curpage?'current':'' }">
                    <a class="page-link"
                       href="/service/main.do?page=${i }">
                            ${i }
                    </a>
                </li>
            </c:forEach>
            <c:if test="${end<total }">
                <li class="page-item">
                    <a class="page-link" href="service/main.do?page=${end+1 }">
                        다음
                        <i class="fa fa-angle-double-right" aria-hidden="true"></i>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
</body>
<script>
  const notLogin = () => {

  }
</script>