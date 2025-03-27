<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 목록</title>
<style>
p{
 width: 850px;
}
.abc {
    display: inline-block;
    max-width: 850px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    vertical-align: middle;
}
.pagination {
    display: flex;
    flex-wrap: nowrap;
    justify-content: center;
    align-items: center;
}

.pagination .page-item {
    white-space: nowrap;
}

.pagination .page-item a {
    padding: 5px 10px;
    font-size: 14px;
    width: auto;
}
</style>
</head>
<body>
  <!-- Header End -->
        <div class="container-xxl py-5 bg-dark page-header mb-5">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">자기소개서 샘플</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">자기소개서 샘플</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Header End -->
        <!-- Jobs Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">자기소개서 샘플 목록</h1>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    </ul>
                    
                    <c:forEach var="vo" items="${list }">
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="job-item p-4 mb-4">
                                <div class="row g-4">
                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid border rounded" src="https://${vo.poster }" alt="" style="width: 150px; height: 100px;">
                                        <div class="text-start ps-4">
                                            <h5 class="mb-3">${vo.title }</h5>
                                            <span class="text-truncate me-3"><span class="abc"><a href="../self/self_detail_before.do?sno=${vo.sno }">${vo.content }</a></span></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                        <div class="d-flex mb-3">
                                            <a class="btn btn-primary" href="../write/write_update.do?sno=${vo.sno }">작성해보기</a>
                                        </div>
                                        <small class="text-truncate"><i class="fa fa-eye text-primary me-2"></i>조회수: ${vo.hit }</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        </c:forEach>
                        <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                 <li class="page-item">
                                    <a class="page-link" href="../self/self_list.do?page=${startPage-1 }">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                 </li>
                                </c:if>
                                
                                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                 <li class="page-item ${i==curpage?'active':'' }"><a class="page-link" href="../self/self_list.do?page=${i }">${i }</a></li>
                                </c:forEach>
                                
                                <c:if test="${endPage<totalpage }">
                                 <li class="page-item">
                                    <a class="page-link" href="../self/self_list.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                 
                                 </li>
                                 
                                </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curpage } of ${totalpage } results</p>
                        </div>
                    </div>
                </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                        </div>
                    </div>
                </div>
            </div>

        <!-- Jobs End -->

</body>
</html>