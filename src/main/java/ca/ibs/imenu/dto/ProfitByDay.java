package ca.ibs.imenu.dto;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class ProfitByDay {
	private int day;
	private BigDecimal total;
	public ProfitByDay(int day,BigDecimal total) {
		this.day = day;
		this.total = total;
	}
}
