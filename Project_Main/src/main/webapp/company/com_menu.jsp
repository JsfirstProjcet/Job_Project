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
<script type="text/javascript">
$(function(){
	printComFollow()
})
function insertComFollow(cno){
	let id='${sessionScope.id}'
	console.log(id)
	let type=0
	if(${sessionScope.id!=null} && ${sessionScope.isadmin==0}){
		$.ajax({
			type:'post',
			url:'../follow/follow_insert.do',
			data:{"no":cno,"id":id,"type":type},
			success:function(res){
				printComFollow()
			}
		})
	}else if(${sessionScope.cid!=null}){
		if(confirm("기업계정으로 이용 불가능한 기능입니다\n일반 사용자 계정으로 로그인 후 이용가능한 기능입니다")){
		}else{
			return
		}
	}else {
		alert("일반 사용자 계정으로 로그인 후 이용가능한 기능입니다")
		javascript:login()
		return
	}
}
function deleteComFollow(cno){
	let id='${sessionScope.id}'
	let type=0
	$.ajax({
		type:'post',
		url:'../follow/follow_delete.do',
		data:{"no":cno,"id":id,"type":type},
		success:function(res){
			printComFollow()
		}
	})
}
function printComFollow(){
	let no=${vo.cno}
	let id='${sessionScope.id}'
	let type=0
	let html=''
	$.ajax({
		type:'post',
		url:'../follow/follow_print.do',
		data:{"no":no,"id":id,"type":type},
		success:function(res){
			if(res.check==0){
				html+=''
					+'<a class="btn btn-sm btn-light" style="border: 1px solid gray; border-radius: 5px;" onclick="insertComFollow('+${vo.cno}+')">'
						+'<i class="far bi-star me-2" style="color: gray">&nbsp;'+res.fCount+'</i>관심기업'
					+'</a>'
			}else if(res.check==1){
				html+=''
					+'<a class="btn btn-sm btn-light" style="border: 1px solid gray; border-radius: 5px;" onclick="deleteComFollow('+${vo.cno}+')">'
						+'<i class="far bi-star-fill me-2" style="color: orange">&nbsp;'+res.fCount+'</i>관심기업'
					+'</a>'
			}
			$('.follow-box').html(html)
		}
	})
}
</script>
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
		<div class="row-menu follow-box">
			<a class="btn btn-sm btn-light" style="border: 1px solid gray; border-radius: 5px;" onclick=insertComFollow(${vo.cno})>
				<i class="far bi-star me-2" style="color: gray"></i>${vo.fo_count }관심기업
			</a>
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
			<c:if test="${sessionScope.cid!=null&&sessionScope.cid==vo.cid&&sessionScope.state==1 }">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">기업관리</h3>
					</div>
					<ul class="list-group">
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