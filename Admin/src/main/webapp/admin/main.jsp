<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page errorPage="components/error.jsp" %>
<!DOCTYPE html>
<html class="w-full h-full max-w-screen max-h-screen overflow-hidden">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<jsp:include page="components/loading.jsp"/>
<div class="flex justify-start">
    <jsp:include page="components/sidebar.jsp"/>
    <div class="flex flex-col w-5/6 max-w-screen h-full max-h-screen text-center justify-center align-middle px-4">
        <c:choose>
            <c:when test="${size eq '0'}">
                <jsp:include page="components/noresult.jsp"/>
            </c:when>
            <c:when test="${path eq 'main.do'}">
                <jsp:include page="page/home.jsp"/>
            </c:when>
            <c:when test="${path eq 'accountDetail.do'}">
                <jsp:include page="page/accountDetail.jsp"/>
            </c:when>
            <c:when test="${path eq 'boardDetail.do'}">
                <jsp:include page="page/boardDetail.jsp"/>
            </c:when>
            <c:when test="${path eq 'recruitDetail.do'}">
                <jsp:include page="page/recruitDetail.jsp"/>
            </c:when>
            <c:when test="${path eq 'serviceDetail.do'}">
                <jsp:include page="page/serviceDetail.jsp"/>
            </c:when>
            <c:when test="${path eq ('user.do' || 'company.do' || 'auth.do' || 'recruit.do' || 'community.do' || 'service.do' || 'allow.do' || 'delete.do')}">
                <jsp:include page="page/list.jsp"/>
            </c:when>
            <%--            <c:otherwise>--%>
            <%--                <script type="text/javascript">--%>
            <%--                  location.href = "main.do"--%>
            <%--                </script>--%>
            <%--            </c:otherwise>--%>
        </c:choose>
    </div>
</div>
</body>
</html>
