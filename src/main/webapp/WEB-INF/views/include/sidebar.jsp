<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Sidebar -->
<c:if test="${role eq 0}">
   <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
</c:if>

<c:if test="${empty userId}">
   <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
</c:if>

<c:if test="${role eq 1}">
   <ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar">
</c:if>
   <!-- Sidebar - Brand -->
   <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/'/>">
      <div class="sidebar-brand-icon ">
         <i class="fas fa-laptop-house" style='font-size:32px'></i>
      </div>
      <div class="sidebar-brand-text mx-3"> OTI LMS
      </div>
   </a>

   <!-- Divider -->
   <hr class="sidebar-divider my-0">

   <!-- Nav Item - Dashboard -->
   <li class="nav-item active"><a class="nav-link" href="#"> 
      <i class="fas fa-laptop"></i> 
      <span>내 강의명</span></a>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider">

   <!-- Heading -->
   <div class="sidebar-heading">Menu</div>

   <!-- Nav Item - Pages Collapse Menu -->
   <c:if test="${role eq 0 || role eq null}">
      <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
            <i class="fa fa-calendar"></i> 
            <span>나의 근태</span>
         </a>
         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <a class="collapse-item" href="<c:url value='/attendance/list'/>">> 출결현황</a> 
               <a class="collapse-item" href="<c:url value='/reason/list/1'/>">> 휴가신청</a>
            </div>
         </div>
      </li>
   </c:if>
   
   <!-- 관리자용 사이드바 -->
   <c:if test="${role eq 1}">
      <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
            <i class="fa-solid fa-clipboard"></i> 
            <span>사유서</span>
         </a>
         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <a class="collapse-item" href="<c:url value='/admin/reason/list/0/1'/>">사유서 요청 목록</a> 
               <a class="collapse-item" href="<c:url value='/admin/reason/list/1/1'/>">사유서 처리 완료 목록</a>
            </div>
         </div>
      </li>
      
      <li class="nav-item">
         <a class="nav-link" href="<c:url value='/admin/lecture/list'/>">
            <i class="fa-solid fa-list"></i> 
            <span>강의 목록</span>
         </a>
      </li>
      
      <li class="nav-item">
         <a class="nav-link" href="<c:url value='/admin/member/list/0'/>">
            <i class="fa-solid fa-users"></i>
            <span>학생 목록</span>
         </a>
      </li>
   </c:if>
   <!-- End of 관리자용 사이드바 -->
   
   <!-- Nav Item - Charts -->
   <li class="nav-item">
      <a class="nav-link" href="<c:url value='/board/cat/2'/>">
         <i class="fa-solid fa-question"></i> 
         <span>문의게시판</span>
      </a>
   </li>

   <!-- Nav Item - Tables -->
   <li class="nav-item">
      <a class="nav-link" href="<c:url value='/board/cat/1'/>">
         <i class="fas fa-fw fa-folder"></i> 
         <span>자료실</span>
      </a>
   </li>

   <!-- Divider -->
   <hr class="sidebar-divider d-none d-md-block">

   <!-- Sidebar Toggler (Sidebar) -->
   <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
   </div>
</ul>
<!-- End of Sidebar -->