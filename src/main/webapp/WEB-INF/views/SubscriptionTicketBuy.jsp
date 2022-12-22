<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<meta charset="UTF-8">
<title>시간권 구매</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(function(){
    $('.change50').click(function(){
    	$('input[name=STicketHour]').attr('value',"65,000");
    });
});
$(function(){
    $('.change100').click(function(){
    	$('input[name=STicketHour]').attr('value',"120,000");
    });
});
$(function(){
    $('.change150').click(function(){
    	$('input[name=STicketHour]').attr('value',"160,000");
    });
});
$(function(){
    $('.change200').click(function(){
    	$('input[name=STicketHour]').attr('value',"200,000");
    });
});
</script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01">STUDY CAFE</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox1">
				<span class="title02">시간권 구매</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<form action="BuySubscription">
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center" class="content_text01">
										시간 이용권 정보 
										</td>
									</tr>
						
								
									<tr>
										<td><span class="content_text01" name="userId">아 이 디 : </span></td>
										<td>
										<input type="text" name="userId">
										</td>
									</tr>
									</tr>
										<tr>
										<td><span class="content_text01">보유포인트 : </span></td>
										<td>
										
										</td>
									</tr>		
									<tr>
									<td>
									<span class="content_text01" name="ticketName2">시간제 이용권:
									</td>
									<span>
									</tr>
									<tr>
										<td>
										<div class="btn-group" role="group" aria-label="Basic outlined example">

  											<div class="change50"><button type="button" class="btn btn-outline-primary" name="50">
  											50시간</button></div>
  											<div class="change100">
 											<button type="button" id= "change100" class="btn btn-outline-primary" name="100">100시간</button>
  											</div>
  											<div class="change150">
  											<button type="button" id= "change150" class="btn btn-outline-primary" name="150">150시간</button>
   											</div>
   											<div class="change200">
   											<button type="button" id= "change200" class="btn btn-outline-primary" name="200">200시간</button>
											</div>
										</div>
										</td>
										<td>
										
										</td>
									</tr>
										<tr>
										<td><span class="content_text01" >차감포인트 : </span>
										</td>
										<td >
        								<input type="text" name="STicketHour" value="0">p
										</td>
									</tr>
										</tr>
										<tr>
										<td><span class="content_text01">종료시간 : </span></td>
										<td>
										
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="submit" value="결제하기">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">
										</td>
									</tr>
												
							</table>
							</form>
							</center>							
						</td>						
					</tr>
					
				</table>
				</center>			
			</td>
		</tr>
	</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>
