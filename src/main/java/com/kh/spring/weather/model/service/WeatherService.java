package com.kh.spring.weather.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.kh.spring.covid.model.vo.KoreaStats;
import com.kh.spring.weather.model.vo.Weather;
import org.jsoup.nodes.Element;
@Service
public class WeatherService {

	private static String WEATHER_URL = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EB%82%A0%EC%94%A8";

	public Weather getWeather() throws IOException {
		 	
		 	
	        Document doc = Jsoup.connect(WEATHER_URL).get();
	        
	        String todaytemp=doc.select(".info_data .info_temperature .todaytemp").text();
	        String cast_txt=doc.select(".today_area .main_info .info_data .info_list li .cast_txt").text();
	        String min=doc.select(".today_area .main_info .info_data .info_list li .merge .min .num").text();
	        String max=doc.select(".today_area .main_info .info_data .info_list li .merge .max .num").text();
	        String bodytemp=doc.select(".today_area .main_info .info_data .info_list li .sensible em .num").text();
	        
	        
	        //System.out.print("자외선 : "+doc.select(".today_area .main_info .info_data .info_list li .indicator .lv2 .num").text());
	        String uv=doc.select(".today_area .main_info .info_data .info_list li .indicator .lv2 .num").text();
	        
	        
	        Elements e=doc.select(".today_area .sub_info .detail_box .indicator .lv2");
	        String finedust=e.get(0).text();
	        String ozone=e.get(1).text();
	        String ultrafinedust=doc.select(".today_area .sub_info .detail_box .indicator .lv1 .num").text();
	       
	        
	        Weather weather=new Weather();
	        return weather;
	}
	
}
