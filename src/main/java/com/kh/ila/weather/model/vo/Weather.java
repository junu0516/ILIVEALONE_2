package com.kh.ila.weather.model.vo;

public class Weather {

	private String todaytemp;
	
	private String cast_txt;
	private String min;
	private String max;
	
	private String bodytemp;
	private String uv;
	private String uv_txt;
	
	private String finedust;
	private String finedust_txt;
	
	private String ultrafinedust;
	private String ultrafinedust_txt;
	
	private String ozone;
	private String ozone_txt;
	
	public Weather() {
		super();
		// TODO Auto-generated constructor stub
	}


	
	public Weather(String todaytemp, String cast_txt, String min, String max, String bodytemp, String uv, String uv_txt,
			String finedust, String finedust_txt, String ultrafinedust, String ultrafinedust_txt, String ozone,
			String ozone_txt) {
		super();
		this.todaytemp = todaytemp;
		this.cast_txt = cast_txt;
		this.min = min;
		this.max = max;
		this.bodytemp = bodytemp;
		this.uv = uv;
		this.uv_txt = uv_txt;
		this.finedust = finedust;
		this.finedust_txt = finedust_txt;
		this.ultrafinedust = ultrafinedust;
		this.ultrafinedust_txt = ultrafinedust_txt;
		this.ozone = ozone;
		this.ozone_txt = ozone_txt;
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






	public String getUv_txt() {
		return uv_txt;
	}



	public void setUv_txt(String uv_txt) {
		this.uv_txt = uv_txt;
	}



	public String getFinedust_txt() {
		return finedust_txt;
	}



	public void setFinedust_txt(String finedust_txt) {
		this.finedust_txt = finedust_txt;
	}



	public String getUltrafinedust_txt() {
		return ultrafinedust_txt;
	}



	public void setUltrafinedust_txt(String ultrafinedust_txt) {
		this.ultrafinedust_txt = ultrafinedust_txt;
	}



	public String getOzone_txt() {
		return ozone_txt;
	}



	public void setOzone_txt(String ozone_txt) {
		this.ozone_txt = ozone_txt;
	}



	@Override
	public String toString() {
		return "Weather [todaytemp=" + todaytemp + ", cast_txt=" + cast_txt + ", min=" + min + ", max=" + max
				+ ", bodytemp=" + bodytemp + ", uv=" + uv + ", uv_txt=" + uv_txt + ", finedust=" + finedust
				+ ", finedust_txt=" + finedust_txt + ", ultrafinedust=" + ultrafinedust + ", ultrafinedust_txt="
				+ ultrafinedust_txt + ", ozone=" + ozone + ", ozone_txt=" + ozone_txt + "]";
	}


	
}
