<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<!-- Carousel Start -->
<div class="container-fluid p-0">
    <div class="owl-carousel header-carousel position-relative">
        <div class="owl-carousel-item position-relative">
            <img class="../img-fluid" src="../img/carousel-3.jpg" alt="">
            <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center"
                 style="background: rgba(43, 57, 64, .5);">
            </div>
        </div>
    </div>
</div>
<!-- Carousel End -->

<!-- Search Start -->
<form action="../emp/emp_find.do" method="get">
    <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s"
         style="padding: 35px;">
        <div class="container">
            <div class="row g-2">
                <div class="col-md-10">
                    <div class="row g-2">
                        <div class="col-md-4">
                            <input type="text" class="form-control border-0" name="keyword"
                                   value="${param.keyword}" placeholder="Keyword"/>
                        </div>
                        <div class="col-md-4">
                            <select class="form-select border-0" name="jno">
                                <option selected disabled>직업별</option>
                                <c:forEach var="jvo" items="${tList }">
                                    <option value="${jvo.jno }">${jvo.name }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-select border-0" name="loc">
                                <option value="">지역별</option>
                                <option value="18" ${param.loc == '18' ? 'selected' : ''}>전국
                                </option>
                                <option value="1" ${param.loc == '1' ? 'selected' : ''}>서울</option>
                                <option value="2" ${param.loc == '2' ? 'selected' : ''}>경기</option>
                                <option value="3" ${param.loc == '3' ? 'selected' : ''}>광주</option>
                                <option value="4" ${param.loc == '4' ? 'selected' : ''}>대구</option>
                                <option value="5" ${param.loc == '5' ? 'selected' : ''}>대전</option>
                                <option value="6" ${param.loc == '6' ? 'selected' : ''}>부산</option>
                                <option value="7" ${param.loc == '7' ? 'selected' : ''}>울산</option>
                                <option value="8" ${param.loc == '8' ? 'selected' : ''}>인천</option>
                                <option value="9" ${param.loc == '9' ? 'selected' : ''}>강원</option>
                                <option value="10" ${param.loc == '10' ? 'selected' : ''}>경남
                                </option>
                                <option value="11" ${param.loc == '11' ? 'selected' : ''}>경북
                                </option>
                                <option value="12" ${param.loc == '12' ? 'selected' : ''}>전남
                                </option>
                                <option value="13" ${param.loc == '13' ? 'selected' : ''}>전북
                                </option>
                                <option value="14" ${param.loc == '14' ? 'selected' : ''}>충북
                                </option>
                                <option value="15" ${param.loc == '15' ? 'selected' : ''}>충남
                                </option>
                                <option value="16" ${param.loc == '16' ? 'selected' : ''}>제주
                                </option>
                                <option value="17" ${param.loc == '17' ? 'selected' : ''}>세종
                                </option>
                                <option value="19" ${param.loc == '19' ? 'selected' : ''}>해외
                                </option>
                                <option value="20" ${param.loc == '20' ? 'selected' : ''}>기타
                                </option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-dark border-0 w-100" type="submit">Search</button>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="container-xxl py-5">
    <div class="container">
        <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Explore By Job</h1>
        <div class="row g-4">
            <c:forEach var="jvo" items="${tList }" varStatus="i">
                <div class="col-2  wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-2" href="../emp/emp_find.do?jno=${jvo.jno }"
                       style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">
                        <i class="fa ${icons[jvo.jno] } text-primary mb-2"></i>
                        <span>${jvo.name }</span>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Category End -->




<!-- Jobs Start -->
<div class="container-xxl py-5">
    <div class="container">
        <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Employment Listing</h1>
        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <c:forEach var="vo" items="${eList }" varStatus="s">
                        <c:if test="${s.index>3 }">
                            <div class="job-item p-4 mb-4">
                                <div class="row g-4">
                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                        <div class="text-start ps-4">
                                            <h5 class="mb-3">
                                                <a href="../emp/emp_detail.do?no=${vo.eno }"
                                                   class="text-decoration-none text-dark">${vo.title }</a>
                                            </h5>
                                            <span class="text-truncate me-3"><i
                                                    class="far fa-building text-primary me-2"></i>${vo.name }</span>
                                            <span class="text-truncate me-3"><i
                                                    class="far fa-heart text-danger me-2"></i>${vo.fo_count }</span>
                                            <span class="text-truncate me-3"><i
                                                    class="fas fa-user-tie text-primary me-2"></i>${vo.se_count }</span>
                                            <span class="text-truncate me-0"><i
                                                    class="fas fa-project-diagram text-primary me-2"></i>${vo.emp_type }</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                        <div class="d-flex mb-3">
                                            <a class="btn btn-light btn-square me-3" href=""><i
                                                    class="far fa-heart text-primary"></i></a>
                                            <a class="btn btn-primary" href="">Recruit</a>
                                        </div>
                                        <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>등록일 : 
											<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" />
										</small>
                                        <small class="text-truncate"><i class="far fa-calendar-times text-primary me-2"></i>마감일 : 
											<fmt:formatDate value="${vo.deadline}" pattern="yyyy-MM-dd" />
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <a class="btn btn-primary py-3 px-5" href="../emp/emp_list.do">Browse More
                        Employment</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Jobs End -->


