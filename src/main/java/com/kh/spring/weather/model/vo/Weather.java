package com.kh.spring.weather.model.vo;

public class Weather {

	private String todaytemp;
	
	private String cast_txt;
	private String min;
	private String max;
	
	private String bodytemp;
	private String uv;
	
	private String finedust;
	
	private String ultrafinedust;
	
	private String ozone;
	
	public Weather() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	



	public Weather(String todaytemp, String cast_txt, String min, String max, String bodytemp, String uv,
			String finedust, String ultrafinedust, String ozone) {
		super();
		this.todaytemp = todaytemp;
		this.cast_txt = cast_txt;
		this.min = min;
		this.max = max;
		this.bodytemp = bodytemp;
		this.uv = uv;
		this.finedust = finedust;
		this.ultrafinedust = ultrafinedust;
		this.ozone = ozone;
	}








	public String getTodaytemp() {
		return todaytemp;
	}






	public void setTodaytemp(String todaytemp) {
		this.todaytemp = todaytemp;
	}






	public String getCast_txt() {
		return cast_txt;
	}






	public void setCast_txt(String cast_txt) {
		this.cast_txt = cast_txt;
	}






	public String getMin() {
		return min;
	}






	public void setMin(String min) {
		this.min = min;
	}






	public String getMax() {
		return max;
	}






	public void setMax(String max) {
		this.max = max;
	}






	public String getBodytemp() {
		return bodytemp;
	}






	public void setBodytemp(String bodytemp) {
		this.bodytemp = bodytemp;
	}






	public String getUv() {
		return uv;
	}






	public void setUv(String uv) {
		this.uv = uv;
	}






	public String getFinedust() {
		return finedust;
	}






	public void setFinedust(String finedust) {
		this.finedust = finedust;
	}






	public String getUltrafinedust() {
		return ultrafinedust;
	}






	public void setUltrafinedust(String ultrafinedust) {
		this.ultrafinedust = ultrafinedust;
	}






	public String getOzone() {
		return ozone;
	}






	public void setOzone(String ozone) {
		this.ozone = ozone;
	}






	@Override
	public String toString() {
		return "Weather [todaytemp=" + todaytemp + ", cast_txt=" + cast_txt + ", min=" + min + ", max=" + max
				+ ", bodytemp=" + bodytemp + ", uv=" + uv + ", finedust=" + finedust + ", ultrafinedust="
				+ ultrafinedust + ", ozone=" + ozone + "]";
	}




	
	
	
}
