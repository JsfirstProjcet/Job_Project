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
})
function pageChange(page){
	let ftype=$('#type option:selected').val()
	$.ajax({
		type:'post',
		url:'../mypage/mypage_recruit_print.do',
		data:{"type":ftype,"page":page},
		success:function(res){
			$('#recruit_content').html(res)
		}
	})
}
function closing(){
	$('.jno:checked').map(function() {
        let jno=this.value
        recruitDelete(jno)
    })
}
function recruitDelete(jno){
	$.ajax({
    	type:'post',
    	url:'../mypage/mypage_recruit_delete.do?jno='+jno,
    	data:{"jno":jno},
    	success:function(){
    		location.href="../mypage/mypage_recruit.do"
    	}
    })
}
</script>
</head>
<body>
	<div class="container">
		<h3>지원 목록</h3>
		<div class="row" id="recruit_content">
		</div>
	</div>
</body>
</html>