<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="../main/main.do"
       class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5">
        <h1 class="m-0 text-primary">JobPro</h1>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="../main/main.do" class="nav-item nav-link active">Home</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">공고</a>
                <div class="dropdown-menu rounded-0 m-0">
                    <a href="../emp/emp_list.do" class="dropdown-item">공고 목록</a>
                    <a href="../emp/emp_find_home.do" class="dropdown-item">공고 검색</a>
                    <a href="../emp/emp_calendar.do" class="dropdown-item">실시간 공고</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">기업</a>
                <div class="dropdown-menu rounded-0 m-0">
                    <a href="../company/com_list.do" class="dropdown-item">기업 목록</a>
                    <a href="../company/com_find.do" class="dropdown-item">기업 검색</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                <div class="dropdown-menu rounded-0 m-0">
                    <a href="../chat/chat.do" class="dropdown-item">실시간 채팅</a>
                    <a href="../interview/commune.do" class="dropdown-item">묻고답하기</a>
                    <a href="../interview/interview_list.do" class="dropdown-item">인터뷰</a>
                    <a href="../interview/interview_find.do" class="dropdown-item">인터뷰 찾기</a>
                    <a href="../sal/calculator.jsp" class="dropdown-item">연봉계산기</a>
                    <a href="../self/self_list.do" class="dropdown-item">자기소개서 샘플</a>
                    <a href="../self/self_find.do" class="dropdown-item">자소서 검색</a>
                    <a href="../write/write_list.do" class="dropdown-item">자소서 작성 목록</a>
                </div>
            </div>
            <a href="../service/main.do" class="nav-item nav-link">
                고객센터
            </a>
            <c:if test="${sessionScope.cid!=null }">
                <div class="nav-item dropdown">
                    <a href="../company/com_main.do" class="nav-item nav-link active">기업페이지</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.id!=null and sessionScope.isadmin==0 }">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="#" class="dropdown-item">계정 관리</a>
                        <a href="../mypage/mypage_follow.do" class="dropdown-item">팔로우 관리</a>
                        <a href="../mypage/mypage_recruit.do" class="dropdown-item">지원 관리</a>
                        <a href="../resume/resume.do" class="dropdown-item">이력서</a>
                    </div>
                </div>
            </c:if>
        </div>
        <div id="sign" class="d-lg-block">
            <c:if test="${sessionScope.email==null }">
                <div id="sign" class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="javascript:login()"
                       class="btn btn-primary px-4 d-flex align-items-center">로그인</a>
                    <a href="../personal/join.do"
                       class="btn btn-primary px-4 d-flex align-items-center">회원가입</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.email!=null}">
                <div class="navbar-nav ms-auto p-4 p-lg-0 d-flex align-items-center">
                    <c:if test="${sessionScope.isadmin == 0 }">
                        <div class="btn btn-outline-primary text-center me-3 px-3 py-2">
                            <span class="d-block fw-bold"><b>${sessionScope.name}</b></span>
                            <span class="d-block small text-muted">님</span>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.isadmin == 1 }">
                        <div onclick="location.href = '/Project_Main/admin/main.do';"
                             class="btn btn-outline-primary text-center me-3 px-3 py-2">
                            <span class="d-block fw-bold"><b>${sessionScope.name}</b></span>
                            <span class="d-block small text-muted">(관리자)</span>
                        </div>
                    </c:if>
                    <a href="../personal/logout.do"
                       class="btn btn-primary px-4 d-flex align-items-center">로그아웃</a>
                </div>
            </c:if>
        </div>
    </div>
</nav>
<!-- Navbar End -->

<!-- Top Background Image Wrapper
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.do">JOBPRO</a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="../main/main.do">메인</a></li>
        <li><a class="drop" href="#">공고</a>
          <ul>
            <li><a href="../emp/emp_list.do">공고 목록</a></li>
            <li><a href="../emp/emp_find.do">공고 검색</a></li>
            <li><a href="#">실시간 공고</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">기업</a>
          <ul>
            <li><a href="../company/com_list.do">기업 목록</a></li>
            <li><a href="../company/com_find.do">기업 검색</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">커뮤니티</a>
          <ul>
            <li><a href="#">기업 목록</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">마이페이지</a>
          <ul>
             <li><a href="#">MY</a></li>
            <li><a href="#">계정</a></li>
            <li><a href="#">리뷰</a></li>
            <li><a href="../resume/resume.do">이력서</a></li>
            <li><a href="#">멤버십/결제</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">Dropdown</a>
          <ul>
            <li><a href="#">Level 2</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
            <li><a href="#">Level 2</a></li>
          </ul>
        </li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
      </ul>
    </nav>
  </header>
  -->
</body>
</html>
