<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 404 Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
                        <c:if test="${sessionScope.cid==null }">
	                        <h1 class="mb-4">${msg }</h1>
	                        <a class="btn btn-primary py-3 px-5" href="../main/main.do">홈으로</a>
                        </c:if>
                        <c:if test="${sessionScope.cid!=null and sessionScope.state!=1 }">
	                        <h1 class="mb-4">${msg }</h1>
	                        <a class="btn btn-primary py-3 px-5" href="../main/main.do">홈으로</a>
                        </c:if>
                        <c:if test="${sessionScope.cid!=null and sessionScope.state==1 }">
	                        <h1 class="mb-4">${msg }</h1>
	                        <a class="btn btn-primary py-3 px-5" href="../company/com_insert.do">등록하기</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- 404 End -->
</body>
</html>