<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- jQuery  -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">


		<!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>


<meta charset="UTF-8">
<title>당일권 사용&예약등록</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
	<form action="registToday">
	<table width="65%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<h1>당일권_사용등록&예약하기</h1>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">회원아이디:</span>
				<input type="text" name="userId">
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">날짜지정:
				<input type="text" id="pickDate" name="selectedDate">
				</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">좌석지정:
  					<select name="seatNo" >
   						 <option value="none" name="seatNo2">=== 선택 ===</option>
   						 <c:forEach begin="1" end="25" step="1" var="n">
    					 <option name="selectTime">${n}</option>
    					 </c:forEach>
 					 </select>
				</span>
			</td>
		
		</tr>
		<tr>
			<td>
				<center>
					<div class="row">
						<table id="example-table-1"  width="80%" border="1" cellspacing="1" cellpadding="10"
						>
							<thead>
									<tr>
										<th>시간</th>
										<th>가능여부</th>
										<th>현재 이용 가능 좌석</th>
									</tr>
							</thead>
							<tbody>
									<tr>
										<td class="skillbox" >8:00 ~ 9:00</td>
										<td class="skillbox" >사용&예약 가능</td>
										<td rowspan="16" class="picbox">
										<img src="${pageContext.request.contextPath }/resources/img/cafemap.png" width="700">
									</td>
									</tr>
									<tr>
										<td class="skillbox" >9:00 ~ 10:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >10:00 ~ 11:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >11:00 ~ 12:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >12:00 ~ 13:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >13:00 ~ 14:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >14:00 ~ 15:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >15:00 ~ 16:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >16:00 ~ 17:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >17:00 ~ 18:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >18:00 ~ 19:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >19:00 ~ 20:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >20:00 ~ 21:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >21:00 ~ 22:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >22:00 ~ 23:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
									<tr>
										<td class="skillbox" >23:00 ~ 24:00</td>
										<td class="skillbox" >사용&예약 가능</td>
									</tr>
							
							
									
							</tbody>
				</table>
						<tr>
							<td class="titlebox">
								<span class="title02" name="ticketName2">이용시간:
  									<select name="ticketName" >
   						 				<option value="none" name="usingTIME">=== 선택 ===</option>
   						 				<option value="1" selected>1시간 - 2,000p</option>
    					 				<option value="2">2시간 - 3,000p</option>
    									<option value="4">4시간 - 5,000p</option>
    								    <option value="6">6시간 - 6,000p</option>
    					 				<option value="8">8시간 - 7,000p</option>
 					 				</select>
								</span>
							</td>
							</tr>
							<tr>
								<td class="titlebox">
									<span class="title02">시작시간 지정:
										<select name="selectedTime" >
   						 				<option value="none" name="startTIME">=== 선택 ===</option>
   						 					<c:forEach begin="8" end="23" step="1" var="t">
    					 						<option name="selectTime" value="a${t}">${t}:00 ~ ${t+1}:00</option>
    									 	</c:forEach>
 					 				</select>
										
									</span>
									</td>
							</tr>
							<tr>
										<td colspan="3">
											
											<input class="button_type01" type="button" value="예약하기" onclick="script:window.location='QuestionList'">
											<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">
										</td>
									</tr>
				</div>
				</center>			
			</td>
		</tr>
	</table>
	
	</form>
	</center>
	<%@ include file="include/footer.jsp" %>
	
</body>
</html>