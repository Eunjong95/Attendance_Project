package com.team5.myapp.reason.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team5.myapp.reason.model.Reason;
import com.team5.myapp.reason.service.IReasonService;

@Controller
public class ReasonController {
	static final Logger logger = LoggerFactory.getLogger(ReasonController.class);

	@Autowired
	IReasonService reasonService;

	// 내 사유서 신청 목록 조회(1페이지 일 때)
	@RequestMapping("/reason/list")
	public String getReasonList(HttpSession session, Model model) {
		return getReasonList(1, session, model);
	}

	// 내 사유서 신청 목록 조회
	@RequestMapping("/reason/list/{page}")
	public String getReasonList(@PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		String userId = (String) session.getAttribute("userId");
		session.setAttribute("userId", userId);

		List<Reason> selectReasonList = reasonService.selectReasonListByUserId(userId, page);
		model.addAttribute("reasonList", selectReasonList);

		// paging start
		int reasonCount = reasonService.selectTotalReasonPageByUserId(userId);
		int totalPageCount = 0;
		if (reasonCount > 0) {
			totalPageCount = (int) Math.ceil(reasonCount / 5.0);
		}
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("page", page);

		logger.info("getReasonList", selectReasonList.toString());

		return "reason/list";
	}

	// 사유서 작성 GET
	@RequestMapping(value = "/reason/write", method = RequestMethod.GET)
	public String writeReason() {
		// model.addAttribute("attendanceId", attendanceId);
		return "reason/write";
	}

	// 사유서 작성 POST -> 관리자가 신청을 승인해줘야 attendanceId가 생성되기 때문에 사유서 작성시에는 attendanceId
	// 필요 없음
	@RequestMapping(value = "/reason/write", method = RequestMethod.POST)
	public String writeReason(Reason reason, BindingResult result, HttpSession session,
			RedirectAttributes redirectAttrs) {
		logger.info("/reason/write" + reason.toString());

		String userId = (String) session.getAttribute("userId");
		session.setAttribute("userId", userId);
		System.out.println(session.getAttribute("userId"));

		try {
//			reason.setReasonContent(reason.getReasonContent().replace("\r\n", "<br>"));
//			reason.setReasonContent(Jsoup.clean(reason.getReasonContent(), Whitelist.basic()));
			MultipartFile files = reason.getFiles();
			if (files != null && !files.isEmpty()) {
			}
			reasonService.insertReason(reason);
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		System.out.println(reason.toString());
		return "redirect:/";
		// return "redirect:/reason/view/{reasonId}";
	}

	// 사유서 목록
	@RequestMapping("/admin/reason/list/{reasonStatus}/{page}")
	public String getReasonList(@PathVariable("reasonStatus") int reasonStatus,
			@RequestParam(value = "lectureId", required = false, defaultValue = "0") int lectureId,
			@PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		List<Reason> reasonList = reasonService.selectReasonList(reasonStatus, lectureId, page);
		model.addAttribute("reasonList", reasonList);
		System.out.println(reasonStatus);
		// paging start
		int bbsCount = reasonService.selectTotalReasonPage(reasonStatus, lectureId);
		int totalPage = 0;
		if (bbsCount > 0) {
			totalPage = (int) Math.ceil(bbsCount / 5.0);
		}

		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page", page);
		model.addAttribute("reasonStatus", reasonStatus);
		return "admin/reason/reasonList";
	}

	@RequestMapping("/admin/reason/list/{reasonStatus}")
	public String getReasonList(@PathVariable("reasonStatus") int reasonStatus,
			@RequestParam(required = false, defaultValue = "0") int lectureId, HttpSession session, Model model) {
		return getReasonList(reasonStatus, lectureId, 1, session, model);
	}

	// 사유서 상세보기
	@RequestMapping("/rfile/{reasonId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int reasonId) {
		Reason reason = reasonService.getFile(reasonId);
		logger.info("getFile " + reason.toString());
		final HttpHeaders headers = new HttpHeaders();
		String[] mtypes = reason.getReasonFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(reason.getReasonFileSize());
		headers.setContentDispositionFormData("attachment", reason.getReasonFileName(), Charset.forName("UTF-8"));
		return new ResponseEntity<byte[]>(reason.getReasonFileData(), headers, HttpStatus.OK);
	}

	@RequestMapping("/reason/view/{reasonId}/{page}")
	public String getReasonDetail(@PathVariable int reasonId, @PathVariable int page, HttpSession session,
			Model model) {
		Reason reason = reasonService.selectReason(reasonId);
		model.addAttribute("reason", reason);
		model.addAttribute("page", page);
		model.addAttribute("lectureId", reason.getLectureId());

		logger.info("getReasonDetail", reason.toString());
		return "admin/reason/reasonView";
	}

	@RequestMapping("/reason/view/{reasonId}")
	public String getBoardDetail(@PathVariable int reasonId, HttpSession session, Model model) {
		return getReasonDetail(reasonId, 1, session, model);
	}

	// 사유서 승인
	@RequestMapping(value = "/reason/approve", method = RequestMethod.POST)
	public String updateReasonStatus(Reason reason, HttpSession session) {
		reasonService.updateReasonStatus(reason.getReasonId(), reason.getReasonStatus());

		return "redirect:/reason/list/1";
	}

}
