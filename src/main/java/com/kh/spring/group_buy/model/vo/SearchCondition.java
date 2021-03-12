package com.kh.spring.group_buy.model.vo;

public class SearchCondition {
	
	private String product;
	private String title;
	
	public SearchCondition() {
		
	}
	
	public SearchCondition(String product, String title) {
		super();
		this.product = product;
		this.title = title;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "SearchCondition [product=" + product + ", title=" + title + "]";
	}
	
}
