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
			$('.eno').prop("checked",false)
			bCheck=false
		}else{
			$('.eno').prop("checked",true)
			bCheck=true
		}
		let test=$(this).val();
	});
	$('.eno').change(function(){
		if(bCheck){
			$('#all-check').prop("checked",false)
			bCheck=false
		}else{
			
		}
	})
})
function closing(){
	$('.eno:checked').map(function() {
        let eno=this.value
        $.ajax({
        	type:'post',
        	url:'../official/emp_close.do',
        	data:{"eno":eno},
        	success:function(){
        		location.href="../official/emp_list.do?cno="+${cno}
        	}
        })
    })
}
function seekerList(eno,title){
	Shadowbox.open({
        content:'../official/seeker_list.do?eno='+eno,
        player:'iframe',
        width:800,
        height:600,
        title:title+' 지원자 목록'
    })	
}
</script>
</head>
<body>
	<table class="table">
	<tr>
		<td colspan="8">
			<input type="checkbox" id="all-check">&nbsp;전체 선택
			<a onclick="closing()" class="btn btn-sm btn-danger" style="color: white; float: right;">조기 마감</a>
		</td>
	</tr>
	<tr>
		<th width="5%" class="text-center">
		</th>
		<th width="10%" class="text-center">번호</th>
		<th width="35%" class="text-center">공고 제목</th>
		<th width="5%" class="text-center"><i class="far bi-eye text-dark me-2"></i></th>
		<th width="5%" class="text-center"><i class="far fa-heart text-danger me-2"></i></th>
		<th width="5%" class="text-center"><i class="fas fa-user-tie text-primary me-2"></i></th>
		<th width="15%" class="text-center">마감일</th>
		<th width="20%" class="text-center">마감일</th>
	</tr>
	<c:forEach var="evo" items="${list }">
		<tr>
			<td width="5%" class="text-center">
				<input type="checkbox" name="eno" class="eno eno${evo.eno }" value="${evo.eno }">
			</td>
			<td width="10%" class="text-center">${evo.num }</td>
			<td width="35%" class="text-start" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${evo.title }</td>
			<td width="5%" class="text-center">${evo.hit }</td>
			<td width="5%" class="text-center">${evo.fo_count }</td>
			<td width="5%" class="text-center">${evo.se_count }</td>
			<td width="15%" class="text-center">${evo.dbdeadline!=null?evo.dbdeadline:"상시 모집" }</td>
			<td width="20%" class="text-center">
				<a onclick="seekerList(${evo.eno},'${evo.title }')" class="btn btn-sm btn-primary">지원자 목록</a>
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