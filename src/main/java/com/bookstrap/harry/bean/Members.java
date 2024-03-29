package com.bookstrap.harry.bean;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.bookstrap.harry.security.Roles;
import com.bookstrap.model.bean.NewShoppingCarts;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Members")
public class Members {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_id")
	private Integer memberId;
	
	@Column(name = "acccount")
	private String memberAccount;
	
	@Column(name = "password")
	private String memberPassword;
	
	@Column(name = "valid")
	private Integer memberValid;
	
	@Column(name = "member_level")
	private Integer memberLevel;
	
	@Column(name = "vertification_code")
	private String vertificationCode;
	
	//test
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "MemberRoles",
	joinColumns = @JoinColumn(name = "FK_member_id"),
	inverseJoinColumns = @JoinColumn(name = "FK_role_id"))
	private Collection<Roles> roles;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "Role")
	private Role role;
	
	
	@Enumerated(EnumType.STRING)
	@Column(name = "auth_provider")
	private AuthenticationProvider authProvider;
	
	@Column(name = "reset_password_token")
	private String resetPasswordToken;

	//雙向，去找memberDetails有本類別屬性的參考變數
	@OneToOne(mappedBy ="member")
	private MemberDetails memberDetails;
	
	@JsonManagedReference(value = "member-shoppingCarts")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private List<ShoppingCarts> shoppingCarts;
	
	@JsonManagedReference(value = "member-newShoppingCarts")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private List<NewShoppingCarts> newShoppingCarts;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private List<Comment> comment;
	
	@JsonManagedReference(value = "member-sales")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private List<Sales> sales;
	
	@JsonManagedReference(value = "member-userCoupon")
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private List<UserCoupon> userCoupon;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<Favorite> favorite;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<EBookFavorite> eBookFavorite;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<EBookPurchases> eBookPurchase;
	
	
	//test
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "member", cascade = CascadeType.ALL)
	private Set<TestShoppingCatrs> testShoppingCarts;
	
	public Members() {
	}
	
	public Members(String mAccount, String mPassword) {
		this.memberAccount = mAccount;
		this.memberPassword = mPassword;
	}
	
	
	
	
	
	public Set<TestShoppingCatrs> getTestShoppingCarts() {
		return testShoppingCarts;
	}

	public void setTestShoppingCarts(Set<TestShoppingCatrs> testShoppingCarts) {
		this.testShoppingCarts = testShoppingCarts;
	}

	public Members(String memberAccount, String memberPassword, Role role) {
		super();
		this.memberAccount = memberAccount;
		this.memberPassword = memberPassword;
		this.role = role;
	}

	public Members(Integer memberId) {
		super();
		this.memberId = memberId;
	}
	
	
	

	public Set<EBookPurchases> geteBookPurchase() {
		return eBookPurchase;
	}

	public void seteBookPurchase(Set<EBookPurchases> eBookPurchase) {
		this.eBookPurchase = eBookPurchase;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Favorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<Favorite> favorite) {
		this.favorite = favorite;
	}

	public Set<EBookFavorite> geteBookFavorite() {
		return eBookFavorite;
	}

	public void seteBookFavorite(Set<EBookFavorite> eBookFavorite) {
		this.eBookFavorite = eBookFavorite;
	}

	public Collection<Roles> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Roles> roles) {
		this.roles = roles;
	}

	

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	public String getVertificationCode() {
		return vertificationCode;
	}



	public void setVertificationCode(String vertificationCode) {
		this.vertificationCode = vertificationCode;
	}





	public AuthenticationProvider getAuthProvider() {
		return authProvider;
	}

	public void setAuthProvider(AuthenticationProvider authProvider) {
		this.authProvider = authProvider;
	}

	public Members(String mAccount) {
		this.memberAccount = mAccount;
	}

	public List<ShoppingCarts> getShoppingCarts() {
		return shoppingCarts;
	}



	public void setShoppingCarts(List<ShoppingCarts> shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
	}



	public List<Comment> getComment() {
		return comment;
	}



	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}



	public List<Sales> getSales() {
		return sales;
	}



	public void setSales(List<Sales> sales) {
		this.sales = sales;
	}



	public List<UserCoupon> getUserCoupon() {
		return userCoupon;
	}



	public void setUserCoupon(List<UserCoupon> userCoupon) {
		this.userCoupon = userCoupon;
	}



	public MemberDetails getMemberDetails() {
		return memberDetails;
	}

	public void setMemberDetails(MemberDetails memberDetails) {
		this.memberDetails = memberDetails;
	}


	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public Integer getMemberValid() {
		return memberValid;
	}

	public void setMemberValid(Integer memberValid) {
		this.memberValid = memberValid;
	}

	public Integer getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(Integer memberLevel) {
		this.memberLevel = memberLevel;
	}
	
		
		
}
