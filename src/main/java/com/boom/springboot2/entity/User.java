package com.boom.springboot2.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "BOOM_USER")
public class User extends BaseEntity {

	private static final long serialVersionUID = -3094124812749531344L;

	@Column(length = 10, nullable = false, unique = true)
    private String userName;

    @Column(length = 100, nullable = false, unique = true)
    private String email;
    
    @Column(length = 11, nullable = false, unique = true)
    private String phone;

    @Column(length = 40, nullable = false)
    private String passwd;

    @Column(length = 10, nullable = false)
    private String gender = "SECRET";

    @Column(length = 20, nullable = false)
    private String status;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
    
}
