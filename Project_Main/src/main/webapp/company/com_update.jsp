<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	printHistory()
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
	});
	// 연혁 등록 날짜 지정
	let today = new Date();
	today = today.toISOString().slice(0, 7);
	$('#ym').val(today)
	$('#ym').attr("max",today)
	
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
					+'<a class="btn btn-sm btn-danger" onclick=updateCancel('+hno+')>'
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
function updateCancel(hno){
	$('.tr-n').hide()
	$('.tr-y').show()
}
function printHistory(){
	html=''
	cno=${param.cno}
	if(${sessionScope.cid==null}){
		alert("기업계정으로 로그인 후 이용해주세요")
		location.href="com_detail.do?cno="+${param.cno}
		return
	}else if(${sessionScope.cid!=vo.cid}){
		alert("접근한 기업정보를 수정할 권한이 없습니다")
		location.href="com_detail.do?cno="+${param.cno}
		return
	}
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
								if(yvo.year==hvo.year && json.hList[i].month==json.hList[i+1].month){
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
			console.log(html)
			$('.history-box').html(html)
		}
	})
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
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
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
			</table>
		</div>
		<div class="row">
			<h3 class="text-center">연혁</h3>
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
	</div>
</body>
</html>