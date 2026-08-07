package com.tap.model;
import java.sql.Timestamp;
import java.math.BigDecimal;
public class User {

	private int userid;
	private  String username;
	private String email;
	private String password;
	private String address;
	private String role;
	private Timestamp createddate;
	private Timestamp lastlogindate;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User( String username, String email, String password, String address, String role
			) {
		super();
		
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
		
	}
	public User( String username, String email, String password, String address, String role,
			Timestamp createddate, Timestamp lastlogindate) {
		super();
		
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
		this.createddate = createddate;
		this.lastlogindate = lastlogindate;
		
	}public User( int userid,String username, String email, String password, String address, String role,
			Timestamp createddate, Timestamp lastlogindate) {
		super();
		this.userid=userid;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.role = role;
		this.createddate = createddate;
		this.lastlogindate = lastlogindate;
	}
	public void setuserId(int userId ) {
		this.userid=userId;
	}
	public int getUserid() {
		return userid;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Timestamp getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Timestamp createddate) {
		this.createddate = createddate;
	}
	public Timestamp getLastlogindate() {
		return lastlogindate;
	}
	public void setLastlogindate(Timestamp lastlogindate) {
		this.lastlogindate = lastlogindate;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", email=" + email + ", password=" + password + ", address=" + address
				+ ", role=" + role + ", createddate=" + createddate + ", lastlogindate=" + lastlogindate + "]";
	}
	
	
}
