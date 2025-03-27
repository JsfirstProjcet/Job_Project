<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>
<style>
    .input-box {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .input-box input, .input-box textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
    .input-box textarea {
        height: 150px;
        resize: none;
    }
</style>
</head>
<body>
    <div class="container-xxl py-5 bg-dark page-header mb-5">
        <div class="container my-5 pt-5 pb-4">
            <h1 class="display-3 text-white mb-3 animated slideInDown">새 글 작성</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb text-uppercase">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
                    <li class="breadcrumb-item"><a href="../self/self_list.do">자기소개서 샘플</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">새 글 작성</li>
                </ol>
            </nav>
        </div>
    </div>
    
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="input-box">
                        <h4 class="mb-3">✏️ 자기소개서 작성</h4>
                        <form action="../write/write_insert_ok.do" method="post">
    					<input type="hidden" name="sno" value="${vo.sno}">
   						 <p>${vo.demand1 }</p>
   						 <textarea name="text1" required></textarea>
    					<p>${vo.demand2 }</p>
   						 <textarea name="text2" required></textarea>
    					<p>${vo.demand3 }</p>
    					<textarea name="text3" required></textarea>
   						 <p>${vo.demand4 }</p>
    					<textarea name="text4" required></textarea>
   						 <p>${vo.demand5 }</p>
    					<textarea name="text5" required></textarea>
    					<input type="text" name="name" placeholder="작성자 이름" required>
    						<input type="password" name="pwd" placeholder="비밀번호 입력" required>
    					<div class="text-end">
       						 <input type="submit" value="글쓰기" class="btn-outline-primary btn-sm">
      						  <a href="javascript:history.back()" class="btn btn-secondary">목록</a>
   						 </div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
