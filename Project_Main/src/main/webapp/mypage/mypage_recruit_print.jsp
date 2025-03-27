<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bCheck=false
$(function(){
	$('#all-check').change(function(){
		if(bCheck){
			$('.jno').prop("checked",false)
			bCheck=false
		}else{
			$('.jno').prop("checked",true)
			bCheck=true
		}
		let test=$(this).val();
	})
	$('.jno').change(function(){
		if(bCheck){
			$('#all-check').prop("checked",false)
			bCheck=false
		}else{
			
		}
	})
})
</script>
<style type="text/css">
.emp-title{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 300px;
}
</style>
</head>
<body>
	<table class="table">
	<tr>
		<td colspan="8">
			<input type="checkbox" id="all-check">&nbsp;전체 선택
			<a onclick="closing()" class="btn btn-sm btn-danger" style="color: white; margin-left: 5px">선택 삭제</a>
		</td>
	</tr>
	<tr>
		<th width="5%" class="text-center">
		</th>
		<th width="10%" class="text-center">번호</th>
		<th width="40%" class="text-center">공고 제목</th>
		<th width="15%" class="text-center">지원일</th>
		<th width="15%" class="text-center">상태</th>
		<th width="15%" class="text-center"></th>
	</tr>
	<c:forEach var="jvo" items="${list }">
		<tr>
			<td width="5%" class="text-center">
				<input type="checkbox" name="jno" class="jno jno${jvo.jno }" value="${jvo.jno }">
			</td>
			<td width="10%" class="text-center">${jvo.num }</td>
			<td width="40%" class="text-left"><a href="../emp/emp_detail.do?no=${jvo.eno }">${jvo.etitle }</a></td>
			<td width="15%" class="text-center">${jvo.dbday}</td>
			<td width="15%" class="text-center">
				<c:if test="${jvo.state==0 }">
				대기중
				</c:if>
				<c:if test="${jvo.state==1 }">
				합격
				</c:if>
				<c:if test="${jvo.state==2 }">
				불합격
				</c:if>
			</td>
			<td width="15%" class="text-center">
				<c:if test="${jvo.state!=1 }">
					<a onclick="recruitDelete(${jvo.jno})" class="btn btn-sm btn-danger">삭제</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<div class="col-12">
	<div class="row" style="justify-content: space-between;">
		<ul class="pagination col-9">
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a class="page-link" onclick="pageChange(${startPage-1})"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li class="page-item ${curpage==i?'active':'' }">
					<a class="page-link" onclick="pageChange(${i })">${i }</a>
				</li>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li class="page-item">
					<a class="page-link" onclick="pageChange(${endPage+1})"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
				</li>
			</c:if>
		</ul>
		<div class="page-status col-3" style="float: right;">
			<p>Page ${curpage } of ${totalpage } pages</p>
		</div>
	</div>
</div>
</body>
</html>