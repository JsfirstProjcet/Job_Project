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
            max-width: 900px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 { 
            color: #343a40;
            font-size: 28px;
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
            font-weigth: bold;
            transition: color 0.3s ease;
        }
        .breadcrumb a:hover{
        	color: #004d00;
        }
        .table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
    margin-top: 20px;
}

.table th, .table td {
    padding: 15px;
    border: none;
    text-align: center;
}

.table th {
    background-color: green;
    color: white;
    font-weight: 700;
    text-transform: uppercase;
}

.table tr {
    background: white;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.table tr:hover {
    background-color: rgba(0, 128, 0, 0.15);
    box-shadow: 0px 6px 10px rgba(0, 128, 0, 0.2);
    transform: translateY(-3px);
}

.table tr td:first-child {
    font-weight: bold;
    color: #007bff;
}

.table td a {
    color: #333;
    text-decoration: none;
    font-weight: 500;
}

.table td a:hover {
    color: green;
    text-decoration: underline;
}
        .pagination {
        	display: flex;
        	justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            margin: 0 5px;
            font-weight: bold;
            transition: background 0.3s ease-in-out;
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