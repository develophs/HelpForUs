package com.kh.HelpForUs.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.HelpForUs.common.model.service.CommonService;

@Controller
public class CommonController {
	
	Gson gson = new Gson();

	@Autowired
	private CommonService cService;
	
	@RequestMapping("count.co")
	public void count(HttpServletResponse response) {
		int roseCount = 0;
		ArrayList<Integer> roses = cService.countRose();
		int appCount = cService.countApp();
		
		for(int rose : roses) {
			roseCount += rose;
		}
		
		ArrayList<Integer> count = new ArrayList<>();
		count.add(roseCount);
		count.add(appCount);
		
		response.setContentType("application/json; charset=UTF-8");
		
		try {
			gson.toJson(count, response.getWriter());
		} catch (JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
