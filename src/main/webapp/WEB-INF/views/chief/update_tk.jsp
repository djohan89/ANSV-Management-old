<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<title>CEO | Update project</title>
</head>
<body>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<c:url value="/chief/updateProjectTkCEO/${project_update.week}_${project_update.year}_${project_update.id}" var="updateProjectTkCEO"/> 
<form:form action="${updateProjectTkCEO}" method="POST" modelAttribute="project_update">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-8">
						<h1 class="m-0">
							<span style="float: left;">Dự án - Giai đoạn triển khai (Tuần:</span>
							<form:input path="week" class="form-control border-0" value="${week}" readonly="true" 
								style="width: 58px; float: left; font-size: 30px; font-weight: bold; margin-top:-2px; background-color: #f4f6f9;" />
							<span style="float: left;">- Năm:</span>
							<form:input path="year" class="form-control border-0" readonly="true" value="${current_year}" 
								style="width: 80px; float: left; padding-right:0px; font-size: 30px; font-weight: bold; margin-top:-2px; background-color: #f4f6f9;" />
							<span style="float: left;">)</span>
						</h1>
					</div>
					<div class="col-4">
						<button type="submit" class="btn btn-primary" onclick="return complete_form();">Cập nhật</button>
						<!-- <button type="button" onclick="return complete_form();">Button</button> -->
					</div>
					<!-- /.col -->
					<%-- <div class="col-sm-3">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="<c:url value='/AM/dashboard/${week}' />">Home</a></li>
							<li class="breadcrumb-item active">Deployment</li>
						</ol>
					</div> --%>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->



		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
			
			

					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section class="col-lg-7 connectedSortable">
							<!-- ===== Card: Định danh & Phân loại ===== -->
							<div class="card bg-gradient-secondary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard mr-2"></i> Định danh & Phân loại
									</h3>
									<!-- card tools -->
									<div class="card-tools">
										<button type="button" class="btn btn-light btn-sm"
											data-card-widget="collapse" title="Collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<div class="card-body">
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Tên dự án</label>
										</div>
										<form:hidden path="id"/>
										<form:input path="name" class="form-control" value="${project_update.name}" placeholder="Tên dự án triển khai..." />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400" for="khach_hang">Khách hàng</label>
										</div>
										<form:select path="customer" id="khach_hang" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="customer" items="${customers_form}">
	        									<c:choose>
	        										<c:when test="${customer.id == project_update.customer}">
	        											<form:option value="${customer.id }" label="${customer.name}" selected="true" class="font-weight-bold bg-info" />
													</c:when>
	        										<c:otherwise>
														<form:option value="${customer.id }" label="${customer.name }"/>
													</c:otherwise>
												</c:choose>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400">Loại dự án</label>
										</div>
										<input type="text" value="Triển khai" readonly="readonly" class="form-control" />
										<form:hidden  path="project_type" value="1" class="form-control" readonly="true" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400" for="priority">Priority</label>
										</div>
										<form:select path="priority" id="priority" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="priority" items="${priorities}">
        										<c:choose>
   													<c:when test="${priority.id == project_update.priority}">
														<form:option value="${priority.id}" label="${priority.name}" selected="true" class="font-weight-bold bg-info" />
													</c:when>
   													<c:otherwise>
														<form:option value="${priority.id}" label="${priority.name}"/>
													</c:otherwise>
												</c:choose>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400" for="status">Status</label>
										</div>
										<form:select path="project_status" id="status" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="status" items="${status}">
        										<c:choose>
   													<c:when test="${status.id == project_update.project_status}">
														<form:option value="${status.id }" label="${status.name}" selected="true" class="font-weight-bold bg-info" />
													</c:when>
   													<c:otherwise>
														<form:option value="${status.id }" label="${status.name }"/>
													</c:otherwise>
												</c:choose>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Mã hợp đồng</label>
										</div>
										<form:input path="project_id" class="form-control" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">MS kế toán</label>
										</div>
										<form:input path="ma_so_ke_toan" class="form-control" />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						
							<!-- ===== Card: Thực trạng ===== -->
							<div class="card bg-gradient-secondary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-book-reader mr-2"></i> Thực trạng
									</h3>
									<!-- card tools -->
									<div class="card-tools">
										<button type="button" class="btn btn-light btn-sm"
											data-card-widget="collapse" title="Collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<div class="card-body">
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<label class="input-group-text w-100 fw-400">Tiến độ chung</label>
										</div>
										<form:textarea path="pham_vi_cung_cap" class="form-control" id="add_ckeditor" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<label class="input-group-text w-100 fw-400">Khó khăn</label>
										</div>
										<textarea id="general_issue_test" style="display:none;">${project_update.general_issue}</textarea>
										<form:textarea path="general_issue" class="form-control" id="cr_general_issue" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<label class="input-group-text w-100 fw-400">Giải pháp</label>
										</div>
										<%-- <textarea id="solution_test" style="display:none;">${project_update.solution}</textarea> --%>
										<form:textarea path="solution" class="form-control" id="cr_solution" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<label class="input-group-text w-100 fw-400">Kế hoạch</label>
										</div>
										<%-- <textarea id="ke_hoach_test" style="display:none;">${project_update.ke_hoach}</textarea> --%>
										<form:textarea path="ke_hoach" class="form-control" id="cr_ke_hoach" />
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<label class="input-group-text w-100 fw-400">Kết quả thực hiện</label>
										</div>
										<%-- <textarea id="ket_qua_test" style="display:none;">${project_update.ket_qua_thuc_hien_ke_hoach}</textarea> --%>
										<form:textarea path="ket_qua_thuc_hien_ke_hoach" class="form-control" id="cr_ket_qua" />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- /.Left col -->
						
						
						
						<!-- right col (We are only adding the ID to make the widgets sortable)-->
						<section class="col-lg-5 connectedSortable">
							<!-- ===== Card: Thông tin dự kiến của dự án ===== -->
							<div class="card bg-gradient-info collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard-list mr-2"></i> Thanh toán
									</h3>
									<!-- card tools -->
									<div class="card-tools">
										<button type="button" class="btn btn-info btn-sm"
											data-card-widget="collapse" title="Collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<div class="card-body">
									<!-- DAC -->
									<div class="input-group mb-1 mt-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">DAC (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_DAC_test" />
										<fmt:formatNumber type="number" value="${project_update.so_tien_DAC }" 
											var="so_tien_DAC"/>
										<form:hidden path="so_tien_DAC" class="form-control" value="${so_tien_DAC}" 
											id="so_tien_DAC1" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Hợp đồng</label>
										</div>
										<input type="text" id="DAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="DAC" 
											class="form-control datepickerJavascript" id="DAC1" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Mục tiêu</label>
										</div>
										<input type="text" id="ke_hoach_thanh_toan_DAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="ke_hoach_thanh_toan_DAC" 
											class="form-control datepickerJavascript" id="ke_hoach_thanh_toan_DAC1" />
									</div>
									
									<div class="input-group mb-4">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Thực tế</label>
										</div>
										<input type="text" id="thuc_te_thanh_toan_DAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="thuc_te_thanh_toan_DAC" 
											class="form-control datepickerJavascript" id="thuc_te_thanh_toan_DAC1" />
									</div>
									
									
									
									<!-- PAC -->
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">PAC (VNĐ)</label>
										</div>
										<input type="text" class="form-control" value="" id="so_tien_PAC_test" />
										<fmt:formatNumber type="number" value="${project_update.so_tien_PAC}" 
											var="so_tien_PAC"/>
										<form:hidden path="so_tien_PAC" class="form-control" value="${so_tien_PAC}" 
											id="so_tien_PAC1" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Hợp đồng</label>
										</div>
										<input type="text" id="PAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="PAC" 
											class="form-control datepickerJavascript" id="PAC1" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Mục tiêu</label>
										</div>
										<input type="text" id="ke_hoach_thanh_toan_PAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="ke_hoach_thanh_toan_PAC" 
											class="form-control datepickerJavascript" id="ke_hoach_thanh_toan_PAC1" />
									</div>
									
									<div class="input-group mb-4">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Thực tế</label>
										</div>
										<input type="text" id="thuc_te_thanh_toan_PAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="thuc_te_thanh_toan_PAC" 
											class="form-control datepickerJavascript" id="thuc_te_thanh_toan_PAC1" />
									</div>
									
									
									
									<!-- FAC -->
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">FAC (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_FAC_test" />
										<fmt:formatNumber type="number" value="${project_update.so_tien_FAC }" 
											var="so_tien_FAC"/>
										<form:hidden path="so_tien_FAC" class="form-control" value="${so_tien_FAC }" 
											id="so_tien_FAC1" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Hợp đồng</label>
										</div>
										<input type="text" id="FAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="FAC" 
											class="form-control datepickerJavascript" id="FAC1" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Mục tiêu</label>
										</div>
										<input type="text" id="ke_hoach_thanh_toan_FAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="ke_hoach_thanh_toan_FAC" 
											class="form-control datepickerJavascript" id="ke_hoach_thanh_toan_FAC1" />
									</div>
									
									<div class="input-group mb-2">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400">Thực tế</label>
										</div>
										<input type="text" id="thuc_te_thanh_toan_FAC_test" readonly="readonly" 
											value="" class="form-control datepickerJavascript" 
											placeholder="Day / Month / Year" />
										<form:hidden path="thuc_te_thanh_toan_FAC" 
											class="form-control datepickerJavascript" id="thuc_te_thanh_toan_FAC1" />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
							
							<!-- ===== Card: Tạm ứng & Kế hoạch nghiệm thu ===== -->
							<div class="card bg-gradient-primary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard-list mr-2"></i> Tạm ứng & Kế hoạch nghiệm thu
									</h3>
									<!-- card tools -->
									<div class="card-tools">
										<button type="button" class="btn btn-primary btn-sm"
											data-card-widget="collapse" title="Collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<!-- /.card-tools -->
								</div>
								<div class="card-body">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400">Tổng giá trị (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="tong_gia_tri_thuc_te_test" />
										<fmt:formatNumber type="number" value="${project_update.tong_gia_tri_thuc_te }" 
											var="tong_gia_tri"/>
										<form:hidden path="tong_gia_tri_thuc_te" class="form-control" 
											id="tong_gia_tri_thuc_te1" value="${tong_gia_tri }" />
									</div>
								
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400">Tạm ứng (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_tam_ung_test" />
										<fmt:formatNumber type="number"
														value="${project_update.so_tien_tam_ung }" var="so_tien_tam_ung"/>
										<form:hidden path="so_tien_tam_ung" value="${so_tien_tam_ung }" class="form-control" id="so_tien_tam_ung1" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400">Kế hoạch tạm ứng</label>
										</div>
										<input type="text" id="ke_hoach_tam_ung_test" readonly="readonly" value="" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
										<form:hidden  path="ke_hoach_tam_ung" id="ke_hoach_tam_ung1" class="form-control" />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						</section>
						<!-- right col -->
					</div>
					<!-- /.row (main row) -->
				
				
				
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
</form:form>

<script type="text/javascript">
	//Restricts input for the given textbox to the given inputFilter function.
	function setInputFilter(textbox, inputFilter) {
	  	["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
	    	textbox.addEventListener(event, function() {
		      	if (inputFilter(this.value)) {
			        this.oldValue = this.value;
			        this.oldSelectionStart = this.selectionStart;
			        this.oldSelectionEnd = this.selectionEnd;
		      	} else if (this.hasOwnProperty("oldValue")) {
			        this.value = this.oldValue;
			        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
		      	} else {
		        	this.value = "";
		      	}
			});
	  	});
	}
	
	let idList = ['so_tien_tam_ung_test', 'so_tien_DAC_test', 'so_tien_PAC_test', 'so_tien_FAC_test', 'tong_gia_tri_thuc_te_test'];
	for (var i = 0; i < idList.length; i++) {
		setInputFilter(document.getElementById(idList[i]), function(value) {
			return /^(\d*\.?)*$/.test(value); // Allow digits and '.' only, using a RegExp
		});
    }
	
	function complete_form() {
		let priceIdList = ['so_tien_tam_ung_test', 'tong_gia_tri_thuc_te_test', 'so_tien_DAC_test', 'so_tien_PAC_test', 'so_tien_FAC_test'];
		let dateIdList = ['ke_hoach_tam_ung_test', 'DAC_test', 'PAC_test', 'FAC_test', 
			'ke_hoach_thanh_toan_DAC_test', 'ke_hoach_thanh_toan_PAC_test', 'ke_hoach_thanh_toan_FAC_test', 
			'thuc_te_thanh_toan_DAC_test', 'thuc_te_thanh_toan_PAC_test', 'thuc_te_thanh_toan_FAC_test'];
		
		for (var i = 0; i < priceIdList.length; i++) {
			price_into_form(priceIdList[i]);
	    }
		
		for (var i = 0; i < dateIdList.length; i++) {
			date_into_form(dateIdList[i]);
	    }
	}
	
	function price_into_form(data) {
		var data_price_value = document.getElementById(data).value;
		var string_replace = "";
		
		if (document.getElementById(data).value) {
			string_replace = data_price_value.replaceAll(".", "");
			document.getElementById(data.replace("_test", "1")).value = string_replace;
	  	}else{
	  		document.getElementById(data.replace("_test", "1")).remove();
	  	}
		
		
	}
	
	function date_into_form(data) {
	  	if (document.getElementById(data).value) {
	  		var a = document.getElementById(data).value;
	  		var day = a.substr(0, 2);
	  		var month = a.substr(5, 2);
	  		var year = a.substr(10, 4);
	  		document.getElementById(data.replace("_test", "1")).value = year + "-" + month + "-" + day;
	  	}else{
	  		document.getElementById(data.replace("_test", "1")).remove();
	  	}
	}
	
	$( document ).ready(function() {
		// Get input value
		/* var general_issue_test = document.getElementById('general_issue_test').value;
		var solution_test = document.getElementById('solution_test').value;
		var ke_hoach_test = document.getElementById('ke_hoach_test').value;
		var ket_qua_test = document.getElementById('ket_qua_test').value; */
		
		// Replace value
		/* document.getElementById('cr_general_issue').value = general_issue_test;
		document.getElementById('cr_solution').value = solution_test;
		document.getElementById('cr_ke_hoach').value = ke_hoach_test;
		document.getElementById('cr_ket_qua').value = ket_qua_test; */
		
		load();
		
		function load(){
			let priceId_list = ['so_tien_tam_ung1', 'tong_gia_tri_thuc_te1', 'so_tien_DAC1', 'so_tien_PAC1', 'so_tien_FAC1'];
			let dateId_list = ['ke_hoach_tam_ung1', 'DAC1', 'PAC1', 'FAC1', 
				'ke_hoach_thanh_toan_DAC1', 'ke_hoach_thanh_toan_PAC1', 'ke_hoach_thanh_toan_FAC1', 
				'thuc_te_thanh_toan_DAC1', 'thuc_te_thanh_toan_PAC1', 'thuc_te_thanh_toan_FAC1'];
			
			for (var i = 0; i < priceId_list.length; i++) {
				form_into_price(priceId_list[i]);
		    }
			
			for (var i = 0; i < dateId_list.length; i++) {
				form_into_date(dateId_list[i]);
		    }
		}
		
		
		function form_into_price(data) {
			var data_price_value = document.getElementById(data).value;
			var string_replace = "";
			
			if (document.getElementById(data).value) {
				string_replace = data_price_value.replaceAll(",", ".");
				document.getElementById(data.replace("1", "_test")).value = string_replace;
		  	}
			
		}
		
		function form_into_date(data) {
		  	if (document.getElementById(data).value) {
		  		var a = document.getElementById(data).value;
		  		var day = a.substr(8, 2);
		  		var month = a.substr(5, 2);
		  		var year = a.substr(0, 4);
		  		document.getElementById(data.replace("1", "_test")).value = day + " / " + month + " / " + year;
		  	}
		}
	});
	
	
	
	
</script>
</body>