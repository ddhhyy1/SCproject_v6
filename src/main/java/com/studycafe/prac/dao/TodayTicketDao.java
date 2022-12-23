package com.studycafe.prac.dao;

import java.util.ArrayList;

import com.studycafe.prac.dto.seatDto;

public interface TodayTicketDao {
	
	
	//당일권 관련
	public void regist(int seatNo, String userId, String ticketName, String selectedDate, String startTime,String endTime);
	public ArrayList<seatDto> registTodayConfirm();
	public ArrayList<seatDto> searchSeat(String seatNo,String selectedDate);
	
	//시간제(정액권) 관련
	public void BuySTicket(int sticketNo, String sticketName, String suserId, String sremainTime);
}
