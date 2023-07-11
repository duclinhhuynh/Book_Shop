package com.entity;

public class Book_Order {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phone;
	private String fulladd;
	
	private String bookName;
	private String author;
	private Double price;
	private String payment;
	public Book_Order(int id, String orderId, String userName, String email, String phone, String fulladd,
			String bookName, String author, Double price, String payment) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.fulladd = fulladd;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.payment = payment;
	}
	public Book_Order() {
		// TODO Auto-generated constructor stub
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
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
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", fulladd=" + fulladd + ", bookName=" + bookName + ", author=" + author
				+ ", price=" + price + "]";
	}
	
	
}
