<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
function map(){
	Shadowbox.open({
		content:'../com/map.do',
		player:'iframe',
		width:800,
		height:600,
		title:'기업 위치'
	})
}
</script>
</head>
<body>
		<!-- Job Detail Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gy-5 gx-4">
                    <div class="col-lg-12">
                    	<div class="row bg-light justify-content-center">
                    		<c:if test="${vo.dbestdate!=null }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-clock-history text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>설립일</span><br>
	                    			<span>${vo.dbestdate }</span>
	                    		</div>
                    		</c:if>
                    		<c:if test="${vo.c_type!=null }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-buildings text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>기업형태</span><br>
	                    			<span>${vo.c_type }</span>
	                    		</div>
                    		</c:if>
                    		<c:if test="${vo.ecount!=null }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-currency-exchange text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>사원수</span><br>
	                    			<span>${vo.ecount }</span>
	                    		</div>
                    		</c:if>
                    		<c:if test="${vo.take!=0 }">
	                    		<div class="col-2 text-center">
	                    			<span><i class="bi-clock-history text-primary me-2" style="font-size: 50px"></i></span><br>
	                    			<span>매출</span><br>
	                    			<span>
		                    			<c:if test="${vo.jo!=0 }">${vo.jo }조</c:if>
										<c:if test="${vo.uk!=0 }">${vo.uk }억</c:if>
										<c:if test="${vo.man!=0 }">${vo.man }만</c:if>
	                    			</span>
	                    		</div>
                    		</c:if>
                    	</div>
                    	<div class="row">
                   			<c:if test="${vo.industry!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				업종
	                    			</div>
	                    			<div class="col-9">${vo.industry }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.representative!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				대표자명
	                    			</div>
	                    			<div class="col-9">${vo.representative }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.homepage!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				홈페이지
	                    			</div>
	                    			<div class="col-9">${vo.homepage }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.bu_details!=null }">
	                    		<div class="row col-6">
	                    			<div class="col-3">
	                    				사업내용
	                    			</div>
	                    			<div class="col-9">${vo.bu_details }</div>
	                    		</div>
                   			</c:if>
                   			<c:if test="${vo.address!=null }">
		                   		<div class="row col-6">
		                   			<div class="col-3">
		                   				주소
		                   			</div>
		                   			<div class="col-9">
		                   				${vo.address }
		                   				<a href="javascript:map()" class="btn btn-outline-primary" style="border: 1px solid; border-radius: 2px;cursor: pointer;">
		                   					<i class="bi-map-fill"></i>지도
		                   				</a>
		                   			</div>
		                   		</div>
                   			</c:if>
                    	</div>
                        <div class="row mb-5">
                        	<c:if test="${vo.introduction != null }">
	                            <h4 class="mb-3">기업 소개</h4>
	                            <p>${vo.introduction }</p>
                        	</c:if>
                        	<c:if test="${vo.history != null }">
	                            <h4 class="mb-3">연혁</h4>
	                            <table class="table">
	                            	<tr><td colspan="2"></td></tr>
	                            	<c:forEach var="history" items="${hList }" varStatus="i">
                            			<tr>
		                            		<c:forEach var="year" items="${yList }" varStatus="j">
	                            				<c:if test="${cList[j.index]==i.index }">
	                            					<td rowspan="${cList[j.index+1]==null?hList.size()-cList[j.index]:cList[j.index+1]-cList[j.index] }" width="10%">
	                            						<i class="fa fa-angle-right text-primary me-2"></i>${year }
	                            					</td>
	                            				</c:if>
		                            		</c:forEach>
	                           				<td width="90%">
	                           					${history }
	                           				</td>
                            			</tr>
	                            	</c:forEach>
	                            </table>
                        	</c:if>
                        	<c:if test="${wList[0] != null }">
	                            <h4 class="mb-3">복지</h4>
	                            <div class="row">
	                            <c:forEach var="tag" items="${wTag }" varStatus="i">
	                            	<div class="col-lg-3">
	                            		<h6><i class="bi-${icons[i.index]} text-primary me-2"></i>${tag.name }</h6>
	                            		<ul>
	                            			<c:forEach var="vo" items="${wList }">
	                            				<c:if test="${i.index+1==vo.wno2 }">
			                            			<li>${vo.name }</li>
	                            				</c:if>
	                            			</c:forEach>
	                            		</ul>
	                            	</div>
	                            </c:forEach>
	                            </div>
                        	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Job Detail End -->
        
</body>
</html>