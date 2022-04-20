<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>AM | Project into Deployment</title>
</head>
<body>
<c:url value="/AM/createDeployment/${week}_${year}_${id}" var="createDeployment"/>
<form:form action="${createDeployment}" method="POST" modelAttribute="project">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-7">
						<h4 class="m-0">
							<span style="float: left;">Dự án - Giai đoạn triển khai (Tuần:</span>
							<form:input path="week" class="form-control border-0" value="${current_week}" readonly="true" 
								style="width: 58px; float: left; font-size: 30px; font-weight: bold; margin-top:-7px; background-color: #f4f6f9;" />
							<span style="float: left;">- Năm:</span>
							<form:input path="year" class="form-control border-0" readonly="true" value="${current_year}" 
								style="width: 80px; float: left; padding-right:0px; font-size: 30px; font-weight: bold; margin-top:-7px; background-color: #f4f6f9;" />
							<span style="float: left;">)</span>
						</h4>
					</div>
					<div class="col-sm-2">
						<button type="submit" onclick="return complete_form();">Chuyển giai đoạn</button>
						 <!-- <button type="button" onclick="return complete_form();">Button</button>  -->
					</div>
					<!-- /.col -->
					<div class="col-sm-3">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="<c:url value='/AM/dashboard/${week}' />">Home</a></li>
							<li class="breadcrumb-item active">Deployment</li>
						</ol>
					</div>
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
									<%-- <div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Mã</label>
										</div>
										<form:input type="number" path="id" value="${project_new_id}" class="form-control" readonly="true" />
									</div> --%>
									
									<form:hidden path="id" value="${project_new_id}" class="form-control" readonly="true" />
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">Tên dự án</label>
										</div>
										<form:input path="name" class="form-control" value="${project_old.name}" placeholder="Tên dự án triển khai..." />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100" for="khach_hang">Khách hàng</label>
										</div>
										<form:select path="customer" id="khach_hang" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="customer" items="${customers}">
        										<c:if test="${customer.id == project_old.customer}">
        											<form:option value="${customer.id }" label="${customer.name}" selected="true" class="font-weight-bold bg-info" />
												</c:if>
        										<c:if test="${customer.id != project_old.customer}">
													<form:option value="${customer.id }" label="${customer.name }"/>
												</c:if>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">Loại dự án</label>
										</div>
										<input type="text" value="Triển khai" readonly="readonly" class="form-control" />
										<form:hidden path="project_type" value="1" class="form-control" readonly="true" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100" for="priority">Priority</label>
										</div>
										<form:select path="priority" id="priority" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="priority" items="${priorities}">
        										<c:choose>
   													<c:when test="${priority.id == project_old.priority}">
														<form:option value="${priority.id }" label="${priority.name}" selected="true" class="font-weight-bold bg-info" />
													</c:when>
   													<c:otherwise>
														<form:option value="${priority.id }" label="${priority.name }"/>
													</c:otherwise>
												</c:choose>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100" for="status">Status</label>
										</div>
										<form:select path="project_status" id="status" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="status" items="${status}">
        										<c:choose>
   													<c:when test="${status.id == project_old.project_status}">
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
											<label class="input-group-text w-100">Mã hợp đồng</label>
										</div>
										<form:input path="project_id" class="form-control" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">MS kế toán</label>
										</div>
										<form:input path="ma_so_ke_toan" class="form-control" />
									</div>
									
									<div class="input-group mb-3">
										<form:select path="note" id="select_pic" class="form-control custom-select">  
        									<form:option value="0" label="Người thực hiện (PIC)..."/>  
        									<c:forEach var="pic_form" items="${pic_form}" >
        										<form:option value="${pic_form.pic_id}" label="PM - ${pic_form.display_name}"/>
											</c:forEach>
        								</form:select>
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
											<label class="input-group-text w-100">Tiến độ chung</label>
										</div>
										<form:textarea path="pham_vi_cung_cap" class="form-control" id="add_ckeditor" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Kế hoạch</span>
										</div>
										<textarea id="ke_hoach_test" style="display:none;">${project_old.ke_hoach}</textarea>
										<form:textarea path="ke_hoach" class="form-control" id="cr_ke_hoach" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Khó khăn</span>
										</div>
										<textarea id="kho_khan_test" style="display:none;">${project_old.general_issue}</textarea>
										<form:textarea path="general_issue" class="form-control" id="cr_kho_khan" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Giải pháp</span>
										</div>
										<textarea id="giai_phap_test" style="display:none;">${project_old.solution}</textarea>
										<form:textarea path="solution" class="form-control" id="cr_giai_phap" />
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Kết quả thực hiện</span>
										</div>
										<textarea id="ket_qua_test" style="display:none;">${project_old.ket_qua_thuc_hien_ke_hoach}</textarea>
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
											<label class="input-group-text">Tạm ứng (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_tam_ung_test" placeholder="1.000.000.000" />
										<form:hidden path="so_tien_tam_ung" class="form-control" id="so_tien_tam_ung" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Kế hoạch tạm ứng</label>
										</div>
										<input type="text" id="ke_hoach_tam_ung_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="ke_hoach_tam_ung" id="ke_hoach_tam_ung" class="form-control" />
									</div>
									
									
									
									
									
									
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
	
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
									<div class="input-group mb-1">
										<div class="input-group-prepend ">
											<label class="input-group-text ">DAC(Hợp đồng)</label>
										</div>
										<input type="text" id="DAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="DAC" class="form-control datepickerJavascript" id="DAC" />
									</div>
									<div class="input-group mb-1">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">DAC (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_DAC_test" placeholder="1.000.000.000" />
										<form:hidden path="so_tien_DAC" class="form-control" id="so_tien_DAC" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">Mục tiêu DAC</label>
										</div>
										<input type="text" id="ke_hoach_thanh_toan_DAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="ke_hoach_thanh_toan_DAC" class="form-control datepickerJavascript" id="ke_hoach_thanh_toan_DAC" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">Thực tế DAC</label>
										</div>
										<input type="text" id="thuc_te_thanh_toan_DAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="thuc_te_thanh_toan_DAC" class="form-control datepickerJavascript" id="thuc_te_thanh_toan_DAC" />
									</div>
									
									
									<div class="input-group mb-1">
										<div class="input-group-prepend ">
											<label class="input-group-text ">PAC(Hợp đồng)</label>
										</div>
										<input type="text" id="PAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="PAC" id="PAC" class="form-control datepickerJavascript" />
									</div>
									<div class="input-group mb-1">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">PAC (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_PAC_test" placeholder="1.000.000.000" />
										<form:hidden path="so_tien_PAC" class="form-control" id="so_tien_PAC" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">Mục tiêu PAC</label>
										</div>
										<input type="text" id="ke_hoach_thanh_toan_PAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="ke_hoach_thanh_toan_PAC" class="form-control datepickerJavascript" id="ke_hoach_thanh_toan_PAC" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">Thực tế PAC</label>
										</div>
										<input type="text" id="thuc_te_thanh_toan_PAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="thuc_te_thanh_toan_PAC" class="form-control datepickerJavascript" id="thuc_te_thanh_toan_PAC" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend ">
											<label class="input-group-text ">FAC(Hợp đồng)</label>
										</div>
										<input type="text" id="FAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="FAC" id="FAC" class="form-control datepickerJavascript" />
									</div>
									<div class="input-group mb-1">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">FAC (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="so_tien_FAC_test" placeholder="1.000.000.000" />
										<form:hidden path="so_tien_FAC" class="form-control" id="so_tien_FAC" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">Mục tiêu FAC</label>
										</div>
										<input type="text" id="ke_hoach_thanh_toan_FAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="ke_hoach_thanh_toan_FAC" class="form-control datepickerJavascript" id="ke_hoach_thanh_toan_FAC" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-30">
											<label class="input-group-text w-100">Thực tế FAC</label>
										</div>
										<input type="text" id="thuc_te_thanh_toan_FAC_test" 
											class="form-control datepickerJavascript bg-light" placeholder="Day / Month / Year" readonly="readonly" />
										<form:hidden path="thuc_te_thanh_toan_FAC" class="form-control datepickerJavascript" id="thuc_te_thanh_toan_FAC" />
										
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Tổng giá trị (VNĐ)</label>
										</div>
										<input type="text" value="" class="form-control" id="tong_gia_tri_thuc_te_test" placeholder="1.000.000.000" />
										<form:hidden path="tong_gia_tri_thuc_te" class="form-control" id="tong_gia_tri_thuc_te" />
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
	
	var tinh_trang = document.getElementById('ke_hoach_test').value;
	var ket_qua = document.getElementById('ket_qua_test').value;
	var kho_khan = document.getElementById('kho_khan_test').value;
	var giai_phap = document.getElementById('giai_phap_test').value;
	document.getElementById('cr_ke_hoach').value = tinh_trang;
	document.getElementById('cr_ket_qua').value = ket_qua;
	document.getElementById('cr_kho_khan').value = kho_khan;
	document.getElementById('cr_giai_phap').value = giai_phap;
	
	function complete_form() {
		let priceIdList = ['so_tien_tam_ung_test', 'tong_gia_tri_thuc_te_test', 'so_tien_DAC_test', 'so_tien_PAC_test', 'so_tien_FAC_test'];
		let dateIdList = ['ke_hoach_tam_ung_test', 'DAC_test', 'PAC_test', 'FAC_test', 'ke_hoach_thanh_toan_DAC_test', 'ke_hoach_thanh_toan_PAC_test', 'ke_hoach_thanh_toan_FAC_test','thuc_te_thanh_toan_DAC_test','thuc_te_thanh_toan_PAC_test','thuc_te_thanh_toan_FAC_test'];
		
		let x = $('#select_pic :selected').val();
		if (x == 0) {
		    alert("Yêu cầu chọn PIC cho dự án");
		    return false;
		}
		
		for (var i = 0; i < priceIdList.length; i++) {
			price_into_form(priceIdList[i]);
	    }
		
		for (var i = 0; i < dateIdList.length; i++) {
			date_into_form(dateIdList[i]);
	    }
		
		/* if (document.getElementById('select_pic').value > 0) {
			return true;
		}
		return false; */
	}
	
	function price_into_form(data) {
		var data_price_value = document.getElementById(data).value;
		
		if (document.getElementById(data).value) {
			var string_replace = data_price_value.replaceAll(".", "");
			document.getElementById(data.replace("_test", "")).value = string_replace;
	  	} else {
	  		if(document.getElementById(data.replace("_test", ""))){
	  			document.getElementById(data.replace("_test", "")).remove();
	  	    }
	  	}
	}
	
	function date_into_form(data) {
	  	if (document.getElementById(data).value) {
	  		var a = document.getElementById(data).value;
	  		var day = a.substr(0, 2);
	  		var month = a.substr(5, 2);
	  		var year = a.substr(10, 4);
	  		document.getElementById(data.replace("_test", "")).value = year + "-" + month + "-" + day;
	  	} else {
	  		if(document.getElementById(data.replace("_test", ""))){
	  			document.getElementById(data.replace("_test", "")).remove();
	  	    }
	  	}
	}
</script>
</body>