package com.studycafe.prac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.studycafe.prac.dao.TodayTicketDao;
import com.studycafe.prac.dto.seatDto;


@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/testpage")//이용금액표
	public String testpage() {
		
		
		return "testpage";
	}
	
	@RequestMapping(value="/loginpage")//이용금액표
	public String loginpage() {
		
		
		return "loginpage";
	}
	
	@RequestMapping(value="/TicketPrice")//이용금액표
	public String TicketPrice() {
		
		
		return "TicketPrice";
	}
	
	@RequestMapping(value="/ChooseTicket")//이용권선택
	public String chooseTicket() {
		
		
		return "ChooseTicket";
	}
	
	@RequestMapping(value="/TodayTicketView")
	public String TodayTicketView() {
		
		
		return "TodayTicketView";
	}
	
	@RequestMapping(value="/searchSeat")
	public String searchSeat(HttpServletRequest request, Model model) {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		String userId = request.getParameter("userId");
		String selectedDate = request.getParameter("selectedDate");
		int seatNo = Integer.parseInt(request.getParameter("seatNo").toString());
		
		model.addAttribute("userId", userId);
		model.addAttribute("selectedDate", selectedDate);
		model.addAttribute("seatNo", seatNo);
		
		
		return "TodayTicketView2";
	}
	
	@RequestMapping(value="/TodayTicketView2")
	public String TodayTicketView2() {
		
		
		return "TodayTicketView2";
	}
	
	@RequestMapping(value="/registToday")
	public String regist(HttpServletRequest request,HttpServletResponse response) {
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		int seatNo = Integer.parseInt(request.getParameter("seatNo").toString());
		String userId = request.getParameter("userId");
		String ticketName = request.getParameter("ticketName");
		String selectedDate = request.getParameter("selectedDate");
		String [] selectedTime = request.getParameterValues("selectedTime");
		
		//넘어온 체크박스값들 정렬 후, 첫번째값과 마지막값 추출하여 start,end time에 각각 넣기
		Arrays.sort(selectedTime);
			String startTime = selectedTime[0];
			String endTime= selectedTime[selectedTime.length - 1];

			int intticketName= Integer.parseInt(ticketName);
			
			if(intticketName==selectedTime.length) {
				dao.regist(seatNo, userId, ticketName, selectedDate, startTime, endTime);
				return "redirect:registTodayConfirm";
			}else {
			try {
				response.setContentType("text/html; charset=UTF-8");      
		        PrintWriter out;
				out = response.getWriter();
				out.println("<script>alert('이용시간과 선택한 지정시간이 일치하지 않습니다.'); history.go(-1);</script>");
			    out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "TodayTicketView2";
			}
		
		
		
		
	
	}	
	
	
	@RequestMapping(value="/registTodayConfirm")
	public String confirm(Model model) {
		
		
		TodayTicketDao dao = sqlSession.getMapper(TodayTicketDao.class);
		
		ArrayList<seatDto> seatDto= dao.registTodayConfirm();
		
		seatDto fseatDto = seatDto.get(seatDto.size()-1);
		
		model.addAttribute("fseatDto", fseatDto);
		 
		
		return "registTodayConfirm";
	}
	@RequestMapping(value="/SubscriptionTicketBuy")//이용금액표
	public String STicketBuy() {
		
		
		return "SubscriptionTicketBuy";
	}
	@RequestMapping(value="/SubscriptionTicketView")//이용금액표
	public String STicketView() {
		
		
		return "SubscriptionTicketView";
	}
	@RequestMapping(value="/BuySubscription")//이용금액표
	public String BuySTicket() {
		
		
		return "SubscriptionTicketView";
	}
}
