<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>roomRes.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/include.css?after" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/room.css?after" />
	<script>
		'use strict'
	
		function resRoom() {
			
			let startResYear = resSelect.startResYear.value;
			let startResMonth = resSelect.startResMonth.value;
			let startResDate = resSelect.startResDate.value;
			let endResYear = resSelect.endResYear.value;
			let endResMonth = resSelect.endResMonth.value;
			let endResDate = resSelect.endResDate.value;
			
			$.ajax({
				url : "${ctp}/room/roomMain",
				type : "post",
				data  : {
					startResYear : startResYear,
					startResMonth : startResMonth,
					startResDate : startResDate,
					endResYear : endResYear,
					endResMonth : endResMonth,
					endResDate : endResDate
				},
				success : function(res) {
					if(res > "0") {
						alert("예약등록 완료하였습니다.");
						location.reload();
					}
					else if(res == "0") {
						alert("이미 예약된 날짜는 등록할 수 없습니다.");
					}
					else if(res == "-1") {
						alert("체크아웃 날짜는 체크인 날짜 이후로만 설정 가능합니다.");
					}
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
	</script>
</head>
<body>
<div class="include">
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
</div>
<p><br/></p>
<div class="room">
<h3>예약 페이지</h3>
	<div class="roomButton">
		<button onclick="location.href='${ctp}/room/roomMain?yy=${yy-1}'">이전년도</button>
		<button onclick="location.href='${ctp}/room/roomMain?mm=${mm-1}'">이전달</button>
		<font>${yy} 년 - ${mm + 1} 월</font>
		<button onclick="location.href='${ctp}/room/roomMain?mm=${mm+1}'">다음달</button>
		<button onclick="location.href='${ctp}/room/roomMain?yy=${yy+1}'">다음년도</button>
	</div>
	<div class="roomCalender">
		<table class="roomCalender__table">
			<tr class="roomCalender__table__tr">
				<th style="color : red">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th style="color : blue">토</th>
			</tr>
			<tr>
				<c:forEach var="prevDay" begin="${prevLastDay-(startWeek-2)}" end="${prevLastDay}" varStatus="status">
				<td class="roomCalender__table__tr__td--prevDay">${prevYear}-${prevMonth+1}-${prevDay}</td>
				</c:forEach>
				
				<c:set var="cell" value="${startWeek}" />
				<c:forEach begin="1" end="${lastDay}" varStatus="status">
			    	<c:set var="resInSw" value="0" />
			    	<c:set var="resOutSw" value="0" />
					<c:set var="todaySw" value="${curYear==yy && curMonth==mm && curDate==status.count? 1 : 0}" />
				    <c:forEach var="vo" items="${vos}">
				    	<c:if test="${resInSw==0}">
					    	<c:set var="resInSw" value="${fn:substring(vo.checkInDate, 8, 10)==status.count? 1 : 0}" />
				    	</c:if>
				    	<c:if test="${resOutSw==0}">
					    	<c:set var="resOutSw" value="${fn:substring(vo.checkOutDate, 8, 10)==status.count? 1 : 0}" />
					    </c:if>
				    </c:forEach>				
					<td id="td${cell}" class="${todaySw==1 ? 'today' : ''} ${resInSw==1 ? 'resIn' : ''} ${resOutSw==1 ? 'resOut' : ''}">
						<p>${status.count}</p>
					</td>
					<c:if test="${cell % 7 == 0}"><tr></tr></c:if>
					<c:set var="cell" value="${cell + 1}" />
				</c:forEach>
				
				<c:forEach var="nextDay" begin="${nextStartWeek}" end="7" varStatus="status">
				<td class="roomCalender__table__tr__td--nextDay">${nextYear}-${nextMonth+1}-${status.count}</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	<form class="roomSelector">
		<div style="text-align:center">
			<p>체크인 날짜</p>
			<div class="roomSelector__div">
				<p style="margin : 15px">년</p>
				<select name="startResYear">
					<c:forEach var="year" begin="${curYearSec}" end="${curYearSec+3}">
					<option value="${year}">${year}</option>
					</c:forEach>
				</select>
				<p style="margin : 15px">월</p>
				<select name="startResMonth">
					<c:forEach var="month" begin="1" end="12">
					<option value="${month}">${month}</option>
					</c:forEach>
				</select>
				<p style="margin : 15px">일</p>
				<select name="startResDate">
					<c:forEach var="date" begin="1" end="${lastDay}">
					<option value="${date}">${date}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div style="text-align:center">
			<p>체크아웃 날짜</p>
			<div class="roomSelector__div">
				<p style="margin : 15px">년</p>
				<select name="endResYear">
					<c:forEach var="year" begin="${curYearSec}" end="${curYearSec+3}">
					<option value="${year}">${year}</option>
					</c:forEach>
				</select>
				<p style="margin : 15px">월</p>
				<select name="endResMonth">
					<c:forEach var="month" begin="1" end="12">
					<option value="${month}">${month}</option>
					</c:forEach>
				</select>
				<p style="margin : 15px">일</p>
				<select name="endResDate">
					<c:forEach var="date" begin="1" end="${lastDay}">
					<option value="${date}">${date}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<input type="button" value="예약하기" onclick="resRoom()"/>
	</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>