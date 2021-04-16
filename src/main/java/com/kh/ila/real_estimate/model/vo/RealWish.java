package com.kh.ila.real_estimate.model.vo;

public class RealWish {
	private int stuffNo;
	private String loginUser;

	public RealWish(int stuffNo, String loginUser) {
		super();
		this.stuffNo = stuffNo;
		this.loginUser = loginUser;
	}

	public int getStuffNo() {
		return stuffNo;
	}

	public void setStuffNo(int stuffNo) {
		this.stuffNo = stuffNo;
	}

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	@Override
	public String toString() {
		return "RealWish [stuffNo=" + stuffNo + ", loginUser=" + loginUser + "]";
	}

}
