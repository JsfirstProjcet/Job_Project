<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
let activeTab=''
Shadowbox.init({
	players:['iframe']
})
function getMemberStr(){
	activeTab=$('#loginTabs .nav-link.active').attr('data-bs-target'); // 현재 활성화된 탭
	return activeTab.substr(1)
}
$(function(){
    Shadowbox.init()
    //activeTab=$('#loginTabs .nav-link.active').attr('data-bs-target')
    //$('button[data-bs-toggle="tab"]').on('shown.bs.tab', function(event) {
    //	activeTab=$(event.target).attr('data-bs-target')
    //});
	$('.idBtn').on('click',function(){
		Shadowbox.open({
			content:'../personal/emailcheck.do',
			player:'iframe',
			width:400,
			height:280,
			title:'이메일중복체크'
		})
	})
})
</script>
</head>
<body>
        <!-- Header Start -->
        <div class="container-xxl py-5 bg-dark page-header mb-5">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">회원가입</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">회원가입</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Header End -->
        
<div style="margin: 100px;">
  <!-- 탭 메뉴 -->

  <ul class="nav nav-tabs" id="loginTabs">
      <li class="nav-item">
          <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#personal">개인회원</button>
      </li>
      <li class="nav-item">
          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#official">기업회원</button>
      </li>
  </ul>

  <!-- 로그인 폼 -->
  <div class="tab-content mt-3" style="width: 800px">
    <!-- 개인회원 -->
    <div class="tab-pane fade show active" id="personal">
	  <jsp:include page="../member/join_personal.jsp"/>
    </div>
      
	  <!-- 기업회원 -->
    <div class="tab-pane fade" id="official">
	  <jsp:include page="../member/join_official.jsp"/>
    </div>
  </div>
</div>

</body>
</html>