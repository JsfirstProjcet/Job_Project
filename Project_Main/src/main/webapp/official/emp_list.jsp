<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let filter
$(function(){
	pageChange()
	$('#filter').change(function(){
		filter=$(this).val()
		pageChange(1)
	})
})
function pageChange(page){
	$.ajax({
		type:'post',
		url:'../official/emp_list_print.do',
		data:{"page":page,"filter":filter},
		success:function(res){
			$('#com-content').html(res)
		}
	})
}
</script>
</head>
<body>
	<div class="container mt-5">
		<select id="filter">
			<option value="0">마감일</option>
			<option value="1">등록일</option>
			<option value="2">지원자</option>
		</select>
		<div class="row" id="com-content">
			
		</div>
	</div>
</body>
</html>