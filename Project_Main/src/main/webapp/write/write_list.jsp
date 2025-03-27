<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>작성 목록</title>
<style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .containerd {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 { 
            color: #343a40;
            font-size: 26px;
            font-weight: 700;
        }
        .breadcrumb {
            font-size: 14px;
            color: green;
            text-align: center;
            margin-bottom: 20px;
        }
        .breadcrumb a {
            color: green;
            text-decoration: none;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .table th, .table td {
            padding: 12px;
            border: 1px solid #dee2e6;
            text-align: center;
        }
        .table th {
            background-color: green;
            color: white;
            font-weight: 600;
        }
        .table tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .pagination {
            text-align: right;
            margin-top: 20px;
        }
        .pagination a {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }
        .pagination a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<div class="container-xxl py-5 bg-dark page-header mb-5">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">자기소개서 작성 목록</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">자기소개서 샘플</li>
                    </ol>
                </nav>
            </div>
        </div>
    <div class="containerd">
        <div class="header">
            <h1>작성 목록</h1>
            <div class="breadcrumb">
                <a href="../main/main.do">Home</a> &gt; 
                <a href="#">커뮤니티</a>
            </div>
        </div>

        <table class="table">
            <tr>
                <th width="10%">번호</th>
                <th width="50%">제목</th>
                <th width="20%">등록 이름</th>
            </tr>
            <c:forEach var="vo" items="${list}">
                <tr>
                    <td>${vo.sno}</td>
                    <td><a href="../write/write_detail.do?sno=${vo.sno}&page=${curpage}">${vo.title}</a></td>
                    <td>${vo.name}</td>
                </tr>
            </c:forEach>
        </table>

        <div class="pagination">
            <a href="../write/write_list.do?page=${curpage>1?curpage-1:curpage}">이전</a>
            ${curpage} page / ${totalpage} pages
            <a href="../write/write_list.do?page=${curpage<totalpage?curpage+1:curpage}">다음</a>
        </div>
        
    </div>
</body>
</html>