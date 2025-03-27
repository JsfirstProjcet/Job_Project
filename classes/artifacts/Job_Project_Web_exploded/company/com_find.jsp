<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 목록</title>
<style type="text/css">
.pagination .current .page-link {
    background-color: #28a745;
    color: white; 
    font-weight: bold; 
}

.pagination .page-item:hover .page-link {
    background-color: #f1f1f1; 
    color: #28a745;
}
</style>
</head>
<body>
  <div class="container-xxl py-5">
    <div class="container">
      <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Employment Listing</h1>
       <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
		<form action="com_find.do" method="get">
	      <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
	         <div class="container">
	             <div class="row g-2">
	                 <div class="col-md-10">
	                     <div class="row g-2">
	                         <div class="col-md-4">
								<input type="text" class="form-control border-0" name="keyword" value="${param.keyword}" placeholder="Keyword" />
	                         </div>
	                         <div class="col-md-4">
	                             <select class="form-select border-0" name="c_type">
	                                 <option value="">기업형태별</option>
	                                 <option value="1000대기업" ${param.c_type == '1000대기업' ? 'selected' : ''}>1000대기업</option>
	                                 <option value="대기업" ${param.c_type == '대기업' ? 'selected' : ''}>대기업</option>
	                                 <option value="중견기업" ${param.c_type == '중견기업' ? 'selected' : ''}>중견기업</option>
	                                 <option value="중소기업" ${param.c_type == '중소기업' ? 'selected' : ''}>중소기업</option>
	                                 <option value="스타트업" ${param.c_type == '스타트업' ? 'selected' : ''}>스타트업</option>
	                                 <option value="기타" ${param.c_type == '기타' ? 'selected' : ''}>기타</option>
	                             </select>
	                         </div>
	                         <div class="col-md-4">
	                             <select class="form-select border-0" name="address">
	                                 <option value="">지역별</option>
	                                 <option value="서울" ${param.address == '서울' ? 'selected' : ''}>서울</option>
	                                 <option value="경기" ${param.address == '경기' ? 'selected' : ''}>경기</option>
	                                 <option value="광주" ${param.address == '광주' ? 'selected' : ''}>광주</option>
	                                 <option value="대구" ${param.address == '대구' ? 'selected' : ''}>대구</option>
	                                 <option value="대전" ${param.address == '대전' ? 'selected' : ''}>대전</option>
	                                 <option value="부산" ${param.address == '부산' ? 'selected' : ''}>부산</option>
	                                 <option value="울산" ${param.address == '울산' ? 'selected' : ''}>울산</option>
	                                 <option value="인천" ${param.address == '인천' ? 'selected' : ''}>인천</option>
	                                 <option value="강원" ${param.address == '강원' ? 'selected' : ''}>강원</option>
	                                 <option value="경남" ${param.address == '경남' ? 'selected' : ''}>경남</option>
	                                 <option value="경북" ${param.address == '경북' ? 'selected' : ''}>경북</option>
	                                 <option value="전남" ${param.address == '전남' ? 'selected' : ''}>전남</option>
	                                 <option value="전북" ${param.address == '전북' ? 'selected' : ''}>전북</option>
	                                 <option value="충남" ${param.address == '충남' ? 'selected' : ''}>충남</option>
	                                 <option value="충북" ${param.address == '충북' ? 'selected' : ''}>충북</option>
	                                 <option value="제주" ${param.address == '제주' ? 'selected' : ''}>제주</option>
	                                 <option value="세종" ${param.address == '세종' ? 'selected' : ''}>세종</option>
	                             </select>
		                         </div>
		                     </div>
		                 </div>                 
		                 <div class="col-md-2">
		                     <button class="btn btn-dark border-0 w-100" type="submit">Search</button>
			                 </div>
			             </div>
			         </div>
			     </div>
			 </form>
	 
                    <div class="tab-content">
                        <div id="tab-all" class="tab-pane fade show p-0 active">
                            <c:choose>
                           	<c:when test="${empty list}">
                           		<p>검색된 공고가 없습니다.</p>
                           	</c:when>
                         	 <c:otherwise>
                        	   <c:forEach var="vo" items="${list }">                         
                           	 	<div class="job-item p-4 mb-4">
                                <div class="row g-4">
                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                      <a href="../company/com_detail_before.do?cno=${vo.cno }">
                                        <img class="flex-shrink-0 img-fluid border rounded" src="https://pds.saramin.co.kr/company${vo.poster }" alt="" style="width: 80px; height: 80px;">
                                      </a>
                                        <div class="text-start ps-4">
                                           <h5 class="mb-3">
									        <a href="../company/com_detail_before.do?cno=${vo.cno }" class="text-decoration-none text-dark">${vo.name }</a>
									    </h5>
                                            <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>대한민국, ${vo.address.substring(0,2) }</span>
                                            <span class="text-truncate me-3"><i class="far fa-star text-warning me-2"></i>${vo.fo_count }</span>
                                            <span class="text-truncate me-0"><i class="far fa-building text-primary me-2"></i>${vo.c_type }</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                        <div class="d-flex mb-3">
                                            <a class="btn btn-light btn-square me-3" href=""><i class="far fa-star text-primary"></i></a>
                                            <a class="btn btn-primary" href="../company/com_emp_list.do?cno=${vo.cno }">Recruit</a>
                                        </div>
                                        <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>설립일 :
										<fmt:formatDate value="${vo.estdate}" pattern="yyyy-MM-dd" />
                                        </small>
		                                    </div>
		                                </div>
		                           </div>
 		                    </c:forEach>
                          </c:otherwise>
						</c:choose>
							
                        <div class="page-status-container" style="display: flex; justify-content: space-between; align-items: center;">
                            <div class="page-status" style="text-align: left;">
                                <p>Page ${curpage} of ${totalpage} results</p>
                            </div>                                       
                            <ul class="pagination" style="text-align: right; margin: 0; order: -1;">
                                <c:if test="${startPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="../company/com_find.do?page=${startPage - 1}&keyword=${param.keyword}&c_type=${param.c_type}&address=${param.address}">
                                            <i class="fa fa-angle-double-left" aria-hidden="true"></i>이전
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <li class="page-item ${i == curpage ? 'current' : ''}">
                                        <a class="page-link" href="../company/com_find.do?page=${i}&keyword=${param.keyword}&c_type=${param.c_type}&address=${param.address}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${endPage < totalpage}">
                                    <li class="page-item">
                                        <a class="page-link" href="../company/com_find.do?page=${endPage + 1}&keyword=${param.keyword}&c_type=${param.c_type}&address=${param.address}">
                                            <i class="fa fa-angle-double-right" aria-hidden="true"></i>다음
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>