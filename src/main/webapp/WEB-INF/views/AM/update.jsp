<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>AM | Update project</title>
</head>
<body>
<c:url value="/AM/updateProject/${week}_${year}_${project.id}" var="updateProject"/>
<form:form action="${updateProject}" method="POST" modelAttribute="project">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h4 class="m-0">
							<span style="float: left;">Cập nhật dự án (Tuần:</span>
							<form:input path="week" class="form-control border-0" value="${week}" readonly="true" 
								style="width: 58px; float: left; font-size: 30px; font-weight: bold; margin-top:-7px; background-color: #f4f6f9;" />
							<span style="float: left;">- Năm:</span>
							<form:input path="year" class="form-control border-0" readonly="true" value="${current_year}" 
								style="width: 80px; float: left; padding-right:0px; font-size: 30px; font-weight: bold; margin-top:-7px; background-color: #f4f6f9;" />
							<span style="float: left;">)</span>
						</h4>
					</div>
					<div class="col-sm-2"><button type="submit">Update</button></div>
					<!-- /.col -->
					<div class="col-sm-4">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="<c:url value='/AM/home/${week}_${year}' />">Home</a></li>
							<li class="breadcrumb-item active">Update</li>
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
							<!-- ===== Card: Thông tin định danh ===== -->
							<div class="card bg-gradient-secondary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard mr-2"></i> Định danh
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
											<label class="input-group-text fw-400" >Tên dự án</label>
										</div>
										<form:hidden path="id" />
										<form:input path="name" class="form-control" placeholder="Tên dự án..." />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Mô tả dự án</span>
										</div>
										<form:textarea path="description" class="form-control" id="cr_mo_ta_du_an" />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
						
							<!-- ===== Card: Thông tin thực trạng ===== -->
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
							<!-- ===== Card: Phân loại dự án ===== -->
							<div class="card bg-gradient-primary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard-list mr-2"></i> Phân loại
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
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400"  for="loai_du_an">Loại dự án</label>
										</div>
										<form:select path="project_type" id="loai_du_an" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="type" items="${type}">
        										<c:if test="${type.id != 1}">
	        										<c:if test="${type.id == project.project_type}">
	        											<form:option value="${type.id }" label="${type.name }" selected="true" />
													</c:if>
	        										<c:if test="${type.id != project.project_type}">
														<form:option value="${type.id }" label="${type.name }"/>
													</c:if>
												</c:if>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400"  for="khach_hang">Khách hàng</label>
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
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100 fw-400"  for="priority">Priority</label>
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
											<label class="input-group-text w-100 fw-400"  for="status">Status</label>
										</div>
										<form:select path="project_status" id="status" class="custom-select">  
        									<form:option value="0" label="Choose..."/>  
        									<c:forEach var="status" items="${status}">
        										<c:if test="${status.id == project.project_status}">
													<form:option value="${status.id }" label="${status.name }" selected="true" />
												</c:if>
        										<c:if test="${status.id != project.project_status}">
													<form:option value="${status.id }" label="${status.name }"/>
												</c:if>
											</c:forEach>
        								</form:select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400" >Hình thức đầu tư</label>
										</div>
										<form:input path="hinh_thuc_dau_tu" class="form-control" id="hinh_thuc_dau_tu" placeholder="Hình thức đầu tư..." />
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
	
							<!-- ===== Card: Thông tin dự kiến của dự án ===== -->
							<div class="card bg-gradient-info collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-comments-dollar mr-2"></i> Dự kiến
									</h3>
	
									<div class="card-tools">
										<button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400" >Tổng mức đầu tư</label>
										</div>
										<form:input path="tong_muc_dau_tu_du_kien" class="form-control" id="tong_muc_dau_tu" placeholder="Tổng mức đầu tư..." />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400" >Mức độ khả thi (%)</label>
										</div>
										<form:input type="number" min="0" path="muc_do_kha_thi" class="form-control" id="muc_do_kha_thi" placeholder="Mức độ khả thi..." />
									</div>
								
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<label class="input-group-text w-100 fw-400" >Phân tích SWOT</label>
										</div>
										<form:textarea path="phan_tich_SWOT" class="form-control" id="cr_swot" />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text fw-400" >Ghi chú</label>
										</div>
										<form:input path="note" class="form-control" id="note" placeholder="Ghi chú..." />
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
</body>