<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>AM | Project into Deployment</title>
</head>
<body>
<c:url value="/AM/createDeployment/${week}_${year}_${project.id}" var="createDeployment"/>
<form:form action="${createDeployment}" method="POST" modelAttribute="project">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-7">
						<h1 class="m-0">
							<span style="float: left;">Dự án - Giai đoạn triển khai (Tuần:</span>
							<form:input path="week" class="form-control border-0" value="${current_week}" readonly="true" 
								style="width: 58px; float: left; font-size: 30px; font-weight: bold; margin-top:-2px; background-color: #f4f6f9;" />
							<span style="float: left;">- Năm:</span>
							<form:input path="year" class="form-control border-0" readonly="true" value="${current_year}" 
								style="width: 88px; float: left; font-size: 30px; font-weight: bold; margin-top:-2px; background-color: #f4f6f9;" />
							<span style="float: left;">)</span>
						</h1>
					</div>
					<div class="col-sm-2"><button type="submit">Chuyển giai đoạn</button></div>
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
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Mã</label>
										</div>
										<form:input type="number" path="id" value="${project_new_id}" class="form-control" readonly="true" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">Tên dự án</label>
										</div>
										<form:input path="name" class="form-control" placeholder="Tên dự án..." />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100" for="khach_hang">Khách hàng</label>
										</div>
										<form:select path="customer" id="khach_hang" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="customer" items="${customers}">
        										<c:if test="${customer.id == project.customer}">
        											<form:option value="${customer.id }" label="${customer.name }" selected="true" />
												</c:if>
        										<c:if test="${customer.id != project.customer}">
													<form:option value="${customer.id }" label="${customer.name }"/>
												</c:if>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Loại dự án</label>
										</div>
										<input type="text" value="Triển khai" readonly="readonly" class="form-control" />
										<form:input type="number" path="project_type" value="1" class="form-control" readonly="true" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100" for="priority">Priority</label>
										</div>
										<form:select path="priority" id="priority" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="priority" items="${priorities}">
        										<c:if test="${priority.id == project.priority}">
        											<form:option value="${priority.id }" label="${priority.name }" selected="true" />
												</c:if>
        										<c:if test="${priority.id != project.priority}">
													<form:option value="${priority.id }" label="${priority.name }"/>
												</c:if>
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
        										<c:if test="${status.id == project.project_status}">
													<form:option value="${status.id }" label="${status.name }" selected="true" />
												</c:if>
        										<c:if test="${status.id != project.project_status}">
													<form:option value="${status.id}" label="${status.name}"/>
												</c:if>
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
											<label class="input-group-text w-100">Phạm vi cung cấp</label>
										</div>
										<form:textarea path="pham_vi_cung_cap" class="form-control" id="add_ckeditor" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Tình trạng kế hoạch</span>
										</div>
										<form:textarea path="tinh_trang_va_ke_hoach_chi_tiet" class="form-control" id="cr_tinh_trang" />
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Kết quả thực hiện</span>
										</div>
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
										<form:input path="so_tien_tam_ung" value="0" class="form-control" id="so_tien_tam_ung" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Kế hoạch tạm ứng</label>
										</div>
										<form:input type="text" path="ke_hoach_tam_ung" class="form-control datepickerJavascript" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 text-center">DAC</label>
										</div>
										<form:input type="text" path="DAC" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">PAC</label>
										</div>
										<form:input type="text" path="PAC" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">FAC</label>
										</div>
										<form:input type="text" path="FAC" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
	
							<!-- ===== Card: Thông tin dự kiến của dự án ===== -->
							<div class="card bg-gradient-info collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-comments-dollar mr-2"></i> Chi tiết thanh toán
									</h3>
	
									<div class="card-tools">
										<button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="input-group mb-1">
										<div class="input-group-prepend">
											<label class="input-group-text">DAC (VNĐ)</label>
										</div>
										<form:input path="so_tien_DAC" value="0" class="form-control" id="so_tien_DAC" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-50">
											<label class="input-group-text w-100">Kế hoạch DAC</label>
										</div>
										<form:input type="text" path="ke_hoach_thanh_toan_DAC" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend">
											<label class="input-group-text">PAC (VNĐ)</label>
										</div>
										<form:input path="so_tien_PAC" value="0" class="form-control" id="so_tien_PAC" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-50">
											<label class="input-group-text w-100">Kế hoạch PAC</label>
										</div>
										<form:input type="text" path="ke_hoach_thanh_toan_PAC" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
									</div>
									
									<div class="input-group mb-1">
										<div class="input-group-prepend">
											<label class="input-group-text">FAC (VNĐ)</label>
										</div>
										<form:input path="so_tien_FAC" value="0" class="form-control" id="so_tien_FAC" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-50">
											<label class="input-group-text w-100">Kế hoạch FAC</label>
										</div>
										<form:input type="text" path="ke_hoach_thanh_toan_FAC" class="form-control datepickerJavascript" placeholder="Day / Month / Year" />
									</div>
									
									<div class="input-group">
										<div class="input-group-prepend">
											<label class="input-group-text">Tổng giá trị</label>
										</div>
										<form:input path="tong_gia_tri_thuc_te" value="0" class="form-control" id="tong_gia_tri_thuc_te" />
									</div>
								</div>
								<!-- /.card-body -->
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
	
	let idList = ['so_tien_tam_ung', 'so_tien_DAC', 'so_tien_PAC', 'so_tien_FAC', 'tong_gia_tri_thuc_te']
	for (var i = 0; i < idList.length; i++) {
		setInputFilter(document.getElementById(idList[i]), function(value) {
			return /^(\d*\.?)*$/.test(value); // Allow digits and '.' only, using a RegExp
		});
    }
	
</script>
</body>