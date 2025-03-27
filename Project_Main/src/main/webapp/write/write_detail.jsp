<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기소개서 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bClick = false;
$(function(){
    $('#del').click(function(){
        if (bClick === false) {
            bClick = true;
            $(this).text("취소");
            $('#delTr').show();
        } else {
            bClick = false;
            $(this).text("삭제");
            $('#delTr').hide();
        }
    })

    $('#pwd').keyup(function(){
        let sno = $('#delTr').attr("data-sno");
        let pwd = $('#pwd').val();
        $.ajax({
            type: 'post',
            url: '../write/write_pwd_ajax.do',
            data:{"sno":sno,"pwd":pwd},
            success: function(result) 
            {
                let res = parseInt(result);
                if (res === 0) 
                {
                    $('#delBtn').hide();
                    $('#print').text('비밀번호가 틀립니다');
                } 
                else 
                {
                    $('#delBtn').show();
                    $('#print').text("");
                }
            }
        })
    })

    $('#delBtn').click(function(){
        let sno=$('#delTr').attr("data-sno");
        let page=$('#delTr').attr("data-page");
        $.ajax({
            type: 'post',
            url: '../write/write_delete_ajax.do',
            data: { "sno": sno },
            success: function(result) {
                if (result === 'yes') 
                {
                    location.href='../write/write_list.do?page='+page
                } 
                else 
                {
                    alert("게시물 삭제 실패하였습니다\n다시 시도하세요")
                }
            }
        })
    })
})
</script>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <h2>자기소개서 상세보기</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="breadcumb-nav">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">자기소개서 보기</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<section class="archive-area section_padding_80">
    <div class="container">
        <div class="row" style="width:800px; margin:0px auto">
            <table class="table">
                <tr>
                    <th class="text-center table-warning" width=20%>번호</th>
                    <td class="text-center" width=30%>${vo.sno }</td>
                </tr>
                <tr>
                    <th class="text-center table-warning" width=20%>제목</th>
                    <td class="text-center" width=30%>${vo.title }</td>
                </tr>
                <tr>
                    <th class="text-center table-warning" width=20%>이름</th>
                    <td class="text-center" width=30%>${vo.name }</td>
                </tr>
                <tr>
                    <td colspan="4" class="text-left" valign="top" height="200">
                        <p><strong>${vo.demand1 }</strong></p>
                        <pre style="white-space:pre-wrap;border:none;background-color: white">${vo.text1 }</pre>
                        
                        <p><strong>${vo.demand2 }</strong></p>
                        <pre style="white-space:pre-wrap;border:none;background-color: white">${vo.text2 }</pre>
                        
                        <p><strong>${vo.demand3 }</strong></p>
                        <pre style="white-space:pre-wrap;border:none;background-color: white">${vo.text3 }</pre>
                        
                        <p><strong>${vo.demand4 }</strong></p>
                        <pre style="white-space:pre-wrap;border:none;background-color: white">${vo.text4 }</pre>
                        
                        <p><strong>${vo.demand5 }</strong></p>
                        <pre style="white-space:pre-wrap;border:none;background-color: white">${vo.text5 }</pre>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="text-right">
                        <a href="../write/write_update.do?sno=${vo.sno }&page=${page}" class="btn btn-outline-info btn-xs">수정</a>
                        <span class="btn btn-outline-success btn-xs" id="del">삭제</span>
                        <a href="../write/write_list.do?page=${page }" class="btn btn-outline-warning btn-xs">목록</a>
                    </td>
                </tr>
                <tr id="delTr" style="display: none" 
                data-sno="${vo.sno }" data-page="${page }">
                    <td colspan="4" class="text-right">
                        비밀번호: <input type="password" size=15 class="form-control-sm" id="pwd">
                        <input type="button" value="삭제" class="btn-danger btn-sm" id="delBtn" style="display: none">
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="text-right">
                        <span style="color:red" id="print"></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</section>
</body>
</html>
