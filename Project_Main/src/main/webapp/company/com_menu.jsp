<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row-menu{
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 50px">
		<div class="row-menu">
			<c:if test="${vo.poster!=null }">
				<img class="flex-shrink-0 img-fluid border rounded" src="https://pds.saramin.co.kr/company${vo.poster }"
					style="width: 100%; height: 80px;background-color: white; border-radius: 50px; border: none">
			</c:if>
			<c:if test="${vo.poster==null }">
				<img class="flex-shrink-0 img-fluid border rounded" src="../img/logo/noimg1.png"
					style="width: 100%; height: 80px;background-color: white; border-radius: 50px; border: none">
			</c:if>
		</div>
		<div class="row-menu">
			<h4 class="mb-3">${vo.name }</h4>
			<span style="display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;">${vo.bu_details} </span>
		</div>
		<div class="row-menu">
		</div>
		<div class="row-menu">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">기업</h3>
				</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="../company/com_detail.do?cno=${vo.cno }">기업소개</a></li>
					<li class="list-group-item"><a href="../company/com_emp_list.do?cno=${vo.cno }">진행중인 공고</a></li>
				</ul>
			</div>
			<div class="row-menu">
			</div>
			<c:if test="${sessionScope.cid!=null&&sessionScope.access_key!=null&&sessionScope.access_key==vo.access_key }">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">기업관리</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="../company/com_update.do?cno=${vo.cno }">기업 정보 수정</a></li>
						<li class="list-group-item"><a href="#">새 공고 등록</a></li>
						<li class="list-group-item"><a href="#">공고 관리</a></li>
						<li class="list-group-item"><a href="#">지원자 관리</a></li>
						<li class="list-group-item"><a href="#">계정 관리</a></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>