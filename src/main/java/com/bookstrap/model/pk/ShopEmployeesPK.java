package com.bookstrap.model.pk;

import java.io.Serializable;
import java.util.Objects;

public class ShopEmployeesPK implements Serializable {
	private static final long serialVersionUID = 1L;


	protected Integer shopId;

	protected Integer empId;

	public ShopEmployeesPK() {
		
	}

	public ShopEmployeesPK(Integer shopId, Integer empId) {
		this.shopId = shopId;
		this.empId = empId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(empId, shopId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShopEmployeesPK other = (ShopEmployeesPK) obj;
		return Objects.equals(empId, other.empId) && Objects.equals(shopId, other.shopId);
	}
	
	
	
}
