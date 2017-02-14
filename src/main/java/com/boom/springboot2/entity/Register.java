package com.boom.springboot2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BOOM_REGISTER")
public class Register extends BaseEntity{

	private static final long serialVersionUID = -125014856864490610L;

	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(length = 100)
	private String activeId;
	
	@Column(length = 15)
	private String status;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getActiveId() {
		return activeId;
	}

	public void setActiveId(String activeId) {
		this.activeId = activeId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
