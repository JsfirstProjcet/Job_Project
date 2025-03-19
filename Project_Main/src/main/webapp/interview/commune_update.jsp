<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#updateBtn').click(function(){
		let bno=$('#bno').val()
		
		$.ajax({
			type:'post',
			url:'../interview/commune_update_ok.do',
			data:$('#upb').serialize(),
			success:function(result)
			{
				console.log(result);  // 결과값 제대로 나오는지 확인
				location.href="../interview/commune_detail.do?bno="+bno
			},
			error:function(err){
				console.log("에러 발생", err);
				alert(err)
			}
			
		})
		
	})
})
</script>
<style>
  .hashtag-label {
    display: inline-block;
    padding: 8px 16px;
    border: 1px solid #ccc;
    border-radius: 20px;
    cursor: pointer;
    color: #333;
    background-color: #fff;
    transition: all 0.3s;
  }

  input[type="checkbox"]:checked + .hashtag-label {
    border: 1px solid green;
    color: green;
    font-weight: bold;
  }

  input[type="checkbox"] {
    display: none;
  }
</style>
</head>
<body>
	<div class="container" style="max-width: 800px; margin: 0 auto;">
		<h4 class="mb-4 mt-5">커뮤니티 글 입력</h4>
		<form method="post" id="upb">
			<div class="row g-3" style="margin: 0 auto;">
				<div class="col-12">
					 <h4> 제목 </h4>
					 <input type="text" name=subject value="${vo.subject }"style="width: 100%" >
					 <input type="hidden" name=bno id=bno value=${vo.bno }>
				</div>
				<div class="col-12">
					<h4> 내용 </h4>
					<textarea rows="10" cols="50" name=content style="width: 100%">${vo.content }</textarea>
				</div>
					<div class="col-12" style="width: 100%">
					<h4>해시태그</h4>
					<div style="display: flex; flex-wrap: wrap; gap: 5px;">
						<input type="checkbox" id="tag1" name="hashtag" value="#신입" 
						    <c:if test="${fn:contains(vo.hashtag, '#신입')}">checked</c:if> >
						<label for="tag1" class="hashtag-label">#신입</label>
						
						<input type="checkbox" id="tag2" name="hashtag" value="#취업"
						    <c:if test="${fn:contains(vo.hashtag, '#취업')}">checked</c:if> >
						<label for="tag2" class="hashtag-label">#취업</label>

						<input type="checkbox" id="tag3" name="hashtag" value="#이직"
							<c:if test="${fn:contains(vo.hashtag, '#이직')}">checked</c:if> >
						<label for="tag3" class="hashtag-label">#이직</label>

						<input type="checkbox" id="tag4" name="hashtag" value="#잡담"
							<c:if test="${fn:contains(vo.hashtag, '#잡담')}">checked</c:if> >
						<label for="tag4" class="hashtag-label">#잡담</label>

						<input type="checkbox" id="tag5" name="hashtag" value="#면접"
							<c:if test="${fn:contains(vo.hashtag, '#면접')}">checked</c:if> >
						<label for="tag5" class="hashtag-label">#면접</label>

						<input type="checkbox" id="tag6" name="hashtag" value="#자소서"
							<c:if test="${fn:contains(vo.hashtag, '#자소서')}">checked</c:if> >
						<label for="tag6" class="hashtag-label">#자소서</label>

						<input type="checkbox" id="tag7" name="hashtag" value="#커리어"
							<c:if test="${fn:contains(vo.hashtag, '#커리어')}">checked</c:if> >
						<label for="tag7" class="hashtag-label">#커리어</label>
					</div>
				</div>
					
					<div class="col-12 " style="width: 100%; display: flex; justify-content: space-between; gap: 10px;">
						<button class="btn btn-secondary w-50" type="button" onclick="javascript:history.back()">취소하기</button>
						<button class="btn btn-primary w-50" type="button" id="updateBtn">수정하기</button>
					</div>
			</div>
		</form>
	</div>
	
</body>
</html>