<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>AM | Project into Deployment</title>
</head>
<body>
<c:url value="/AM/createDeployment_test" var="createDeployment"/>
<form:form action="${createDeployment}" method="POST" modelAttribute="project">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-7"></div>
					<div class="col-sm-2">
						<button type="submit" class="btn" onclick="return complete_form();">Submit</button>
					</div>
					<!-- /.col -->
					<div class="col-sm-3"></div>
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
						<section class="col-lg-12 connectedSortable">
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
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100">Tên dự án</label>
										</div>
										<form:input path="name" class="form-control" placeholder="Tên dự án triển khai..." />
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
										<form:select path="project_type" id="project_type" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="type" items="${type}">
        										<c:if test="${type.id == 1}">
        											<form:option value="${type.id}" label="${type.name}" selected="true"/>
        										</c:if>
        										<c:if test="${type.id != 1}">
        											<form:option value="${type.id}" label="${type.name}"/>
        										</c:if>
											</c:forEach>
        								</form:select>
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
											<span class="input-group-text w-100"><b>Tình trạng & kế hoạch chi tiết</b></span>
										</div>
										<textarea id="tinh_trang_test" style="display:none;">${project_old.tinh_trang_va_ke_hoach_chi_tiet}</textarea>
										<form:textarea path="tinh_trang_va_ke_hoach_chi_tiet" class="form-control" id="cr_tinh_trang_test" />
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100"><b>Kết quả thực hiện kế hoạch</b></span>
										</div>
										<textarea id="ket_qua_test" style="display:none;">${project_old.ket_qua_thuc_hien_ke_hoach}</textarea>
										<form:textarea path="ket_qua_thuc_hien_ke_hoach" class="form-control" id="cr_ket_qua_test" />
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
						<!-- /.Left col -->
					</div>
					<!-- /.row (main row) -->
				
				
				
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
</form:form>

<script>
	$( document ).ready(function() {
		$("#cr_tinh_trang_test ,#cr_ket_qua_test").ckeditor({
			editorplaceholder: 'Nội dung...',
		  	toolbar: [
				{ name: 'document', items: [ 'Source', '-' ] },											
				{ name: 'undo', items: [ 'Undo', 'Redo' ] },																
				{ name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-' ] },																									
				{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', '-', 'Subscript', 'Superscript', '-' ] },
				{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				{ name: 'indent', items: [ 'Outdent','Indent' ] },
				{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
				{ name: 'tools', items: [ 'Maximize' ] },
			],
			uiColor : '#F7D358',
			height  : 300 
	  	});
	});
	
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
	
	let idList = ['tong_gia_tri_thuc_te_test'];
	for (var i = 0; i < idList.length; i++) {
		setInputFilter(document.getElementById(idList[i]), function(value) {
			return /^(\d*\.?)*$/.test(value); // Allow digits and '.' only, using a RegExp
		});
    }
	
	function complete_form() {
		let priceIdList = ['tong_gia_tri_thuc_te_test'];
		
		let x = $('#select_pic :selected').val();
		if (x == 0) {
		    alert("Yêu cầu chọn PIC cho dự án");
		    return false;
		}
		
		for (var i = 0; i < priceIdList.length; i++) {
			price_into_form(priceIdList[i]);
	    }
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
</script>

</body>