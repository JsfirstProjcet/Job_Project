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

	<!-- Header End -->
    <div class="container-xxl py-5 bg-dark page-header">
        <div class="container my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">${com_title }</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb text-uppercase">
                    <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                    <li class="breadcrumb-item"><a href="../company/com_list.do">기업</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">${com_title }</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Header End -->
    
	<div class="container">
		<div class="row">
			<c:if test="${param.cno!=null&&param.cno!=0 }">
				<div class="col-3 bg-light" style="margin-bottom: -48px">
					<jsp:include page="../company/com_menu.jsp"/>
				</div>
			</c:if>
			<div class="col-9">
				<jsp:include page="${com_jsp}"/>
			</div>
		</div>
	</div>
</body>
</html>