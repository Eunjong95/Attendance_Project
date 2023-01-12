package com.team5.myapp.reason.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team5.myapp.Pager;
import com.team5.myapp.board.model.BoardFile;
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
   
   // modal & ajax용 사유서 상세보기
   @RequestMapping("/reason/view/{reasonId}/{page}")
   public @ResponseBody Reason getReasonDetailJson(@PathVariable int reasonId, @PathVariable int page,
         HttpSession session, Model model) {
      Reason reason = reasonService.selectReason(reasonId);
      
      model.addAttribute("reason", reason);
      model.addAttribute("page", page);

      logger.info("getReasonDetailJson", reason.toString());
      System.out.println("reason: " + reason.toString());
      return reason;
   }
   
   // modal & ajax용 사유서 상세보기
   @RequestMapping(value = "/reason/view/{reasonId}", method = RequestMethod.GET)
   public @ResponseBody Reason getReasonDetailJson(@PathVariable int reasonId, HttpSession session, Model model) {
      return getReasonDetailJson(reasonId, 1, session, model);
   }
   
   // 사유서 작성 GET
   @RequestMapping(value = "/reason/write", method = RequestMethod.GET)
   public String writeReason() {
      // model.addAttribute("attendanceId", attendanceId);
      return "reason/write";
   }

   // 사유서 작성 POST -> 관리자가 신청을 승인해줘야 attendanceId가 생성되기 때문에 사유서 작성시에는 attendanceId 필요 없음
   @RequestMapping(value = "/reason/write", method = RequestMethod.POST)
   public String writeReason(Reason reason, BindingResult result, HttpSession session,
         RedirectAttributes redirectAttrs) {
      logger.info("/reason/write" + reason.toString());

      String userId = (String) session.getAttribute("userId");
      session.setAttribute("userId", userId);
      System.out.println(session.getAttribute("userId"));

      try {
         reason.setReasonContent(reason.getReasonContent().replace("\r\n", "<br>"));
         reason.setReasonContent(Jsoup.clean(reason.getReasonContent(), Whitelist.basic()));
         MultipartFile files = reason.getFiles();
         if (files != null && !files.isEmpty()) {
         }
         reasonService.insertReason(reason);
      } catch (Exception e) {
         e.printStackTrace();
         //redirectAttrs.addFlashAttribute("message", e.getMessage());
      }
      System.out.println(reason.toString());
      return "redirect:/reason/list"; 
   }
   
   // 사유서 취소 요청 (승인된 사유서에 대해 취소요청 하기)-post
   @RequestMapping(value="/reason/update", method=RequestMethod.POST)
   public String updateReason(Reason reason, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
      System.out.println("reasonId" + reason.getReasonId());
      System.out.println("reasonStatus" + reason.getReasonStatus());
      
      reasonService.updateReasonStatus(reason.getReasonId(), reason.getReasonStatus());   
      return "redirect:/reason/list/" + session.getAttribute("page");
   }
   
   
   // 사유서 삭제 (미승인 사유서면 삭제 가능)
   @RequestMapping(value="/reason/delete", method=RequestMethod.POST)
   public String deleteReason(Reason reason, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {   
      System.out.println("reasonId" + reason.getReasonId());
      
      reasonService.deleteReason(reason.getReasonId());
      return "redirect:/reason/list/" + session.getAttribute("page");
   }
   
   /********* 관리자 *********/
   
   //사유서 목록(관리자)
   @RequestMapping("/admin/reason/list/{reasonListStatus}/{lectureId}/{page}")
   public String getReasonList(@PathVariable("reasonListStatus") int reasonListStatus, @PathVariable(value="lectureId", required = false) Integer lectureId, @PathVariable int page, HttpSession session, Model model) {
      session.setAttribute("page", page);
      session.setAttribute("lectureId", lectureId);
      session.setAttribute("reasonListStatus", reasonListStatus);
      
      int reasonCount = reasonService.selectTotalReasonPage(reasonListStatus, lectureId);
      Pager pager = new Pager(10, 5, reasonCount, page);
      
      List<Reason> reasonList = reasonService.selectReasonList(reasonListStatus, lectureId, pager);
      
      model.addAttribute("reasonList", reasonList);
      model.addAttribute("page", page);
      model.addAttribute("pager", pager);
      return "admin/reason/reasonList";
   }
   
   //사유서 목록(관리자)
   @RequestMapping("/admin/reason/list/{reasonListStatus}/{lectureId}")
   public String getReasonList(@PathVariable("reasonListStatus") int reasonListStatus, @PathVariable(value="lectureId", required = false) Integer lectureId, HttpSession session, Model model) {
      if(lectureId == null) {
         lectureId = 0;
      }
      
      return getReasonList(reasonListStatus, lectureId, 1, session, model);
   }
   
   //사유서 상세보기
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
   
   @RequestMapping("/admin/reason/view/{reasonId}/{page}")
   public String getReasonDetail(@PathVariable int reasonId, @PathVariable int page, HttpSession session, Model model) {
      Reason reason = reasonService.selectReason(reasonId);
      model.addAttribute("reason", reason);
      model.addAttribute("page", page);
      model.addAttribute("lectureId", session.getAttribute("lectureId"));
      model.addAttribute("reasonListStatus", session.getAttribute("reasonListStatus"));
      
      logger.info("getReasonDetail", reason.toString());
      return "admin/reason/reasonView";
   }

   //사유서 승인
   @RequestMapping(value="/admin/reason/approve", method=RequestMethod.POST)
   public String approveReason(Reason reason, HttpSession session) {
      System.out.println("Controller.approveReason.reasonDate: "+ reason.getReasonDate());
      int attendanceId = reasonService.selectAttendanceDate(reason);
      
      if(attendanceId == 0) { //attendance 가 존재하지않음
         reasonService.insertAttendanceStatus(reason);
      } 
      
      reasonService.updateAttendanceStatus(attendanceId, reason);
      
      return "redirect:/admin/reason/list/1/0";
   }
   
   //사유서 반려
   @RequestMapping(value="/admin/reason/reject", method=RequestMethod.POST)
   public String rejectReason(Reason reason, HttpSession session) {
      reasonService.updateReasonStatus(reason.getReasonId(), reason.getReasonStatus());
      
      return "redirect:/admin/reason/list/1/0";
   }
   
   //사유서 취소요청 처리
   @RequestMapping(value="/admin/reason/cancel", method=RequestMethod.POST)
   public String cancelReason(Reason reason, HttpSession session) {
      int attendanceId = reasonService.selectAttendanceDate(reason);
      reasonService.deleteAttendanceStatus(attendanceId, reason);
      reasonService.updateReasonStatus(reason.getReasonId(), reason.getReasonStatus());
      
      return "redirect:/admin/reason/list/1/0";
   }
}