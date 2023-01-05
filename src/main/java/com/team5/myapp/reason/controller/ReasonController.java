package com.team5.myapp.reason.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team5.myapp.reason.service.IReasonService;

@Controller
public class ReasonController {
	static final Logger logger = LoggerFactory.getLogger(ReasonController.class);
	
	@Autowired
	IReasonService resaonService;
}
