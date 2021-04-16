package com.kh.ila.covid.model.vo;

public class KoreaStats {

	private String country; // 시도명
	private String diffFromPrevDay; // 전일대비확진환자증감
	private String total; // 확진환자수
	private String death; // 사망자수
	private String incidence; // 발병률
	private String inspection; // 일일 검사환자 수
	
	
	

	public KoreaStats() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public KoreaStats(String country, String diffFromPrevDay, String total, String death, String incidence,
			String inspection) {
		super();
		this.country = country;
		this.diffFromPrevDay = diffFromPrevDay;
		this.total = total;
		this.death = death;
		this.incidence = incidence;
		this.inspection = inspection;
	}




	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getDiffFromPrevDay() {
		return diffFromPrevDay;
	}



	public void setDiffFromPrevDay(String diffFromPrevDay) {
		this.diffFromPrevDay = diffFromPrevDay;
	}



	public String getTotal() {
		return total;
	}



	public void setTotal(String total) {
		this.total = total;
	}



	public String getDeath() {
		return death;
	}



	public void setDeath(String death) {
		this.death = death;
	}



	public String getIncidence() {
		return incidence;
	}



	public void setIncidence(String incidence) {
		this.incidence = incidence;
	}



	public String getInspection() {
		return inspection;
	}



	public void setInspection(String inspection) {
		this.inspection = inspection;
	}



	@Override
	public String toString() {
		return "weather [country=" + country + ", diffFromPrevDay=" + diffFromPrevDay + ", total=" + total + ", death="
				+ death + ", incidence=" + incidence + ", inspection=" + inspection + "]";
	}


}
