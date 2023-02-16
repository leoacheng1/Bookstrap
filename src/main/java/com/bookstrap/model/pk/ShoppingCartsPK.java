package com.bookstrap.model.pk;

import java.io.Serializable;
import java.util.Objects;

public class ShoppingCartsPK implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Integer memberId;

	protected Integer bookId;

	public ShoppingCartsPK() {

	}

	public ShoppingCartsPK(Integer memberId, Integer bookId) {
		this.memberId = memberId;
		this.bookId = bookId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookId, memberId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppingCartsPK other = (ShoppingCartsPK) obj;
		return Objects.equals(bookId, other.bookId) && Objects.equals(memberId, other.memberId);
	}

	
}
