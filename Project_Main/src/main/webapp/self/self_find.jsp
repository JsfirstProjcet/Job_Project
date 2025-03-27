<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   String
   StringBuffer
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .single-post {
        position: relative;
        overflow: hidden;
        border-radius: 15px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background: #fff;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
    }

    .single-post:hover {
        transform: scale(1.02);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    }

    .post-thumb {
        text-align: center;
        margin-bottom: 8px;
    }

    .post-thumb img {
        width: auto;
        height: 30px;
        object-fit: cover;
        border-radius: 10px;
        transition: transform 0.3s ease;
    }

    .single-post:hover .post-thumb img {
        transform: scale(1.05);
    }

    .post-content {
        text-align: center;
    }

    .post-headline {
        font-size: 12px;
        font-weight: 500;
        margin: 5px 0 0;
        transition: color 0.3s ease;
    }

    .post-headline:hover {
        color: #FF6F61;
    }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#ss').val('')
	commons(1)
	
	$('#findBtn').click(function(){
		commons(1)
	})
	$('#ss').keydown(function(e){
		if(e.keyCode==13)
		{
			commons(1)
		}
	})
})
function commons(page)
{
	let fd=$('#fd').val()
	let ss=$('#ss').val()
	$.ajax({
		type:'post',
		url:'../self/self_find_ajax.do',
		data:{"fd":fd,"ss":ss,"page":page},
		success:function(result){
			//$('#view').text(result)
		  	let json=JSON.parse(result)
		  	
		  	jsonView(json)
		}
	})
}
function prev(page)
{
	commons(page)
}
function next(page)
{
	commons(page)
}
function pageChange(page)
{
	commons(page)
}
function jsonView(json)
{
	// 이미지 
	let html=''
	json.map(function(self){
		html+='<div class="col-12 col-md-6 col-lg-4">'
		+'<div class="single-post wow fadeInUp" data-wow-delay="0.1s">'
        +'<div class="post-thumb">'
        +'<a href="../self/self_detail_before.do?sno='+self.sno+'">'
        +'<img src="https://'+self.poster+'" alt="">'
        +'<a href="../self/self_detail_before.do?sno='+self.sno+'">'
        +'<h4 class="post-headline">'+self.title+'</h4>'
    +'</a>'
        +'</a>'
        +'</div>'
        +'<div class="post-content">'
        +'<div class="post-meta d-flex">'
        +'<div class="post-author-date-area d-flex">'
        +'<div class="post-author">'
        +'</div>'
        +'<div class="post-date">'
        +'<a href="../self/self_detail_before.do?sno='+self.content+'"</a>'
        +'</div>'
        +'</div>'
            +'</div>'
            +'</div>'
            +'</div>'
            +'</div>'
	})
	
	html+='<div class="col-12">'
	html+='<div class="pagination-area d-sm-flex mt-15">'
	html+='<nav aria-label="#">'
	html+='<ul class="pagination">'
      if(json[0].startPage>1)
      {
       html+='<li class="page-item">'
       html+='<a class="page-link" onclick="prev('+(json[0].startPage-1)+')">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>'
       html+='</li>'
      }
            
      for(let i=json[0].startPage;i<=json[0].endPage;i++)
      {
    	  if(json[0].curpage===i)
    	  {
    		  html+='<li class="page-item active"><a class="page-link" onclick="pageChange('+i+')">'+i+'</a></li>'
    	  }
    	  else
    	  {
    		  html+='<li class="page-item"><a class="page-link" onclick="pageChange('+i+')">'+i+'</a></li>'
    	  }
    	  
      }
            
            if(json[0].endPage<json[0].totalpage)
            {
            	html+='<li class="page-item">'
            	html+='<a class="page-link" onclick="next('+(json[0].endPage+1)+')">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>'
            	html+='</li>'
            }
            
            html+='</ul>'
            html+='</nav>'
            html+='<div class="page-status">'
            html+='<p>Page '+json[0].curpage+' of '+json[0].totalpage+' results</p>'
            html+='</div>'
            html+='</div>'
            html+='</div>'

	$('#view').html(html)
	// 페이지 
}
</script>
</head>
<body>
<div class="container-xxl py-5 bg-dark page-header mb-5">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">자기소개서 샘플 검색</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">자기소개서 샘플</li>
                    </ol>
                </nav>
            </div>
        </div>
<!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>자소서 검색</h2>
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
                            <li class="breadcrumb-item">
                             <select id="fd" class="form-control-sm">
                               <option value="title">기업명</option>
                             </select>
                             <input type=text size=15 id="ss" class="form-control-sm">
                             <input type=button value="검색" class="btn-sm btn-primary" id="findBtn">
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row" id="view">
               
                
              
            </div> 
        </div>
    </section>
    <!-- ****** Archive Area End ****** -->

</body>
</html>