<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	pageChange()
})
function pageChange(page){
	$.ajax({
		type:'post',
		url:'../official/emp_list_print.do',
		data:{"page":page},
		success:function(res){
			$('#com-content').html(res)
		}
	})
}
</script>
</head>
<body>
	<div class="container mt-5">
		<div class="row" id="com-content">
			
		</div>
	</div>
</body>
</html>