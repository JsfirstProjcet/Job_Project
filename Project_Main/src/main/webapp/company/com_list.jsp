<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body id="top">
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div id="breadcrumb" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <h6 class="heading">기업 목록</h6>
    <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->

  <!-- ################################################################################################ -->
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
    <section class="archive-area section_padding_80">
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="container"> 
      <!-- ################################################################################################ -->
        <div class="row">
            <!-- Single Post -->
            <c:forEach var="vo" items="${list }">
            <div class="col-12 col-md-6 col-lg-4">
                <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                    <!-- Post Thumb -->
                    <div class="post-thumb">
                      <a href="../company/com_detail_before.do?cid=${vo.cid }">
                        <img src="https://pds.saramin.co.kr/company${vo.poster }" alt="">
                      </a>
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <div class="post-meta d-flex">
                            <div class="post-author-date-area d-flex">
                                <!-- Post Author -->
                                <div class="post-author">
                                    <a href="#">${vo.c_type }</a>
                                </div>
                                <!-- Post Date -->
                                <div class="post-date">
                                    <a href="#">${vo.estdate }</a>
                                </div>
                            </div>
                            <!-- Post Comment & Share Area -->
                            <div class="post-comment-share-area d-flex">
                                <!-- Post Favourite -->
                                <div class="post-favourite">
                                    <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>${vo.ecount }</a>
                                </div>
                                <!-- Post Comments -->
                                <div class="post-comments">
                                    <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>${vo.take }</a>
                                </div>
                                <!-- Post Share -->
                                <div class="post-share">
                                    <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                        <a href="../company/com_detail_before.do?cid=${vo.cid }">
                            <h4 class="post-headline">${vo.name }</h4>
                        </a>
                    </div>
                </div>
            </div>
           </c:forEach>
           </div>
           </div>
           </section>
      <!-- ################################################################################################ -->
      <!-- ################################################################################################ -->
      <nav class="pagination">
        <ul>
          <li><a href="#">&laquo; Previous</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><strong>&hellip;</strong></li>
          <li><a href="#">6</a></li>
          <li class="current"><strong>7</strong></li>
          <li><a href="#">8</a></li>
          <li><a href="#">9</a></li>
          <li><strong>&hellip;</strong></li>
          <li><a href="#">14</a></li>
          <li><a href="#">15</a></li>
          <li><a href="#">Next &raquo;</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
</div>
</body>
</html>