<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container" style="max-width: 900px; margin: 0 auto;">
		<h4 class="mb-4 mt-5">커뮤니티 글 입력</h4>
		<form method="post" action="../interview/commune_insert_ok.do">
			<div class="row g-3" style="margin: 0 auto;">
				<div class="col-12">
					 <h4> 제목 </h4>
					 <input type="text" class="form-control" name=subject placeholder="제목을 입력하세요" style="width: 80%">
				</div>
				<div class="col-12">
					<h4> 내용 </h4>
					<textarea rows="10" cols="50" name=content placeholder="내용을 입력하세요" style="width: 80%"></textarea>
				</div>
				<!-- <div class="col-12 col-sm-6">
					<input type="text" class="form-control" placeholder="Portfolio Website">
				</div>
				<div class="col-12 col-sm-6">
					<input type="file" class="form-control bg-white">
				</div>
				<div class="col-12">
					<textarea class="form-control" rows="5" placeholder="Coverletter"></textarea>
				</div> -->
					<div class="col-12" style="width: 80%">
					<h4>해시태그</h4>
					<div style="display: flex; flex-wrap: wrap; gap: 5px;">
						<input type="checkbox" id="tag1" name="hashtag" value="#신입">
						<label for="tag1" class="hashtag-label">#신입</label>

						<input type="checkbox" id="tag2" name="hashtag" value="#취업">
						<label for="tag2" class="hashtag-label">#취업</label>

						<input type="checkbox" id="tag3" name="hashtag" value="#이직">
						<label for="tag3" class="hashtag-label">#이직</label>

						<input type="checkbox" id="tag4" name="hashtag" value="#잡담">
						<label for="tag4" class="hashtag-label">#잡담</label>

						<input type="checkbox" id="tag5" name="hashtag" value="#면접">
						<label for="tag5" class="hashtag-label">#면접</label>

						<input type="checkbox" id="tag6" name="hashtag" value="#자소서">
						<label for="tag6" class="hashtag-label">#자소서</label>

						<input type="checkbox" id="tag7" name="hashtag" value="#커리어">
						<label for="tag7" class="hashtag-label">#커리어</label>
					</div>
				</div>
					
					<div class="col-12" style="width: 80%">
						<button class="btn btn-primary w-100" type="submit" >등록하기</button>
					</div>
			</div>
		</form>
	</div>
	
</body>
</html>