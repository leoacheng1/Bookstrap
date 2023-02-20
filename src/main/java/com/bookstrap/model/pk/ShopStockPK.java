package com.bookstrap.model.pk;

import java.io.Serializable;
import java.util.Objects;

public class ShopStockPK implements Serializable{


	private static final long serialVersionUID = 1L;
	
	private Integer shopId;
	
	private Integer bookId;

	public ShopStockPK() {
	}

	public ShopStockPK(Integer shopId, Integer bookId) {
		this.shopId = shopId;
		this.bookId = bookId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookId, shopId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShopStockPK other = (ShopStockPK) obj;
		return Objects.equals(bookId, other.bookId) && Objects.equals(shopId, other.shopId);
	}

}
