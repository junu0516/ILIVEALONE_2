package com.kh.spring.real_estimate.model.vo;

import java.sql.Date;

public class Real {
	
	private int stuffNo;
	private String money_kind;
	private double area;
	private int floors;
	private String location;
	private String elevator;
	private int admin_money;
	private String structure;
	private int entire_floors;
	private String phone;
	private String money1;
	private String money2;
	private String status;
	private String originName;
	private String changeName;
	
	public Real() {
		super();
		// TODO Auto-generated constructor stub
	}

	


	public Real(int stuffNo, String money_kind, double area, int floors, String location, String elevator,
			int admin_money, String structure, int entire_floors, String phone, String money1, String money2,
			String status, String originName, String changeName) {
		super();
		this.stuffNo = stuffNo;
		this.money_kind = money_kind;
		this.area = area;
		this.floors = floors;
		this.location = location;
		this.elevator = elevator;
		this.admin_money = admin_money;
		this.structure = structure;
		this.entire_floors = entire_floors;
		this.phone = phone;
		this.money1 = money1;
		this.money2 = money2;
		this.status = status;
		this.originName = originName;
		this.changeName = changeName;
	}




	public int getStuffNo() {
		return stuffNo;
	}


	public void setStuffNo(int stuffNo) {
		this.stuffNo = stuffNo;
	}


	public String getMoney_kind() {
		return money_kind;
	}


	public void setMoney_kind(String money_kind) {
		this.money_kind = money_kind;
	}


	public double getArea() {
		return area;
	}


	public void setArea(double area) {
		this.area = area;
	}


	public int getFloors() {
		return floors;
	}


	public void setFloors(int floors) {
		this.floors = floors;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getElevator() {
		return elevator;
	}


	public void setElevator(String elevator) {
		this.elevator = elevator;
	}


	public int getAdmin_money() {
		return admin_money;
	}


	public void setAdmin_money(int admin_money) {
		this.admin_money = admin_money;
	}


	public String getStructure() {
		return structure;
	}


	public void setStructure(String structure) {
		this.structure = structure;
	}


	public int getEntire_floors() {
		return entire_floors;
	}


	public void setEntire_floors(int entire_floors) {
		this.entire_floors = entire_floors;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMoney1() {
		return money1;
	}


	public void setMoney1(String money1) {
		this.money1 = money1;
	}


	public String getMoney2() {
		return money2;
	}


	public void setMoney2(String money2) {
		this.money2 = money2;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getOriginName() {
		return originName;
	}




	public void setOriginName(String originName) {
		this.originName = originName;
	}




	public String getChangeName() {
		return changeName;
	}




	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}




	@Override
	public String toString() {
		return "Real [stuffNo=" + stuffNo + ", money_kind=" + money_kind + ", area=" + area + ", floors=" + floors
				+ ", location=" + location + ", elevator=" + elevator + ", admin_money=" + admin_money + ", structure="
				+ structure + ", entire_floors=" + entire_floors + ", phone=" + phone + ", money1=" + money1
				+ ", money2=" + money2 + ", status=" + status + ", originName=" + originName + ", changeName="
				+ changeName + "]";
	}


}
