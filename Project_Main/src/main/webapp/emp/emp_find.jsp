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
</head>
<body>
  <!-- Jobs Start -->
  <div class="container-xxl py-5">
      <div class="container">
          <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Employment Listing</h1>
          <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
	<form action="emp_find.do" method="get">
      <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
         <div class="container">
             <div class="row g-2">
                 <div class="col-md-10">
                     <div class="row g-2">
                         <div class="col-md-4">
							<input type="text" class="form-control border-0" name="keyword" value="${param.keyword}" placeholder="Keyword" />
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0" name="jno">
                                 <option value="">직업별</option>
                                 <option value="16" ${param.jno == '16' ? 'selected' : ''}>기획·전략</option>
                                 <option value="14" ${param.jno == '14' ? 'selected' : ''}>마케팅·홍보·조사</option>
                                 <option value="3" ${param.jno == '3' ? 'selected' : ''}>회계·세무·재무</option>
                                 <option value="5" ${param.jno == '5' ? 'selected' : ''}>인사·노무·HRD</option>
                                 <option value="4" ${param.jno == '4' ? 'selected' : ''}>총무·법무·사무</option>
                                 <option value="2" ${param.jno == '2' ? 'selected' : ''}>IT개발·데이터</option>
                                 <option value="15" ${param.jno == '15' ? 'selected' : ''}>디자인</option>
                                 <option value="8" ${param.jno == '8' ? 'selected' : ''}>영업·판매·무역</option>
                                 <option value="21" ${param.jno == '21' ? 'selected' : ''}>고객상담·TM</option>
                                 <option value="18" ${param.jno == '18' ? 'selected' : ''}>구매·자재·물류</option>
                                 <option value="12" ${param.jno == '12' ? 'selected' : ''}>상품기획·MD</option>
                                 <option value="7" ${param.jno == '7' ? 'selected' : ''}>운전·운송·배송</option>
                                 <option value="10" ${param.jno == '10' ? 'selected' : ''}>서비스</option>
                                 <option value="11" ${param.jno == '11' ? 'selected' : ''}>생산</option>
                                 <option value="22" ${param.jno == '22' ? 'selected' : ''}>건설·건축</option>
                                 <option value="6" ${param.jno == '6' ? 'selected' : ''}>의료</option>
                                 <option value="9" ${param.jno == '9' ? 'selected' : ''}>연구·R&D</option>
                                 <option value="19" ${param.jno == '19' ? 'selected' : ''}>교육</option>
                                 <option value="13" ${param.jno == '13' ? 'selected' : ''}>미디어·문화·스포츠</option>
                                 <option value="17" ${param.jno == '17' ? 'selected' : ''}>금융·보험</option>
                                 <option value="20" ${param.jno == '20' ? 'selected' : ''}>공공·복지</option>
                             </select>
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0" name="loc">
                                 <option value="">지역별</option>
                                 <option value="18" ${param.loc == '18' ? 'selected' : ''}>전국</option>
                                 <option value="1" ${param.loc == '1' ? 'selected' : ''}>서울</option>
                                 <option value="2" ${param.loc == '2' ? 'selected' : ''}>경기</option>
                                 <option value="3" ${param.loc == '3' ? 'selected' : ''}>광주</option>
                                 <option value="4" ${param.loc == '4' ? 'selected' : ''}>대구</option>
                                 <option value="5" ${param.loc == '5' ? 'selected' : ''}>대전</option>
                                 <option value="6" ${param.loc == '6' ? 'selected' : ''}>부산</option>
                                 <option value="7" ${param.loc == '7' ? 'selected' : ''}>울산</option>
                                 <option value="8" ${param.loc == '8' ? 'selected' : ''}>인천</option>
                                 <option value="9" ${param.loc == '9' ? 'selected' : ''}>강원</option>
                                 <option value="10" ${param.loc == '10' ? 'selected' : ''}>경남</option>
                                 <option value="11" ${param.loc == '11' ? 'selected' : ''}>경북</option>
                                 <option value="12" ${param.loc == '12' ? 'selected' : ''}>전남</option>
                                 <option value="13" ${param.loc == '13' ? 'selected' : ''}>전북</option>
                                 <option value="14" ${param.loc == '14' ? 'selected' : ''}>충북</option>
                                 <option value="15" ${param.loc == '15' ? 'selected' : ''}>충남</option>
                                 <option value="16" ${param.loc == '16' ? 'selected' : ''}>제주</option>
                                 <option value="17" ${param.loc == '17' ? 'selected' : ''}>세종</option>
                                 <option value="19" ${param.loc == '19' ? 'selected' : ''}>해외</option>
                                 <option value="20" ${param.loc == '20' ? 'selected' : ''}>기타</option>
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
		                                        <div class="text-start ps-4">
		                                            <h5 class="mb-3">
												        <a href="../emp/emp_detail.do?no=${vo.eno }" class="text-decoration-none text-dark">${vo.title }</a>
												    </h5>
		                                            <span class="text-truncate me-3"><i class="far fa-building text-primary me-2"></i>${vo.name }</span>
		                                            <span class="text-truncate me-3"><i class="far fa-heart text-danger me-2"></i>${vo.fo_count }</span>
		                                            <span class="text-truncate me-3"><i class="fas fa-user-tie text-primary me-2"></i>${vo.se_count }</span>
		                                            <span class="text-truncate me-0"><i class="fas fa-project-diagram text-primary me-2"></i>${vo.emp_type }</span>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
		                                        <div class="d-flex mb-3">
 	                                            	<a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
		                                            <a class="btn btn-primary" href="../emp/emp_detail.do?no=${vo.eno }">Detail</a>
		                                        </div>
		                                        <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>등록일 : 
													<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" />
												</small>
		                                        <small class="text-truncate"><i class="far fa-calendar-times text-primary me-2"></i>마감일 : 
													<fmt:formatDate value="${vo.deadline}" pattern="yyyy-MM-dd" />
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
                                        <a class="page-link" href="../emp/emp_find.do?page=${startPage - 1}&keyword=${param.keyword}&loc=${param.loc}&jno=${param.jno}">
                                            <i class="fa fa-angle-double-left" aria-hidden="true"></i>이전
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <li class="page-item ${i == curpage ? 'current' : ''}">
                                        <a class="page-link" href="../emp/emp_find.do?page=${i}&keyword=${param.keyword}&loc=${param.loc}&jno=${param.jno}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${endPage < totalpage}">
                                    <li class="page-item">
                                        <a class="page-link" href="../emp/emp_find.do?page=${endPage + 1}&keyword=${param.keyword}&loc=${param.loc}&jno=${param.jno}">
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
 <!-- Jobs End -->
</body>
</html>