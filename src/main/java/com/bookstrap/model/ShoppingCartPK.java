package com.bookstrap.model;

import java.io.Serializable;

public class ShoppingCartPK implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Integer memberId;

	protected Integer bookId;

	public ShoppingCartPK(Integer memberId, Integer bookId) {
		this.memberId = memberId;
		this.bookId = bookId;
	}

	public ShoppingCartPK() {
	}

}
