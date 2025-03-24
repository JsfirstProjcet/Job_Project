<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OJT 채용연계 프로그램</title>

    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #111;
            color: #fff;
        }

        .ojt-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 20px;
            background-color: #111;
            position: relative;
        }

        .ojt-content {
            display: flex;
            align-items: center;
            justify-content: center;
            max-width: 1200px;
            width: 100%;
            flex-wrap: wrap;
        }

        .ojt-image {
            flex: 1 1 300px;
            text-align: center;
        }

        .ojt-image img {
            width: 80%;
            max-width: 400px;
        }

        .ojt-text {
            flex: 1 1 500px;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        .ojt-text h1 {
            font-size: 32px;
            font-weight: 700;
            color: #f9f871;
            margin-bottom: 20px;
            line-height: 1.4;
        }

        .ojt-text p {
            font-size: 16px;
            line-height: 1.8;
            color: #ddd;
        }

        /* 하단 버튼 */
        .ojt-footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.85);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.5);
            z-index: 1000;
        }

        .ojt-footer .price {
            color: #fff;
            font-size: 14px;
        }

        .ojt-footer .price del {
            color: #999;
        }

        .ojt-footer .buttons {
            display: flex;
            gap: 10px;
        }

        .ojt-footer button {
            border: none;
            border-radius: 30px;
            padding: 12px 24px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
        }

        .ojt-footer .btn-join {
            background: #6f4ef2;
            color: #fff;
        }

        .ojt-footer .btn-join:hover {
            background: #5b3dcf;
        }

        .ojt-footer .btn-inquiry {
            background: #fff;
            color: #6f4ef2;
            border: 2px solid #6f4ef2;
        }

        .ojt-footer .btn-inquiry:hover {
            background: #f0f0f0;
        }

        @media (max-width: 768px) {
            .ojt-content {
                flex-direction: column;
            }

            .ojt-text h1 {
                font-size: 24px;
            }

            .ojt-footer {
                flex-direction: column;
                gap: 10px;
            }

            .ojt-footer .buttons {
                width: 100%;
                flex-direction: column;
                gap: 10px;
            }

            .ojt-footer button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <section class="ojt-section">
        <div class="ojt-content">
            <!-- 왼쪽 이미지 -->
            <div class="ojt-image">
                <img src="../img/vip.png" alt="다트 이미지">
            </div>

            <!-- 가운데 텍스트 -->
            <div class="ojt-text">
                <h1>지금 서비스 기획 트랙 합류 시<br>기업 OJT 채용연계 기회 제공</h1>
                <p>우수 기술 인력을 확보하기 위해 전문 훈련기관과 협력하여 소프트웨어(SW) 인력을 양성하고 채용을 연계하는 프로그램입니다.<br><br>
                교육 과정 중 기업 OJT 기회 제공하며, 희망하는 경우 OJT를 진행한 기업 취업연계를 제안받을 수 있습니다.</p>
            </div>

            <!-- 오른쪽 이미지 -->
            <div class="ojt-image">
                <img src="https://cdn.pixabay.com/photo/2020/01/19/13/38/target-4771735_1280.jpg" alt="다트 이미지">
            </div>
        </div>
    </section>

    <!-- 하단 고정 버튼 -->
    <div class="ojt-footer">
        <div class="price">
            수강료 <del>₩1,169,900</del> <strong style="color:#6f4ef2;">수강료 전액 무료</strong><br>
            5기 모집 마감까지 <strong style="color:#f87171;">1일 1분 55초</strong> 남았습니다.
        </div>
        <div class="buttons">
            <button class="btn-join">지금 합류하기</button>
            <button class="btn-inquiry">문의하기</button>
        </div>
    </div>

</body>
</html>
