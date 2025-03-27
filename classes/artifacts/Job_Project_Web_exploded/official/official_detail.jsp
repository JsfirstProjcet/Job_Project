<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	if(${sessionScope.cid==null}){
		alert("기업계정으로 로그인 후 이용해주세요")
		location.href="../company/com_detail.do?cno="+${param.cno}
		return
	}else if(${sessionScope.cid!=vo.cid}){
		alert("접근한 계정정보를 수정할 권한이 없습니다")
		location.href="../company/com_detail.do?cno="+${param.cno}
		return
	}
})
</script>
</head>
<body>
	<div class="container mt-5">
		<div class="row" style="width: 600px;margin: 0px auto;">
			<h3>기업 계정정보 수정</h3>
			<table class="table">
				<tr>
					<th width="20%">아이디</th>
					<td width="80%">${ovo.cid }</td>
				</tr>
				<tr>
					<th width="20%">이메일</th>
					<td width="80%">${ovo.email }</td>
				</tr>
				<tr>
					<th width="20%">담당자명</th>
					<td width="80%">${ovo.name }</td>
				</tr>
				<tr>
					<th width="20%">기업명</th>
					<td width="80%">${ovo.cname }</td>
				</tr>
				<tr>
					<th width="20%">연락처</th>
					<td width="80%">${ovo.phone }</td>
				</tr>
				<tr>
					<th width="20%">사업자번호</th>
					<td width="80%">${ovo.brnumber }</td>
				</tr>
				<tr>
					<td colspan="2" class="text-end">
						<a href="../official/official_update.do?cno=${vo.cno }" class="btn btn-sm btn-info" style="color: white;">수정</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>