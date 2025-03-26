<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	let today = new Date();
	$('#deadline').attr("min",today.toISOString().slice(0, 10))
	$('#deadline').val(today.toISOString().slice(0, 10))
	let dCheck=false
	$('#deadline_check').change(function(){
		if(dCheck){
			$('#deadline').prop("disabled",false)
			$('#deadline').val(today.toISOString().slice(0, 10))
			dCheck=false
		}else{
			$('#deadline').prop("disabled",true)
			$('#deadline').val('')
			dCheck=true
		}
	})
	$('#stype').change(function(){
		let stype=$(this).val()
		let text=$('#stype option:selected').text()
		if(stype==0){
			$('#salary_str').val('')
			$('#salary').val('')
			$('#salary').attr("disabled",false)
			$('#salary').focus()
		}else{
			$('#salary_str').val(text)
			$('#salary').val(0)
			$('#salary').attr("disabled",true)
		}
	})
	$('#salary').change(function(){
		let sal=$(this).val()
		let text='연봉 '+Number(sal).toLocaleString()+' 만원'
		$('#salary_str').val(text)
	})
	
	$('#personal_history1').change(function(){
		let ptype=$(this).val()
		if(ptype!=2){
			$('#personal_history2').val('')
			$('#personal_history2').attr("disabled",true)
		}else{
			$('#personal_history2').attr("disabled",false)
		}
	})
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data){
				$('#address').val(data.address)
			}
		}).open()
	})
})
function empInsert(){
	let name=$('#name').val()
	let title=$('#title').val()
	let ph1=$('#personal_history1 option:selected').text()
	let ph2=$('#personal_history2').val()
	let personal_history=ph1+' '+ph2
	let salary=$('#salary').val()
	let salary_str=$('#salary_str').val()
	let education=$('#education').val()
	let et1=$('#emp_type1 option:selected').text()
	let et2=$('#emp_type2').val()
	let emp_type=et1+" "+et2
	let loc=$('#address').val()
	let deadline=$('#deadline').val()
	let content=$('#content').val()
	if(title==''){
		$('#title').focus()
		return
	}else if($('#personal_history1 option:selected').val()==2&&ph2==''){
		$('#personal_history2').focus()
		return
	}else if($('#stype option:selected').val()==0&&salary==''){
		$('#salary').focus()
		return
	}else if(address==''){
		$('#address').focus()
		return
	}else if(content==''){
		$('#content').focus()
		return
	}
	$.ajax({
		type:'post',
		url:'../official/emp_insert_ok.do',
		data:{
			"name":name,
			"title":title,
			"personal_history":personal_history,
			"salary":salary,
			"salary_str":salary_str,
			"education":education,
			"emp_type":emp_type,
			"loc":loc,
			"deadline":deadline,
			"content":content
			},
		success:function(){
			location.href="../official/emp_list.do?cno="+${cno}
		}
	})
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
		<div class="row">
			<table class="table">
				<tr>
					<td width="15%" class="text-center">기업명</td>
					<td width="85%" colspan="3">
						<input type="text" name="name" id="name" value="${vo.name }" disabled>
					</td>
				</tr>
				<tr>
					<td width="10%" class="text-center">공고제목</td>
					<td width="85%" colspan="3">
						<input type="text" size="60" name="title" id="title">
					</td>
				</tr>
				<tr>
					<td width="15%" class="text-center">경력</td>
					<td width="85%" colspan="3">
						<select id="personal_history1">
							<option value="0" selected>무관</option>
							<option value="1">신입</option>
							<option value="2">경력</option>
						</select>
						<input type="text" id="personal_history2" disabled>
					</td>
				</tr>
				<tr>
					<td width="15%" class="text-center">연봉</td>
					<td width="85%" colspan="3">
						<select id="stype">
							<option value="0" selected>직업 입력</option>
							<option value="1">면접 후 결정</option>
							<option value="2">회사내규에 따름</option>
						</select>
						<input type="number" name="salary" id="salary" required>만원
						<input type="hidden" name="salary_str" id="salary_str" value="" disabled>
					</td>
				</tr>
				<tr>
					<td width="15%" class="text-center">학력</td>
					<td width="35%">
						<select id="education">
							<option value="0" selected>학력무관</option>
							<option value="1">고등학교 졸업</option>
							<option value="2">대학 졸업(2,3년제)</option>
							<option value="3">대학교 졸업(4년제)</option>
							<option value="4">대학원 석사 졸업</option>
							<option value="5">대학원 박사 졸업</option>
							<option value="6">박사 졸업 이상</option>
						</select>
					</td>
					<td width="15%" class="text-center">고용형태</td>
					<td width="35%">
						<select id="emp_type1">
							<option value="0">정규직</option>
							<option value="1">계약직</option>
							<option value="2">아르바이트</option>
						</select>
						<input type="text" id="emp_type2">
					</td>
				</tr>
				<tr>
					<td width="15%" class="text-center">근무지역</td>
					<td width="35%">
						<input type="text" name="address" id="address" size="30" readonly>
						<input type="button" value="주소찾기" id="postBtn">
					</td>
					<td width="15%" class="text-center">마감일</td>
					<td width="35%">
						<input type="checkbox" id="deadline_check">상시모집
						<input type="date" name="deadline" id="deadline">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="20" cols="100" name="content" id="content" style="float: right;margin-right: 5px"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-center">
						<a class="btn btn-sm btn-primary" onclick="empInsert()">공고 등록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>