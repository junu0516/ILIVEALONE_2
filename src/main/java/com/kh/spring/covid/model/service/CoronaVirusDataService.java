package com.kh.spring.covid.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.spring.covid.model.vo.KoreaStats;

import org.jsoup.Jsoup;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


@Service
public class CoronaVirusDataService {

	private static String KOREA_COVID_DATAS_URL = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13";


	public List<KoreaStats> getKoreaCovidDatas() throws IOException {
	
	        List<KoreaStats> koreaStatsList = new ArrayList<>();
	        Document doc = Jsoup.connect(KOREA_COVID_DATAS_URL).get();
	
	        Elements contents = doc.select("table tbody tr");
	
	        for(Element content : contents){
	            Elements tdContents = content.select("td");
	
	            KoreaStats koreaStats = new KoreaStats(
	                    content.select("th").text(),
	                    tdContents.get(0).text(),
	                    tdContents.get(1).text(),
	                    tdContents.get(2).text(),
	                    tdContents.get(3).text(),
	                   tdContents.get(4).text()
	                    );
	            
	            koreaStatsList.add(koreaStats);
	        }
	
	        return koreaStatsList;
	
	}

}
