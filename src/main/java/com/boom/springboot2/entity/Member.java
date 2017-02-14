package com.boom.springboot2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BOOM_MEMBER")
public class Member extends BaseEntity{

	private static final long serialVersionUID = 935715859392794730L;
	
	@JoinColumn(name = "owner_id")
	@ManyToOne
	private User owner;
	
	@Column(length = 15, nullable = false)
	private String realName;
	
	@Column(length = 15, nullable = false)
	private String phone;
	
	@Column(length = 100, nullable = false)
	private String email;
	
	@Column(length = 18, nullable = false, unique = true)
    private String idCard;
	
	@Column(length = 100, nullable = false)
	private String address;
	
	@Column(length = 10, nullable = false)
    private String gender = "SECRET";

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}
