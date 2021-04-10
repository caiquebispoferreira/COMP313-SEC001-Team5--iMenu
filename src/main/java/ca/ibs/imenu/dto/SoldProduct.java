package ca.ibs.imenu.dto;

import lombok.Data;

/**
 * SoldProduct - this class serves as a ViewModel
 * Date 2021-02-28
 *
 * @author Caique
 * @version 0.0.1
 */
@Data
public class SoldProduct {
	private String name;
	private int quantity;
	public SoldProduct(String name, int quantity) {
		this.name =name;
		this.quantity = quantity;
	}
}
