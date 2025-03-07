<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <h6 class="heading">기업 검색</h6>
    <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->
	<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');"> 
	  <div class="wrapper row3">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                             <select id="fd" class="input-sm">
                               <option value="c_type">1000대기업</option>                                            
                               <option value="c_type">대기업</option>
                               <option value="c_type">중소기업</option>
                               <option value="c_type">중견기업</option>
                               <option value="c_type">스타트업</option>
                               <option value="c_type">기타</option>
                               <option value="address" selected>주소</option>
                             </select>
                             <input type=text size= id="ss" class="input-sm">
                             <input type=button value="검색" class="btn-sm btn-primary" id="findBtn">                                                          
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
  <!-- ################################################################################################ -->
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <header class="heading">기업 정보</header>
          <ul class="nospace clear">
            <li class="one_quarter first"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter first"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter first"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/01.png" alt=""></a></li>
          </ul>
        </figure>
      </div>
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
  </main>
</div>
</body>
</html>