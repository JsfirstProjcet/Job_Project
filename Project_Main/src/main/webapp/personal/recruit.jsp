<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사람인 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.resume-detail').hide()
})
function cancel(){
		parent.Shadowbox.close()
}
function resumeDetail(rno){
	let eno=${eno}
	$('.resume-list').hide()
	$('.resume-detail').show()
	$('.recruit-btn').attr("onclick","recruit("+rno+")")
	$.ajax({
		type:'post',
		url:'../personal/recruit_detail.do',
		data:{"eno":eno,"rno":rno},
		success:function(res){
			let json=JSON.parse(res)
		}
	})
}
function resumeList(){
	$('.resume-list').show()
	$('.resume-detail').hide()
}
function recruit(rno){
	let eno=${eno}
	$.ajax({
		type:'post',
		url:'../personal/recruit_insert.do?eno='+eno+'&rno='+rno,
		data:{"eno":eno,"rno":rno},
		success:function(res){
			parent.Shadowbox.close()
		}
	})
	parent.location.href="../emp/emp_detail.do?no="+eno
}
</script>
</head>
<body>
	<div class="container resume-list mt-5">
		<h3 class="text-center">나의 이력서 목록${eno }</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-end" colspan="3">
						<a class="btn btn-sm btn-danger" onclick="cancel()">닫기</a>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="10%">번호</th>
					<th class="text-center" width="75%">제목</th>
					<th class="text-center" width="15%"></th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td class="text-center" width="10%">${vo.num }</td>
						<td class="text-start" width="75%">${vo.title }</td>
						<td class="text-center" width="15%">
							<a class="btn btn-sm btn-info"  onclick="resumeDetail(${vo.rno})">상세보기</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="container resume-detail mt-5">
		<h3 class="text-center">나의 이력서 상세</h3>
		<div class="row">
			<table>
				<tr>
					<td class="text-end">
						<a class="btn btn-sm btn-success recruit-btn" onclick="recruit()">지원</a>
						<a class="btn btn-sm btn-primary" onclick="resumeList()">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
