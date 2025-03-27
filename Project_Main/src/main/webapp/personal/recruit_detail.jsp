<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사람인 로그인</title>
<script type="text/javascript">
</script>
</head>
<body>
	<h3 class="text-center">${vo.title }</h3>
	<table class="table">
		<tr>
			<th width="20%" class="text-center">이름</th>
			<td width="80%">${vo.name }</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">이메일</th>
			<td width="80%">${vo.email }</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">연락처</th>
			<td width="80%">${vo.phone }</td>
		</tr>
		<tr>
			<th width="20%" class="text-center">생년월일</th>
			<td width="80%">${vo.birth }</td>
		</tr>
		<tr>
			<td class="text-end" colspan="2">
				<a class="btn btn-sm btn-success recruit-btn" onclick="recruit(${rno})" style="color: white;">지원</a>
				<a class="btn btn-sm btn-primary" onclick="resumeList()">목록</a>
			</td>
		</tr>
	</table>
</body>
</html>