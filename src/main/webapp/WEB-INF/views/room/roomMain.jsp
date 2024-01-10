<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>roomMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<style>
	th {
		width : 14%;
		vertical-align : center;
	}
	#td1, #td8, #td15, #td22, #td29 {
		color : red;
	}
	#td7, #td14, #td21, #td28 {
		color : blue;
	}
	.today {
		background-color : pink;
		text-align : left;
		font-weight : bolder;
		color : #fff;
	}
	
	.ymd {
		margin : 15px;
	}
	
	</style>
	<script>
		'use strict'
	
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth();
		let date = today.getDate();
		let cnt = 0;
		
		let cellText1 = 0;
		let cellText2 = 0
		
		/* 
		function resSelection() {
		let dateTag = document.getElementById("td${cell}");
			console.log(dateTag);
			dateTag.classList.add("resDate");
			alert("시작날짜선택완료");
		};
		  */
		
		/* 
		date = document.getElementById("td${cell}");
		console.log("date : ", date);
		if(date != null) {
			date.addEventListener('click', function() {
				this.classList.add("resDate");
				alert("시작날짜선택완료");
			})	
		}
		 */
		
		/* 
		const resDate = document.querySelectorAll(".dateTag");
		console.log(resDate);
		
		resDate.forEach((resDate)=>{
			console.log(resDate);
			resDate.addEventListener('click', ()=>{
				alert("시작날짜선택완료");
				resDate.classList.add('active');
			})
		})
		*/
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>예약 페이지</h2>
	<div class="text-center">
		<table class="table table-bordered">
			<tr class="table-dark text-dark">
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
				<td style="font-size:0.6em; color:gray; text-align:left">${prevYear}-${prevMonth+1}-${prevDay}</td>
				</c:forEach>
				<c:set var="cell" value="${startWeek}" />
				<c:forEach begin="1" end="${lastDay}" varStatus="status">
					<c:set var="todaySw" value="${curYear==yy && curMonth==mm && curDate==status.count? 1 : 0}" />
					<td id="td${cell}" ${todaySw==1 ? 'class=today' : ''} class="text-left"><p>${status.count}</p></td>
					<c:if test="${cell % 7 == 0}"><tr></tr></c:if>
					<c:set var="cell" value="${cell + 1}" />
				</c:forEach>
				<c:forEach var="nextDay" begin="${nextStartWeek}" end="7" varStatus="status">
				<td style="font-size:0.6em; color:gray; text-align:left">${nextYear}-${nextMonth+1}-${status.count}</td>
				</c:forEach>
			</tr>
		</table>
	</div>
	<form style="display:flex; justify-content:space-around" method="post">
		<div style="text-align:center">
			<p>체크인 날짜</p>
			<div style="display:flex; justify-content:space-around">
				<p class="ymd">년</p>
				<select name="startResYear">
					<c:forEach var="year" begin="${curYearSec}" end="${curYearSec+3}">
					<option value="${year}">${year}</option>
					</c:forEach>
				</select>
				<p class="ymd">월</p>
				<select name="startResMonth">
					<c:forEach var="month" begin="${curMonthSec}" end="12">
					<option value="${month}">${month}</option>
					</c:forEach>
					<option></option>
				</select>
				<p class="ymd">일</p>
				<select name="startResDate">
					<c:forEach var="date" begin="${curDateSec}" end="31">
					<option value="${date}">${date}</option>
					</c:forEach>
			</div>
		</div>
		<div style="text-align:center">
			<p>체크아웃 날짜</p>
			<div style="display:flex; justify-content:space-around">
				<p class="ymd">년</p>
				<select name="endResYear">
					<c:forEach var="year" begin="${curYearSec}" end="${curYearSec+3}">
					<option value="${year}">${year}</option>
					</c:forEach>
				</select>
				<p class="ymd">월</p>
				<select name="endResMonth">
					<c:forEach var="month" begin="${curMonthSec}" end="12">
					<option value="${month}">${month}</option>
					</c:forEach>
					<option></option>
				</select>
				<p class="ymd">일</p>
				<select name="endResDate">
					<c:forEach var="date" begin="${curDateSec}" end="31">
					<option value="${date}">${date}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<input type="submit" value="예약하기" />
	</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>