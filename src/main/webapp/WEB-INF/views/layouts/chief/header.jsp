<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<nav class="main-header navbar navbar-expand navbar-white navbar-light " style="background: #DCDCDC;">
	<!-- Left navbar links -->
	<ul class="navbar-nav topnav" id="myTopnav">
		<li class="nav-item dp-il">
			<a class="nav-link" data-widget="pushmenu" href="#" role="button">
				<i class="fas fa-bars" style="font-size: 25px;"></i>
			</a>
		</li>
		<li class="nav-item" id="fullScreen">
			<a class="nav-link" data-widget="fullscreen" href="#" role="button">
				<i class="fas fa-expand-arrows-alt" style="font-size: 25px;"></i>
			</a>
		</li>
		
		<li class="nav-item dp-il" style="width: 300px; padding-top: 7px;">
			<font color="orange" style="font-size: 18px; padding-top: 1px">
    			<b>Tuần / Năm:</b>
    		</font>
    		<%-- <select id="select_week" onchange="location = this.value;" class="w-25"></select> --%>
    		<select id="select_week" class="w-25"></select>
    		<label class="ml-1 h5" style="margin-right: -8px;">/</label>
    		<select id="select_year" class="w-25"></select>
		</li>
		<li class="nav-item"><a href="javascript:void(0);" class="icon" onclick="myFunction()">
			   <i class="fas fa-th-list" style="font-size: 25px;"></i>
			  </a>
		</li>
		<li class="nav-item"  id="li_1" >
			<c:forEach items="${project_types}" var="types" varStatus="type_status">
				<div class="row">
					<div class="col-12"><b>Báo cáo ${ types.name } (tuần ${week})</b></div>
					
					<c:url value="${ (types.id - 1) * 10 }" var="position"/> <!-- Tạo biến đánh số vị trí trong mảng thống kê -->
					
					<div class="col-3">
						<span class="badge badge-statistic badge-danger">${ statistics[position] }</span>
                		<span class="badge badge-statistic badge-warning">${ statistics[position + 1] }</span>
                		<span class="badge badge-statistic badge-success">${ statistics[position + 2] }</span>
					</div>
					<div class="col-3">
						<span class="badge badge-statistic badge-danger">${ statistics[position + 3] }</span>
                  		<span class="badge badge-statistic badge-warning">${ statistics[position + 4] }</span>
                  		<span class="badge badge-statistic badge-success">${ statistics[position + 5] }</span>
					</div>
					<div class="col-3">
						<span class="badge badge-statistic badge-danger">${ statistics[position + 6] }</span>
                  		<span class="badge badge-statistic badge-warning">${ statistics[position + 7] }</span>
                  		<span class="badge badge-statistic badge-success">${ statistics[position + 8] }</span>
					</div>
					<%-- <div class="col-3 pl-3">
						<span class="badge badge-statistics badge-primary  ">${ statistics[position + 9] }</span>
					</div> --%>
				</div>
			</c:forEach>

			<div class="row" style="font-weight: bold;">
				
				<div class="col-3" >Ưu tiên 1</div>
				<div class="col-3" >Ưu tiên 2</div>
				<div class="col-3" >Ưu tiên 3</div>
				<%-- <div class="col-3" >Done</div> --%>
			</div>
		</li>
		
	</ul>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto" id="thong-ke">
		
		<li class="nav-item text-uppercase" style="width: 700px;" id="li_2">
			<c:forEach items="${project_types}" var="types" varStatus="type_status">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5"><b>Báo cáo ${ types.name } (tuần ${week})</b></div>
					
					<c:url value="${ (types.id - 1) * 10 }" var="position"/> <!-- Tạo biến đánh số vị trí trong mảng thống kê -->
					
					<div class="col-2">
						<span class="badge badge-danger right badge-statistics">${ statistics[position] }</span>
                		<span class="badge badge-warning right badge-statistics">${ statistics[position + 1] }</span>
                		<span class="badge badge-success right badge-statistics">${ statistics[position + 2] }</span>
					</div>
					<div class="col-2">
						<span class="badge badge-danger right badge-statistics">${ statistics[position + 3] }</span>
                  		<span class="badge badge-warning right badge-statistics">${ statistics[position + 4] }</span>
                  		<span class="badge badge-success right badge-statistics">${ statistics[position + 5] }</span>
					</div>
					<div class="col-2">
						<span class="badge badge-danger right badge-statistics">${ statistics[position + 6] }</span>
                  		<span class="badge badge-warning right badge-statistics">${ statistics[position + 7] }</span>
                  		<span class="badge badge-success right badge-statistics">${ statistics[position + 8] }</span>
					</div>
					<%-- <div class="col-1 pl-2">
						<span class="badge badge-primary right badge-statistics">${ statistics[position + 9] }</span>
					</div> --%>
				</div>
			</c:forEach>

			<div class="row" style="font-weight: bold;">
				<div class="col-md-1"></div>
				<div class="col-md-5"></div>
				<div class="col-md-2" style="padding-left: 11px;">Ưu tiên 1</div>
				<div class="col-md-2" style="padding-left: 11px;">Ưu tiên 2</div>
				<div class="col-md-2" style="padding-left: 11px;">Ưu tiên 3</div>
				<%-- <div class="col-md-1" style="margin-left: -7px;">Done</div> --%>
			</div>
		</li>
	</ul>
	
</nav>