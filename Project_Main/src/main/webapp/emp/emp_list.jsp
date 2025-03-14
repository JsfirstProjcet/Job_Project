<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
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
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Job Listing</h1>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == 'all'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=all">
                                <h6 class="mt-n1 mb-0">전체</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == '정규직'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=정규직">
                                <h6 class="mt-n1 mb-0">정규직</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == '계약직'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=계약직">
                                <h6 class="mt-n1 mb-0">계약직</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == '파견직'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=파견직">
                                <h6 class="mt-n1 mb-0">파견직</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == '프리랜서'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=프리랜서">
                                <h6 class="mt-n1 mb-0">프리랜서</h6>
                            </a>
                        </li>                      
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == '교육생'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=교육생">
                                <h6 class="mt-n1 mb-0">교육생</h6>
                            </a>
                        </li>                      
                         <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 
                                <c:choose>
                                    <c:when test="${tab == '아르바이트'}">active</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>"
                                 href="?tab=아르바이트">
                                <h6 class="mt-n1 mb-0">아르바이트</h6>
                            </a>
                        </li>                      
                    </ul>
                    <div class="tab-content">
                        <div id="tab-all" class="tab-pane fade show p-0 active">
                          <c:forEach var="vo" items="${list }">                         
                            <c:choose>
                            	<c:when test="${tab == 'all' || fn:contains(vo.emp_type, tab)}">
                            		<div class="job-item p-4 mb-4">
		                                <div class="row g-4">
		                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
		                                      <a href="../emp/emp_detail_before.do?eno=${vo.eno }">
		                                      </a>
		                                        <div class="text-start ps-4">
		                                            <h5 class="mb-3">${vo.title }</h5>
		                                            <span class="text-truncate me-3"><i class="far fa-building text-primary me-2"></i>${vo.name }</span>
		                                            <span class="text-truncate me-3"><i class="far fa-heart text-danger me-2"></i>${vo.fo_count }</span>
		                                            <span class="text-truncate me-3"><i class="fas fa-user-tie text-primary me-2"></i>${vo.se_count }</span>
		                                            <span class="text-truncate me-0"><i class="fas fa-project-diagram text-primary me-2"></i>${vo.emp_type }</span>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
		                                        <div class="d-flex mb-3">
		                                            <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
		                                            <a class="btn btn-primary" href="">Recruit</a>
		                                        </div>
		                                        <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>등록일 : ${vo.regdate }</small>
		                                        <small class="text-truncate"><i class="far fa-calendar-times text-primary me-2"></i>마감일 : ${vo.deadline }</small>
			                                    </div>
			                                </div>
			                            </div>
									</c:when>
								</c:choose>
		                    </c:forEach>
                            <a class="btn btn-primary py-3 px-5" href="">Browse More Jobs</a>
                        </div>
                      </div>
                </div>
            </div>
        </div>
        <!-- Jobs End -->
</body>
</html>