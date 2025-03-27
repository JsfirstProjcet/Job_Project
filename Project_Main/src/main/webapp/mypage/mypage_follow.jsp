<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	pageChange(1)
	$('#type').change(function(){
		pageChange(1)
	})
})
function pageChange(page){
	let ftype=$('#type option:selected').val()
	$.ajax({
		type:'post',
		url:'../mypage/mypage_follow_print.do',
		data:{"type":ftype,"page":page},
		success:function(res){
			$('#follow_content').html(res)
		}
	})
}
function closing(){
	$('.fno:checked').map(function() {
        let fno=this.value
        followDelete(fno)
    })
}
function followDelete(fno){
	$.ajax({
    	type:'post',
    	url:'../mypage/mypage_follow_delete.do?fno='+fno,
    	data:{"fno":fno},
    	success:function(){
    		location.href="../mypage/mypage_follow.do"
    	}
    })
}
</script>
</head>
<body>
	<div class="container">
		<h3>팔로우 목록</h3>
		<select id="type">
			<option value="0" selected>기업</option>
			<option value="1">공고</option>
		</select>
		<div class="row" id="follow_content">
		</div>
	</div>
</body>
</html>