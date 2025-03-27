<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	let bCheck=false
	$('#all-check').change(function(){
		if(bCheck){
			$('.jno').prop("checked",false)
			bCheck=false
		}else{
			$('.jno').prop("checked",true)
			bCheck=true
		}
		let test=$(this).val();
	});
	$('.jno').change(function(){
		if(bCheck){
			$('#all-check').prop("checked",false)
			bCheck=false
		}
	})
})
</script>
</head>
<body>
	<div style="min-height: 550px">
		<table class="table">
			<tr>
				<td colspan="7">
					<c:if test="${param.state==0}">
						<input type="checkbox" id="all-check">&nbsp;전체 선택
						<select id="setState">
							<option value="1">합격</option>
							<option value="2">불합격</option>
						</select>
						<a onclick="seekerUpdate()" class="btn btn-sm btn-primary" style="color: white;">변경</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th width="5%" class="text-center">
				</th>
				<th width="10%" class="text-center">번호</th>
				<th width="40%" class="text-center">이력서</i></th>
				<th width="20%" class="text-center">등록일</th>
				<th width="15%" class="text-center">이름</th>
				<th width="15%" class="text-center">상태</th>
			</tr>
			<c:if test="${list.size()==0 }">
				<tr>
					<td colspan="7" class="text-center">리스트가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${list.size()!=0 }">
				<c:forEach var="svo" items="${list }">
					<tr>
						<td width="5%" class="text-center">
							<c:if test="${param.state==0}">
								<input type="checkbox" name="jno" class="jno jno${svo.jno }" value="${svo.jno }">
							</c:if>
						</td>
						<td width="10%" class="text-center">${svo.num }</td>
						<td width="40%" class="text-start">${svo.rtitle }</td>
						<td width="20%" class="text-center">${svo.dbday }</td>
						<td width="15%" class="text-center">${svo.pname }</td>
						<td width="15%" class="text-center">
							<c:if test="${svo.state==0 }">
								지원
							</c:if>
							<c:if test="${svo.state==1 }">
								합격
							</c:if>
							<c:if test="${svo.state==2 }">
								불합격
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<c:if test="${totalpage!=0 }">
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
	</c:if>
</body>
</html>