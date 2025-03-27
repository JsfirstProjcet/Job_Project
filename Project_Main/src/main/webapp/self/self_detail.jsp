<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.job-summary i {
  color: green;
  margin-right: 5px;
}
.title-box h3 {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 500px;
}
.content-box {
  background: white;
  border-radius: 12px;
  padding: 25px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  word-wrap: break-word;
  white-space: normal;
}
.content-box p {
  white-space: pre-line;
  text-align: justify;
  margin-bottom: 10px;
}
.right-box {
    background: #f8f9fa;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
        <div class="container-xxl py-5 bg-dark page-header mb-5">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">자기소개서 샘플 상세페이지</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item"><a href="../self/self_list.do">자기소개서 샘플</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">자기소개서 샘플 상세</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Header End -->
        <!-- Job Detail Start -->
        
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gy-5 gx-4">
                    <div class="col-lg-10 mx-auto">
                        <div class="d-flex align-items-center mb-3">
                            <img class="flex-shrink-0 img-fluid border rounded" src="https://${vo.poster }" alt="" style="width: 80px; height: 80px;">
                            <div class="title-box ms-3">
                                <h3 class="mb-1">${vo.title }</h3>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="job-summary">
                                <i class="fa fa-eye"></i> 조회수: ${vo.hit}
                            </div>
                        </div>
                        <div class="content-box">
    					<pre style="white-space:pre-wrap;border:none;background-color: white">${vo.content}</pre>
						</div>
                        <a class="btn btn-primary" href="../write/write_update.do?sno=${vo.sno }">작성해보기</a>
                        <div class="text-end mt-3">
                    <a href="javascript:history.back()" class="btn btn-sm btn-primary">목록</a>
                </div>
                    </div>       
                </div>
            </div>
        </div>
</body>
</html>
