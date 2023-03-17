package com.bookstrap.model.pk;

import java.io.Serializable;
import java.util.Objects;

public class UserCouponPK implements Serializable {

	private static final long serialVersionUID = 1L;

	protected Integer couponId;

	protected Integer memberId;

	public UserCouponPK() {

	}

	public UserCouponPK(Integer couponId, Integer memberId) {
		this.couponId = couponId;
		this.memberId = memberId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(couponId, memberId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserCouponPK other = (UserCouponPK) obj;
		return Objects.equals(couponId, other.couponId) && Objects.equals(memberId, other.memberId);
	}

}
