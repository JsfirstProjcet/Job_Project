<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript">
$(function(){
	if(${sessionScope.cid==null}){
		alert("기업계정으로 로그인 후 이용해주세요")
		location.href="../company/com_detail.do?cno="+${param.cno}
		return
	}else if(${sessionScope.cid!=vo.cid}){
		alert("접근한 기업정보를 수정할 권한이 없습니다")
		location.href="../company/com_detail.do?cno="+${param.cno}
		return
	}
	printHistory()
	wtabChange(1)
	$('.tab').hide()
	$('.tab-1').show()
	$('.tab-select').on('change',function(){
		let no=$(this).val()
		$('.tab').hide()
		$('.tab-'+no).show()
	})
	//매출액 입력 제한
	$(".take").on("input", function () {
		if($(this).val()<0){
			$(this).val(0)
		}
		if($(this).val()/1000>=1){
			if($(this).attr("id")==="jo"){
				$('#uk').focus()
			}else if($(this).attr("id")==="uk"){
				$('#man').focus()
			}
		}
		if($(this).val() > 9999){
			$(this).val(9999);
		}
	})
	
	// 다음 주소 검색
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data){
				$('#address').val(data.address)
			}
		}).open()
	})
	// 연혁 등록 날짜 지정
	let today = new Date();
	$('#estdate').attr("max",today.toISOString().slice(0, 10))
	today = today.toISOString().slice(0, 7);
	$('#ym').val(today)
	$('#ym').attr("max",today)
	
	// 복지 체크
	$('.welfare-check').change(function(){
		let wno=$(this).attr("data-wno")
		if(this.checked){
			$.ajax({
				type:'post',
				url:'../company/com_wel_insert.do',
				data:{"wno":wno},
				success:function(res){
				}
			})
		}else{
			$.ajax({
				type:'post',
				url:'../company/com_wel_delete.do',
				data:{"wno":wno},
				success:function(res){
				}
			})
		}
	})
})
function insertHistory(){
	if($('#content').val().trim()==""){
		alert('내용을 입력해주세요')
		$('#content').focus()
		return
	}
	let ym=$('#ym').val()
	let content=$('#content').val()
	$.ajax({
		type:'post',
		url:'../company/history_insert.do',
		data:{"ym":ym,"content":content},
		success:function(res){
			printHistory()
		}
	})
	$('#content').val("")
}
function delHistory(hno){
	$.ajax({
		type:'post',
		url:'../company/history_delete.do',
		data:{"hno":hno},
		success:function(res){
			printHistory()
		}
	})
}
function upHistory(hno){
	$.ajax({
		type:'post',
		url:'../company/history_up.do',
		data:{"hno":hno},
		success:function(res){
			printHistory()
		}
	})
}
function downHistory(hno){
	$.ajax({
		type:'post',
		url:'../company/history_down.do',
		data:{"hno":hno},
		success:function(res){
			printHistory()
		}
	})
}
function updateHistory(hno,year){
	$('.tr-y').show()
	$('.tr-n').hide()
	
	let yhno=$('.'+year+'-start').attr("data-hno")
	let rowc=$('.'+year+'-start').attr("rowspan")
	let month=$('.'+hno+'-month').text().replace(/[^0-9]/g, "").padStart(2, '0')
	let day=year+'-'+month
	let content=$('.'+hno+'-content').text()
	let html=''
	if(hno==yhno){
		html+='<tr class="'+hno+'-update tr-n">'
		+'<th class="text-center" width="10%" rowspan="'+rowc+'">'
			+year
		+'</th>'
	}else{
		html+='<tr class="'+hno+'-update tr-n">'
	}
	html+=''
				+'<td width="15%">'
					+'<input type="month" size="10" name="'+hno+'-u-ym" id="'+hno+'-u-ym" value="'+day+'">'
				+'</td>'
				+'<td width="65%" colspan="3">'
					+'<input type="text" size="50" name="'+hno+'-u-content" id="'+hno+'-u-content" value="'+content+'">'
				+'</td>'
				+'<td width="5%">'
					+'<a class="btn btn-sm btn-warning" onclick=updateOk('+hno+','+year+','+month+')>'
						+'<i class="fas bi-check"></i>'
					+'</a>'
				+'</td>'
				+'<td width="5%">'
					+'<a class="btn btn-sm btn-danger" onclick=updatehCancel('+hno+')>'
						+'<i class="fas bi-x"></i>'
					+'</a>'
				+'</td>'
			+'</tr>'
	$('.'+hno+'-tr').hide()
	$('.'+hno+'-tr').after(html)
}
function updateOk(hno,year,month){
	if($('#'+hno+'-u-content').val().trim()==""){
		alert('내용을 입력해주세요')
		$('#'+hno+'-u-content').focus()
		return
	}
	let ym=$('#'+hno+'-u-ym').val()
	let day=year+"-"+String(month).padStart(2, '0')
	let content=$('#'+hno+'-u-content').val()
	let mode=0
	if(day==ym){
		mode=1
	}
	$.ajax({
		type:'post',
		url:'../company/history_update.do',
		data:{"hno":hno,"year":year,"month":month,"content":content,"ym":ym,"mode":mode},
		success:function(res){
			printHistory()
		}
	})
}
function updatehCancel(hno){
	$('.tr-n').hide()
	$('.tr-y').show()
}
function printHistory(){
	html=''
	cno=${param.cno}
	$.ajax({
		type:'post',
		url:'../company/history_print.do',
		data:{"cno":cno},
		success:function(res){
			let json=JSON.parse(res)
			html+=''
			+'<table class="table" width="100%">'
				json.yList.map(function(yvo){
					let i=0;
					json.hList.map(function(hvo){
						if(yvo.year==hvo.year){
							html+=''
							+'<tr class="'+hvo.hno+'-tr tr-y">'
							if(yvo.year==hvo.year && yvo.month==hvo.month && hvo.step==1){
								html+=''
									+'<th class="text-center '+yvo.year+'-start" data-hno="'+hvo.hno+'" width="10%" rowspan="'+yvo.count+'">'
										+yvo.year
									+'</th>'
							}
							html+=''
							+'<td class="text-center '+hvo.hno+'-month"  width="15%">'
								+hvo.month+'월'
							+'</td>'
							+'<td class="text-left '+hvo.hno+'-content" width="55%">'
								+hvo.content
							+'</td>'
							+'<td class="text-center" width="5%">'
							if(yvo.year==hvo.year && hvo.step!=1){
								html+=''
								+'<a class="btn btn-sm btn-info" onclick="upHistory('+hvo.hno+')">'
									+'<i class="fas bi-chevron-double-up"></i>'
								+'</a>'
							}
							html+=''
							+'</td>'
							+'<td class="text-center" width="5%">'
							if(i!=json.hList.length-1){
								if(json.hList[i].year == json.hList[i+1].year && json.hList[i].month == json.hList[i+1].month){
									html+=''
									+'<a class="btn btn-sm btn-info" onclick="downHistory('+hvo.hno+')">'
										+'<i class="fas bi-chevron-double-down"></i>'
									+'</a>'
								}
							}
							html+=''
							+'<td class="text-center" width="5%">'
								+'<a class="btn btn-sm btn-warning" onclick="updateHistory('+hvo.hno+','+hvo.year+')">'
									+'<i class="fas bi-arrow-counterclockwise"></i>'
								+'</a>'
							+'</td>'
							+'</td>'
							+'<td class="text-center" width="5%">'
								+'<a class="btn btn-sm btn-danger" onclick="delHistory('+hvo.hno+')">'
									+'<i class="fas bi-x"></i>'
								+'</a>'
							+'</td>'
						+'</tr>'
						}
						i++
					})
				})
			html+=''
			+'</table>'
			$('.history-box').html(html)
		}
	})
}
function wtabChange(wno){
	$('.wtabBtn').addClass("bg-light")
	$('.wtabBtn').removeClass("bg-primary")
	$('.wtabBtn-'+wno).addClass("bg-primary")
	$('.wtabBtn-'+wno).removeClass("bg-light")
	$('.wtab').hide()
	$('.wtab-'+wno).show()
}
function updateShow(){
	$('#comdetail').hide()
	$('#comupdate').show()
}
function updateCancel(){
	$('#comdetail').show()
	$('#comupdate').hide()
}
</script>
<style type="text/css">
input::-webkit-outer-spin-button,input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type='number'] {
  -moz-appearance: textfield;
}
input[type='number'].take {
  width: 6ex;
  text-align: right;
}
.btn-info,.btn-warning{
	color: white;
}
.tab{
	margin-top: 20px;
}
.form-switch .form-check-input {
    width: 50px;
    height: 25px;
    cursor: pointer;
}
.wtabBtn{
	cursor: pointer;
}
.text-left{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<select class="tab-select">
			<option value="1" selected>기업 상세</option>
			<option value="2">기업 연혁</option>
			<option value="3">기업 복지</option>
		</select>
		<div class="row tab tab-1">
			<div id="comdetail">
				<table class="table">
					<tr>
						<th class="text-center" width="15%">기업명</th>
						<td width="85%" colspan="3">
							${vo.name }
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">설립일</th>
						<td width="35%">
							${vo.dbestdate }
						</td>
						<th class="text-center" width="15%">대표자명</th>
						<td width="35%">
							${vo.representative==null?'':vo.representative }
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">기업형태</th>
						<td width="35%">
							${vo.c_type }
						</td>
						<th class="text-center" width="15%">홈페이지</th>
						<td width="35%">
							${vo.homepage==null?'':vo.homepage }
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">사원수</th>
						<td width="35%">
							${vo.ecount }
						</td>
						<th class="text-center" width="15%">매출액</th>
						<td width="35%">
							<c:if test="${vo.jo!=0 }">
								${vo.jo }조
							</c:if>
							<c:if test="${vo.uk!=0 }">
								${vo.uk }억
							</c:if>
							<c:if test="${vo.man!=0 }">
								${vo.man }만
							</c:if>
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">주소</th>
						<td width="85%" colspan="3">
							${vo.address==null?'':vo.address }
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">업종</th>
						<td width="85%" colspan="3">
							${vo.industry==null?'':vo.industry }
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">사업내용</th>
						<td width="85%" colspan="3">
							<pre style="white-space: pre-wrap;">${vo.bu_details==null?'':vo.bu_details }</pre>
						</td>
					</tr>
					<tr>
						<th class="text-center" width="15%">사업내용</th>
						<td width="85%" colspan="3">
							<pre style="white-space: pre-wrap;">${vo.introduction==null?'':vo.introduction }</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-end">
							<a onclick="updateShow()" class="btn btn-primary">수정</a>
						</td>
					</tr>
				</table>
			</div>
			<div  id="comupdate" style="display: none;">
				<form method="post" action="../company/com_update_ok.do">
					<table class="table">
						<tr>
							<th class="text-center" width="15%">기업명</th>
							<td width="85%" colspan="3">
								<input type="text" name="name" id="name" size="30" value="${vo.name }" readonly disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">설립일</th>
							<td width="35%">
								<input type="date" name="estdate" id="estdate" value="${vo.dbestdate }">
							</td>
							<th class="text-center" width="15%">대표자명</th>
							<td width="35%">
								<input type="text" name="representative" id="representative" size="30" value="${vo.representative==null?'':vo.representative }">
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">기업형태</th>
							<td width="35%">
								<select name="c_type" id="c_type">
									<c:forEach var="i" begin="0" end="6">
										<option value="${ctype[i] }"  ${ctype[i]=="기타"?((vo.c_type==null||vo.c_type=="기타")?"selected":""):(ctype[i]==vo.c_type?"selected":"") }>${ctype[i] }</option>
									</c:forEach>
								</select>
							</td>
							<th class="text-center" width="15%">홈페이지</th>
							<td width="35%">
								<input type="text" name="homepage" id="homepage" size="30" value="${vo.homepage==null?'':vo.homepage }">
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">사원수</th>
							<td width="35%">
								<input type="number" name="ecount" id="ecount" size="30" value="${vo.ecount }" min="0">
							</td>
							<th class="text-center" width="15%">매출액</th>
							<td width="35%">
								<input type="number" class="take text-right" name="jo" id="jo" size="5" value="${vo.jo }" min="0">조
								<input type="number" class="take text-right" name="uk" id="uk" size="5" value="${vo.uk }" min="0">억
								<input type="number" class="take text-right" name="man" id="man" size="5" value="${vo.man }" min="0">만
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">주소</th>
							<td width="85%" colspan="3">
								<input type="text" name="address" id="address" size="70" value="${vo.address==null?'':vo.address }">
								<input type="button" value="주소찾기" id="postBtn">
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">업종</th>
							<td width="85%" colspan="3">
								<input type="text" name="industry" id="industry" size="80" value="${vo.industry==null?'':vo.industry }">
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">사업내용</th>
							<td width="85%" colspan="3">
								<textarea rows="4" cols="80" name="bu_details" id="bu_details">${vo.bu_details==null?'':vo.bu_details }</textarea>
							</td>
						</tr>
						<tr>
							<th class="text-center" width="15%">사업내용</th>
							<td width="85%" colspan="3">
								<textarea rows="20" cols="80" name="introduction" id="introduction">${vo.introduction==null?'':vo.introduction }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="text-end">
								<input type="submit" class="btn btn-sm btn-info mx-3" value="저장">
								<a onclick="updateCancel()" class="btn btn-sm btn-danger">취소</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="row tab tab-2">
			<table class="table">
				<tr>
					<td colspan="2">
						<h3>연혁</h3>
					</td>
				</tr>
				<tr>
					<td width="20%">
						<input type="month" size="10" name="ym" id="ym">
					</td>
					<td width="80%">
						<input type="text" size="60" name="content" id="content">
						<a type="button" class="btn btn-sm btn-primary" onclick="insertHistory()">등록</a>
					</td>
				</tr>
			</table>
			<div class="history-box">
			</div>
		</div>
		
		<div class="row tab tab-3">
			<c:forEach var="tag" items="${tList }" varStatus="i">
				<div class="col-lg-3 text-centerwtabBtn wtabBtn wtabBtn-${tag.wno} bg-light" onclick="wtabChange(${tag.wno})">
					<h6 class="text-center mt-3 mb-3"><i class="bi-${icons[i.index]} text-secondary me-2"></i>${tag.name }</h6>
				</div>
			</c:forEach>
			<c:forEach var="tag" items="${tList }" varStatus="i">
				<div class="row wtab wtab-${tag.wno }">
					<c:forEach var="vo" items="${wList }">
						<c:if test="${tag.wno==vo.wno2 }">
							<div class="col-lg-6 form-check form-switch mb-3">
								<span>${vo.name }</span>
								<input class="form-check-input welfare-check" type="checkbox" value="10" ${vo.wcheck==1?"checked":"" }
									style="float: right;" data-wno=${vo.wno }>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
$('.welfare').change(function(){
	let val=$(this).val()
	if (this.checked) {
		
    } else {
    	
    }
})
</script>
</html>