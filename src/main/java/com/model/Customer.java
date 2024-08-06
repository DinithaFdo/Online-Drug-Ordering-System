package com.model;

public class Customer {
	private int id;
	private String fname;
	private String lname;
	private int age;
	private String email;
	private String password;
	private String gender;
	private String tel;
	private String address;
	
	
	
	
	public Customer() {
		this.id = 0;
		this.fname = null;
		this.lname = null;
		this.age = 0;
		this.email = null;
		this.password = null;
		this.gender = null;
		this.tel = "Not added";
		this.address = "Not added";
	}



	public Customer(int id, String fname, String lname, int age, String email, String password, String gender,
			String tel, String address) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.age = age;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.tel = tel;
		this.address = address;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String mail) {
		this.email = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	

}
