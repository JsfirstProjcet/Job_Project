<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let pw=false
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
function pwdChange(){
	$('#pwdcheck').val("")
	$('#pwdchange').val("")
	if(pw){
		$('#pwdBtn').text("비밀번호 수정")
		$('#pwd_check').hide()
		$('#pwd_change').hide()
		pw=false
	}else{
		$('#pwdBtn').text("수정 취소")
		$('#pwd_check').show()
		pw=true
	}
}
function pwdCheck() {
	let pwd=$('#pwdcheck').val()
	$.ajax({
		type:'post',
		url:'../official/pwd_check.do',
		data:{"pwd":pwd},
		success:function(res){
			let json=JSON.parse(res)
			if(json.bCheck==0){
				alert("비밀번호가 틀립니다")
				$('#pwdcheck').val("")
				$('#pwdcheck').focus()
				return;
			}else if(json.bCheck==1){
				$('#pwd_check').hide()
				$('#pwd_change').show()
			}
		}
	})
}
function pwdChangeOk(){
	let pwd=$('#pwdchange').val()
	$.ajax({
		type:'post',
		url:'../official/pwd_change.do',
		data:{"pwd":pwd},
		success:function(res){
			let json=JSON.parse(res)
			if(json.bCheck==0){
				alert("비밀번호 변경이 실패했습니다")
				pwdChange()
				return
			}else if(json.bCheck==1){
				alert("비밀번호 변경이 성공했습니다")
				pwdChange()
			}
		}
	})
}
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
						<a onclick="pwdChange()" class="btn btn-sm btn-warning" style="color: white;" id="pwdBtn">비밀번호 수정</a>
						<a href="../official/official_update.do?cno=${vo.cno }" class="btn btn-sm btn-info" style="color: white;">수정</a>
					</td>
				</tr>
				<tr id="pwd_check" style="display: none;">
					<th width="20%">비밀번호 확인</th>
					<td width="80%">
						<input type="password" name="pwdcheck" id="pwdcheck">
						<a onclick="pwdCheck()" class="btn btn-sm btn-danger" style="color: white;">확인</a>
					</td>
				</tr>
				<tr id="pwd_change" style="display: none;">
					<th width="20%">새 비빌번호</th>
					<td width="80%">
						<input type="password" name="pwdcheck" id="pwdchange">
						<a onclick="pwdChangeOk()" class="btn btn-sm btn-danger" style="color: white;">변경</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>