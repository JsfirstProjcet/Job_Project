<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 글 수정</title>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>
        .commune-form-wrapper {
            background-color: #f4f6f9;
            font-family: 'Noto Sans KR', sans-serif;
            color: #333;
            padding: 60px 15px;
        }

        .commune-form-wrapper .container {
            max-width: 730px;
            margin: 0 auto;
            padding: 40px 35px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .commune-form-wrapper .container:hover {
            transform: translateY(-5px);
        }

        .commune-form-wrapper h2.title {
            font-weight: 700;
            font-size: 26px;
            margin-bottom: 30px;
            color: #222;
            text-align: center;
        }

        .commune-form-wrapper label.form-label {
            font-weight: 500;
            margin-bottom: 10px;
        }

        .commune-form-wrapper input[type="text"],
        .commune-form-wrapper textarea {
            background-color: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #ddd;
            padding: 12px 15px;
            font-size: 15px;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        .commune-form-wrapper input[type="text"]:focus,
        .commune-form-wrapper textarea:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
            outline: none;
        }

        .commune-form-wrapper .hashtag-label {
            display: inline-block;
            padding: 10px 20px;
            border: 2px solid #ccc;
            border-radius: 50px;
            cursor: pointer;
            font-size: 14px;
            color: #666;
            background-color: #f9f9f9;
            transition: all 0.25s ease-in-out;
        }

        .commune-form-wrapper input[type="checkbox"]:checked + .hashtag-label {
            border-color: #4CAF50;
            background-color: #e8f5e9;
            color: #4CAF50;
            font-weight: 600;
        }

        .commune-form-wrapper input[type="checkbox"] {
            display: none;
        }

        .commune-form-wrapper .btn-cancel,
        .commune-form-wrapper .btn-submit {
            height: 50px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
        }

        .commune-form-wrapper .btn-cancel {
            background-color: #f1f1f1;
            color: #333;
            transition: background-color 0.3s ease;
        }

        .commune-form-wrapper .btn-cancel:hover {
            background-color: #ddd;
        }

        .commune-form-wrapper .btn-submit {
            background-color: #4CAF50;
            color: #fff;
            transition: background-color 0.3s ease;
        }

        .commune-form-wrapper .btn-submit:hover {
            background-color: #45a049;
        }

        .commune-form-wrapper .form-section {
            margin-bottom: 30px;
        }

        .commune-form-wrapper .hashtags-wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        @media (max-width: 576px) {
            .commune-form-wrapper .container {
                padding: 30px 20px;
            }
        }
    </style>

    <script>
        $(function() {
            $('#updateBtn').click(function() {
                const bno = $('#bno').val();

                $.ajax({
                    type: 'post',
                    url: '../interview/commune_update_ok.do',
                    data: $('#upb').serialize(),
                    success: function(result) {
                        console.log(result);
                        location.href = "../interview/commune_detail.do?bno=" + bno;
                    },
                    error: function(err) {
                        console.log("에러 발생", err);
                        alert("수정 중 오류가 발생했습니다.");
                    }
                });
            });
        });
    </script>
</head>

<body>
    <div class="commune-form-wrapper">
        <div class="container">
            <h2 class="title">커뮤니티 글 수정</h2>

            <form method="post" id="upb">
                <!-- 제목 -->
                <div class="form-section">
                    <label for="subject" class="form-label">제목</label>
                    <input type="text" id="subject" name="subject" class="form-control"
                           value="${vo.subject}" placeholder="제목을 입력하세요" required>
                    <input type="hidden" name="bno" id="bno" value="${vo.bno}">
                </div>

                <!-- 내용 -->
                <div class="form-section">
                    <label for="content" class="form-label">내용</label>
                    <textarea id="content" name="content" class="form-control" rows="8"
                              placeholder="내용을 입력하세요" required>${vo.content}</textarea>
                </div>

                <!-- 해시태그 -->
                <div class="form-section">
                    <label class="form-label">해시태그</label>
                    <div class="hashtags-wrap">
                        <input type="checkbox" id="tag1" name="hashtag" value="#신입"
                               <c:if test="${fn:contains(vo.hashtag, '#신입')}">checked</c:if>>
                        <label for="tag1" class="hashtag-label">#신입</label>

                        <input type="checkbox" id="tag2" name="hashtag" value="#취업"
                               <c:if test="${fn:contains(vo.hashtag, '#취업')}">checked</c:if>>
                        <label for="tag2" class="hashtag-label">#취업</label>

                        <input type="checkbox" id="tag3" name="hashtag" value="#이직"
                               <c:if test="${fn:contains(vo.hashtag, '#이직')}">checked</c:if>>
                        <label for="tag3" class="hashtag-label">#이직</label>

                        <input type="checkbox" id="tag4" name="hashtag" value="#잡담"
                               <c:if test="${fn:contains(vo.hashtag, '#잡담')}">checked</c:if>>
                        <label for="tag4" class="hashtag-label">#잡담</label>

                        <input type="checkbox" id="tag5" name="hashtag" value="#면접"
                               <c:if test="${fn:contains(vo.hashtag, '#면접')}">checked</c:if>>
                        <label for="tag5" class="hashtag-label">#면접</label>

                        <input type="checkbox" id="tag6" name="hashtag" value="#자소서"
                               <c:if test="${fn:contains(vo.hashtag, '#자소서')}">checked</c:if>>
                        <label for="tag6" class="hashtag-label">#자소서</label>

                        <input type="checkbox" id="tag7" name="hashtag" value="#커리어"
                               <c:if test="${fn:contains(vo.hashtag, '#커리어')}">checked</c:if>>
                        <label for="tag7" class="hashtag-label">#커리어</label>
                    </div>
                </div>

                <!-- 버튼 -->
                <div class="d-flex gap-3">
                    <button type="button" class="btn btn-cancel w-50" onclick="history.back()">취소하기</button>
                    <button type="button" class="btn btn-submit w-50" id="updateBtn">수정하기</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
