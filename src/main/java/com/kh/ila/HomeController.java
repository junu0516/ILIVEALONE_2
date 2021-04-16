package com.kh.ila;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.ila.covid.model.service.CoronaVirusDataService;
import com.kh.ila.covid.model.vo.KoreaStats;
import com.kh.ila.weather.model.service.WeatherService;
import com.kh.ila.weather.model.vo.Weather;

@Controller
public class HomeController {
	
	@Autowired
	private CoronaVirusDataService coronaVirusDataService;
	@Autowired
	private WeatherService weatherService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException {


		 	List<KoreaStats> koreaStatsList = coronaVirusDataService.getKoreaCovidDatas();
		 	Weather weather=weatherService.getWeather();
		 
	        model.addAttribute("koreaStats", koreaStatsList);
	        model.addAttribute("weather", weather);
	        
	        System.out.println(weather);

	        return "main";
	}
}
