<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
let page0
$(function(){
	pageChange(1)
	$('#state').change(function(){
		pageChange(1)
	})
})
function pageChange(page){
	let state=$('#state').val()
	if(state==0){
		page0=page
	}
	$.ajax({
    	type:'post',
    	url:'../official/seeker_list_print.do',
    	data:{"eno":${eno},"state":state,"page":page},
    	success:function(res){
    		$('.seeklist').html(res)
    	}
    })
}
function seekerUpdate(){
	let setState=$('#setState').val()
	$('.jno:checked').map(function() {
        let jno=this.value
        $.ajax({
        	type:'post',
        	url:'../official/seeker_update.do',
        	data:{"jno":jno,"state":setState},
        	success:function(){
        		pageChange(page0)
        	}
        })
    })
}
function closeBox() {
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
</script>
</head>
<body>
	<div class="container mt-5 ">
		<div class="resume-list">
			<select id="state">
				<option value="0" selected>지원</option>
				<option value="1">합격</option>
				<option value="2">불합격</option>
			</select>
			<div class="row seeklist">
			</div>
		</div>
		<div class="resume-detail">
		</div>
		<a onclick="closeBox()" class="btn btn-sm btn-danger" style="float: right;">닫기</a>
	</div>
</body>
</html>