<!-- Testimonial Start -->
<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container">
        <h1 class="text-center mb-5">이런 글은 어때요?</h1>
        <div class="owl-carousel testimonial-carousel">
            <c:forEach var="tvo" items="${topList }">
                <div class="testimonial-item bg-light rounded p-4 position-relative"
                     style="height: 220px; display: flex; flex-direction: column; justify-content: space-between;">
                    <!-- 인기글 배지 -->
                    <span class="badge bg-danger position-absolute me-2 rounded-pill"
                          style="top: 15px; left: 20px; z-index: 1;">
						        인기글
						      </span>
                    <div>
                        <a href="../interview/commune_detail.do?bno=${tvo.bno }">
                            <h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: black; margin-top: 20px;">${tvo.subject }</h5>
                            <p style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; color: black">${tvo.content }</p>
                        </a>
                    </div>
                    <div class="d-flex align-items-center mt-2">
                        <img class="../img-fluid flex-shrink-0 rounded" src="../img/${tvo.poster }"
                             style="width: 50px; height: 50px;">
                        <div class="ps-3">
                            <h5 class="mb-1">${tvo.nickname}</h5>
                            <small>${tvo.dbday }</small>

                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</div>
<!-- Testimonial End -->


<!--
<div id="pageintro" class="hoc clear">
    <article>
      <h3 class="heading">대기업 공고</h3>
    </article>
  </div>
<!-- End Top Background Image Wrapper --
<div class="wrapper row3">
  <main class="hoc container clear">
    <!-- main body --
    <section id="introblocks">
      <ul class="nospace group grid-3">
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="../images/demo/348x220.png" alt=""></a>
            <figcaption><a href="#">Aliquam faucibus</a></figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="../images/demo/348x220.png" alt=""></a>
            <figcaption><a href="#">Aliquam faucibus</a></figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="../images/demo/348x220.png" alt=""></a>
            <figcaption><a href="#">Aliquam faucibus</a></figcaption>
          </figure>
        </li>
      </ul>
    </section>
    <!-- / main body --
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="sectiontitle">
      <p class="nospace font-xs">지금바로 지원하라!!</p>
      <h6 class="heading">주목해야할 채용 공고</h6>
    </div>
    <figure>
      <ul class="nospace group grid-3">
        <li class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a></li>
        <li class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a></li>
        <li class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a></li>
        <li class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a></li>
        <li class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a></li>
        <li class="one_third"><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a></li>
      </ul>
    </figure>
  </section>
</div>
<div class="wrapper row2">
  <section class="hoc container clear">
    <div class="sectiontitle">
      <p class="nospace font-xs">현직자의 지혜를 빌려보자</p>
      <h6 class="heading">현직자 인터뷰</h6>
    </div>
    <ul id="latest" class="nospace group sd-third">
      <li class="one_third first">
        <article>
          <figure><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a>
            <figcaption>
              <h6 class="heading">Nisl nullam odio justo pharetra</h6>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-06T08:15+00:00">06 Apr 2045</time>
                </li>
              </ul>
            </figcaption>
          </figure>
          <p>Et sagittis ac dignissim nec metus proin nunc maecenas vel nulla vivamus mattis massa vitae metus proin nunc maecenas vel nulla vivamus mattis massa vitae.</p>
          <footer><a href="#">Read More</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a>
            <figcaption>
              <h6 class="heading">Nisl nullam odio justo pharetra</h6>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-05T08:15+00:00">05 Apr 2045</time>
                </li>
              </ul>
            </figcaption>
          </figure>
          <p>Et sagittis ac dignissim nec metus proin nunc maecenas vel nulla vivamus mattis massa vitae metus proin nunc maecenas vel nulla vivamus mattis massa vitae.</p>
          <footer><a href="#">Read More</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><a class="imgover" href="#"><img src="../images/demo/348x261.png" alt=""></a>
            <figcaption>
              <h6 class="heading">Nisl nullam odio justo pharetra</h6>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-04T08:15+00:00">04 Apr 2045</time>
                </li>
              </ul>
            </figcaption>
          </figure>
          <p>Et sagittis ac dignissim nec metus proin nunc maecenas vel nulla vivamus mattis massa vitae metus proin nunc maecenas vel nulla vivamus mattis massa vitae.</p>
          <footer><a href="#">Read More</a></footer>
        </article>
      </li>
    </ul>
  </section>
</div>
-->
</body>
</html>