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
	let phone='${ovo.phone}'
	startPhone(phone)
	let brnumber='${ovo.brnumber}'
	startBrnumber(brnumber)

	$('#phone0').change(function(){
		printPhone()
	})
	$(".phone").on("input", function () {
		if($(this).val()<0){
			$(this).val(0)
		}
		printPhone()
		if($(this).val()/1000>=1){
			if($(this).attr("id")==="phone1"){
				$('#phone2').val("")
				$('#phone2').focus()
			}else if($(this).attr("id")==="phone2"){
				$('#phone2').blur()
			}
		}
		if($(this).val() > 9999){
			$(this).val(9999);
		}
	})
	
	$(".brnumber").on("input", function () {
		if($(this).val()<0){
			$(this).val(0)
		}
		printBrnumber()
		if($(this).val()/10>=1 && $(this).attr("id")==="brnumber1"){
			$('#brnumber2').val("")
			$('#brnumber2').focus()
		}else if($(this).val()/100>=1 && $(this).attr("id")==="brnumber0"){
			$('#brnumber1').val("")
			$('#brnumber1').focus()
		}else if($(this).val()/10000>=1){
			$('#brnumber2').blur()
		}
		
		if($("#brnumber0").val() > 999){
			$(this).val(999);
		}
		if($("#brnumber1").val() > 99){
			$(this).val(99);
		}
		if($("#brnumber2").val() > 99999){
			$(this).val(99999);
		}
	})
	$('.cancel').click(function(){
		
	})
})
function startPhone(phone){
	let phone0=phone.slice(0, 3)
	let phone1=phone.slice(4, 8)
	let phone2=phone.slice(9, 13)
	$('#phone0').val(phone0)
	$('#phone1').val(phone1)
	$('#phone2').val(phone2)
}
function printPhone(){
	let phone=$('#phone0').val()+"-"+$('#phone1').val().padStart(4,0)+"-"+$('#phone2').val().padStart(4,0)
	$('#phone').val(phone)
}
function startBrnumber(brnumber){
	let brnumber0=brnumber.slice(0,3)
	let brnumber1=brnumber.slice(4,6)
	let brnumber2=brnumber.slice(7,12)
	$('#brnumber0').val(brnumber0)
	$('#brnumber1').val(brnumber1)
	$('#brnumber2').val(brnumber2)
}
function printBrnumber(){
	let brnumber=$('#brnumber0').val().padStart(3,0)+"-"+$('#brnumber1').val().padStart(2,0)+"-"+$('#brnumber2').val().padStart(5,0)
	$('#brnumber').val(brnumber)
}
</script>
<style type="text/css">
input::-webkit-outer-spin-button,input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type='number'] {
  -moz-appearance: textfield;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row" style="width: 600px;margin: 0px auto;">
			<h3>기업 계정정보 수정</h3>
			<form method="post" action="../official/official_update_ok.do">
				<table class="table">
					<tr>
						<th width="20%">아이디</th>
						<td width="80%">
							<input type="text" size="15" name="cid" id="cid" value="${ovo.cid }" disabled readonly>
						</td>
					</tr>
					<tr>
						<th width="20%">이메일</th>
						<td width="80%">
							<input type="email" size="15" name="email" id="email" value="${ovo.email }" disabled readonly>
						</td>
					</tr>
					<tr>
						<th width="20%">담당자명</th>
						<td width="80%">
							<input type="text" class="update" size="15" name="name" id="name" value="${ovo.name }" required>
						</td>
					</tr>
					<tr>
						<th width="20%">기업명</th>
						<td width="80%">
							<input type="text" class="update" size="20" name="cname" id="cname" value="${ovo.cname }" required>
						</td>
					</tr>
					<tr>
						<th width="20%">연락처</th>
						<td width="80%">
							<select id="phone0" class="update">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="number" class="phone update" size="8" id="phone1" min="0" max="9999" required>
							<input type="number" class="phone update" size="8" id="phone2" min="0" max="9999" required>
							<input type="hidden" size="15" name="phone" id="phone" value="${ovo.phone }" readonly>
						</td>
					</tr>
					<tr>
						<th width="20%">사업자번호</th>
						<td width="80%">
							<input type="number" class="brnumber update" size="6" id="brnumber0" min="0" max="999" required>
							<input type="number" class="brnumber update" size="4" id="brnumber1" min="0" max="99" required>
							<input type="number" class="brnumber update" size="10" id="brnumber2" min="0" max="99999" required>
							<input type="hidden" size="15" name="brnumber" id="brnumber" value="${ovo.brnumber }" readonly>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-end">
							<input type="submit" class="btn btn-sm btn-primary" style="color: white;" value="수정완료">
							<a href="../official/official_detail.do?cno=${vo.cno }" class="btn btn-sm btn-danger" style="color: white;">취소</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>