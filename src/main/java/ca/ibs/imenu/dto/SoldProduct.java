package ca.ibs.imenu.dto;

import lombok.Data;

@Data
public class SoldProduct {
	private String name;
	private int quantity;
	public SoldProduct(String name, int quantity) {
		this.name =name;
		this.quantity = quantity;
	}
}
