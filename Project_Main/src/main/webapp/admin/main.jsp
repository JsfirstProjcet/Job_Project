<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page errorPage="components/error/error.jsp" %>
<!DOCTYPE html>
<html lang="ko"
      class="w-full h-full max-w-screen max-h-screen overflow-hidden">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<jsp:include page="components/loading.jsp"/>
<div class="flex justify-start">
    <jsp:include page="components/sidebar.jsp"/>
    <div class="flex flex-col w-5/6 max-w-screen h-full max-h-screen text-center justify-center align-middle p-4">
        <c:choose>
            <c:when test="${size eq null}">
                <jsp:include page="components/error/noresult.jsp"/>
            </c:when>
            <c:when test="${path eq 'main.do'}">
                <jsp:include page="page/home.jsp"/>
            </c:when>
            <c:when test="${path eq 'accountDetail.do'}">
                <jsp:include page="page/detail/accountDetail.jsp"/>
            </c:when>
            <c:when test="${path eq 'boardDetail.do'}">
                <jsp:include page="page/detail/boardDetail.jsp"/>
            </c:when>
            <c:when test="${path eq 'recruitDetail.do'}">
                <jsp:include page="page/detail/recruitDetail.jsp"/>
            </c:when>
            <c:when test="${path eq 'serviceDetail.do'}">
                <jsp:include page="page/detail/serviceDetail.jsp"/>
            </c:when>
            <c:when test="${path eq ('user.do' || 'company.do' || 'auth.do' || 'recruit.do' || 'community.do' || 'service.do' || 'allow.do' || 'delete.do' || 'search.do')}">
                <jsp:include page="page/list.jsp"/>
            </c:when>
        </c:choose>
    </div>
</div>
</body>
</html>