package com.studycafe.prac.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubscriptionTicketDto {

	private int sticketNo;
	private String sticketName;
	private String suserId;
	private String sremainTime;
	
	
}
