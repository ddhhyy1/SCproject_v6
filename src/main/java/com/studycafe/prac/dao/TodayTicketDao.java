package com.studycafe.prac.dao;

import java.util.ArrayList;

import com.studycafe.prac.dto.seatDto;

public interface TodayTicketDao {
	
	
	//당일권 관련
	public void regist(int seatNo, String userId, String ticketName, String selectedDate, String selectedTime);
	public ArrayList<seatDto> registTodayConfirm();
	
	//시간제(정액권) 관련
	public void BuySTicket(int sticketNo, String sticketName, String suserId, String sremainTime);
}
