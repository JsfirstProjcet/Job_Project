<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div id="emp_list">
	    <c:choose>
	        <c:when test="${empty eList}">
	            <p>검색된 공고가 없습니다.</p>
	        </c:when>
	        <c:otherwise>
	            <c:forEach var="vo" items="${eList}">
	                <div class="job-item p-4 mb-4">
	                    <div class="row g-4">
	                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
	                            <div class="text-start ps-4">
	                                <h5 class="mb-3">
	                                    <a href="../emp/emp_detail.do?no=${vo.eno}" class="text-decoration-none text-dark">${vo.title}</a>
	                                </h5>
	                                <span class="text-truncate me-3"><i class="far fa-building text-primary me-2"></i>${vo.name}</span>
	                                <span class="text-truncate me-3"><i class="far fa-heart text-danger me-2"></i>${vo.fo_count}</span>
	                                <span class="text-truncate me-3"><i class="fas fa-user-tie text-primary me-2"></i>${vo.se_count}</span>
	                                <span class="text-truncate me-3"><i class="fas fa-project-diagram text-primary me-2"></i>${vo.emp_type}</span>
	                                <span class="text-truncate me-0"><i class="fas fa-suitcase text-primary me-2"></i>${vo.loc}</span>
	                            </div>
	                        </div>
	                        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
	                            <div class="d-flex mb-3">
	                                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
	                                <a class="btn btn-primary" href="../emp/emp_detail.do?no=${vo.eno}">Detail</a>
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
	</div>
</body>
</html>