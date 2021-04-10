package ca.ibs.imenu.dto;

import java.math.BigDecimal;

import lombok.Data;

/**
 * ProfitByDay - this class serves as a ViewModel
 * Date 2021-02-28
 *
 * @author Caique
 * @version 0.0.1
 */
@Data
public class ProfitByDay {
	private int day;
	private BigDecimal total;
	public ProfitByDay(int day,BigDecimal total) {
		this.day = day;
		this.total = total;
	}
}
