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
	$.ajax({
		type:'post',
		url:'../personal/recruit_detail.do',
		data:{"eno":eno,"rno":rno},
		success:function(res){
			$('.resume-detail').html(res)
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
	<div class="container mt-5" style="min-height: 500px">
		<div class="row" style="min-height: 400px">
			<div class="resume-list">
				<h3 class="text-center">나의 이력서 목록</h3>
				<table class="table">
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
								<a class="btn btn-sm btn-info"  onclick="resumeDetail(${vo.rno})" style="color: white;">상세보기</a>
							</td>
						</tr>
					</c:forEach>	
				</table>
			</div>
			<div class="resume-detail">
			</div>
		</div>
		<div class="mt-5" style="bottom: 5px">
			<a class="btn btn-sm btn-danger" onclick="cancel()" style="float: right;">닫기</a>
		</div>
	</div>
</body>
</html>