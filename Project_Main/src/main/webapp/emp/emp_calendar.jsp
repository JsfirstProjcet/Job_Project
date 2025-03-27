<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 공고</title>
<style type="text/css">
.rdays_can:hover{
   cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
    // 연도 및 월 선택 시 AJAX 요청
    $('#year, #month').change(function(){
        let year = $('#year').val()
        let month = $('#month').val()

        // 서버로 AJAX 요청
        $.ajax({
            type: 'POST',
            url: '../emp/emp_calendar.do',
            data: { "year": year, "month": month },
            success: function(result) {
                // HTML 업데이트는 서버에서 보내준 응답을 통해 처리
                // 결과는 이미 새로 갱신된 HTML로 반환되므로 그 부분을 DOM에 삽입
                $('#emp_list').html(result)
            },
            error: function(request, status, error) {
                console.log("Error:", error)
            }
        });
    });

    // 날짜 클릭 시 AJAX 요청
    $('.days_can').click(function(){
        let year = $(this).attr("data-year")
        let month = $(this).attr("data-month")
        let day = $(this).attr("data-day")

        // 날짜 선택 시 요청
        $.ajax({
            type: 'POST',
            url: '../emp/emp_calendar_print.do',
            data: { "year": year, "month": month, "day": day },
            success: function(result) {
                // 결과로 넘어온 HTML로 emp_list 영역을 갱신
                $('#emp_list').html(result) 
            },
            error: function(request, status, error) {
                console.log("Error:", error)
            }
        })
    })
})
</script>
</head>
<body>
   <table class="table">
     <tr>
       <td class="text-center" id="tds">${year}년도 ${month}월</td>
     </tr>
     <tr>
       <td>
         <select name="year" id="year" class="form-control-sm">
           <c:forEach var="i" begin="2025" end="2030">
             <option ${i==year?"selected":"" }>${i }</option>
           </c:forEach>
         </select>년도 &nbsp;
         <select name="month" id="month" class="form-control-sm">
           <c:forEach var="i" begin="1" end="12">
             <option ${i==month?"selected":"" }>${i }</option>
           </c:forEach>
         </select>월
       </td>
     </tr>
   </table>
   <div style="height: 10px"></div>
	<table class="table">
	    <tr class="table-danger">
	        <c:forEach var="i" items="${weeks }" varStatus="s">
	            <th class="text-center"><span>${i}</span></th>
	        </c:forEach>
	    </tr>
	
	    <c:set var="week" value="${week}" />
	    <c:forEach var="i" begin="1" end="${lastday}">
	        <c:if test="${i == 1}">
	            <tr>
	                <c:forEach var="j" begin="1" end="${week}">
	                    <td class="text-center" height="35">&nbsp;</td>
	                </c:forEach>
	        </c:if>
	
	        <c:if test="${rday[i] == 1}">
	            <td class="text-center ${i == day ? 'table-success' : 'table-danger'}" height="35">
	                <span style="font-weight: bold;" class="days_can" data-year="${year}" data-month="${month}" data-day="${i}">
	                    ${i}
	                </span>
	            </td>
	        </c:if>
	
	        <c:if test="${rday[i] == 0}">
	            <td class="text-center ${day == i ? 'table-success' : ''}" height="35">
	                <span style="color:gray;">${i}</span>
	            </td>
	        </c:if>
	
	        <c:set var="week" value="${week + 1}" />
	        <c:if test="${week > 6}">
	            <c:set var="week" value="0" />
	            </tr>
	            <tr>
	        </c:if>
	    </c:forEach>
	</table>
	<div id="emp_list">
	    <c:choose>
	        <c:when test="${empty list}">
	            <p>검색된 공고가 없습니다.</p>
	        </c:when>
	        <c:otherwise>
	            <c:forEach var="vo" items="${list}">
	                <div class="job-item p-4 mb-4">
	                    <div class="row g-4">
	                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
	                            <div class="text-start ps-4">
	                                <h5 class="mb-3">
	                                    <a href="../emp/emp_detail.do?no=${vo.eno}" class="text-decoration-none text-dark">${vo.title}</a>
	                                </h5>
	                                <span class="text-truncate me-3"><i class="far fa-building text-primary me-2"></i>${vo.name}</span>
	                                <span class="text-truncate me-3"><i class="far fa-heart text-danger me-2"></i>${vo.fo_count}</span>
	                                <span class="text-truncate me-3"><i class="fas fa-user-tie text-primary me-2"></i>${vo.se_count}</span>
	                                <span class="text-truncate me-3"><i class="fas fa-project-diagram text-primary me-2"></i>${vo.emp_type}</span>
	                                <span class="text-truncate me-0"><i class="fas fa-suitcase text-primary me-2"></i>${vo.loc}</span>
	                            </div>
	                        </div>
	                        <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
	                            <div class="d-flex mb-3">
	                                <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
	                                <a class="btn btn-primary" href="../emp/emp_detail.do?no=${vo.eno}">Detail</a>
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
	            </c:forEach>
	        </c:otherwise>
	    </c:choose>
	</div>
</body>
</html>
