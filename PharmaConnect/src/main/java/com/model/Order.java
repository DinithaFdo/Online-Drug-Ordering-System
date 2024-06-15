package com.model;

public class Order {
	private int id;
	private String fname;
	private String lname;
	private String email;
	private String address;
	private String tel;
	private String pname;
	private String qty;
	private String payment;
	
	
	
	public Order() {
		this.id = 0;
		this.fname = null;
		this.lname = null;
		this.email = null;
		this.address = null;
		this.tel = null;
		this.pname = null;
		this.qty = null;
		this.payment = null;
	}

	public Order(int id, String fname, String lname, String email, String address, String tel, String pname, String qty,
			String payment) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.address = address;
		this.tel = tel;
		this.pname = pname;
		this.qty = qty;
		this.payment = payment;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
	
	
	

	
}
