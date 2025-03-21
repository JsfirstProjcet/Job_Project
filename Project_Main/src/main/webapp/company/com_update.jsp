<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$(".take").on("input", function () {
		if($(this).val()<0){
			$(this).val(0)
		}
		if($(this).val()/1000>=1){
			if($(this).attr("id")==="jo"){
				$('#uk').focus()
			}else if($(this).attr("id")==="uk"){
				$('#man').focus()
			}
		}
		if($(this).val() > 9999){
			$(this).val(9999);
		}
	});
})
</script>
<style type="text/css">
input::-webkit-outer-spin-button,input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type='number'] {
  -moz-appearance: textfield;
}
input[type='number'].take {
  width: 6ex;
  text-align: right;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center" width="15%">기업명</th>
					<td width="85%" colspan="3">
						<input type="text" name="name" id="name" size="30" value="${vo.name }" readonly disabled>
					</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">설립일</th>
					<td width="35%">
						<input type="date" name="estdate" id="estdate" value="${vo.dbestdate }">
					</td>
					<th class="text-center" width="15%">대표자명</th>
					<td width="35%">
						<input type="text" name="representative" id="representative" size="30" value="${vo.representative==null?'':vo.representative }">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">기업형태</th>
					<td width="35%">
						<select name="c_type" id="c_type">
							<c:forEach var="i" begin="0" end="6">
								<option value="${ctype[i] }"  ${ctype[i]=="기타"?((vo.c_type==null||vo.c_type=="기타")?"selected":""):(ctype[i]==vo.c_type?"selected":"") }>${ctype[i] }</option>
							</c:forEach>
						</select>
					</td>
					<th class="text-center" width="15%">홈페이지</th>
					<td width="35%">
						<input type="text" name="homepage" id="homepage" size="30" value="${vo.homepage==null?'':vo.homepage }">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">업종</th>
					<td width="85%" colspan="3">
						<input type="text" name="industry" id="industry" size="80" value="${vo.industry==null?'':vo.industry }">
					</td>
				</tr>
				<tr>
					<th class="text-center" width="15%">사원수</th>
					<td width="35%">
						<input type="number" name="ecount" id="ecount" size="30" value="${vo.ecount }" min="0">
					</td>
					<th class="text-center" width="15%">매출액</th>
					<td width="35%">
						<input type="number" class="take text-right" name="jo" id="jo" size="5" value="${vo.jo }" min="0">조
						<input type="number" class="take text-right" name="uk" id="uk" size="5" value="${vo.uk }" min="0">억
						<input type="number" class="take text-right" name="man" id="man" size="5" value="${vo.man }" min="0">만
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>