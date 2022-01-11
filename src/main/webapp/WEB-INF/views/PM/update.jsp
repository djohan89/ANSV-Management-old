<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<title>PM | Update project</title>
</head>
<body>
<c:url value="/PM/updateProject/${week}_${year}_${project.id}" var="updateProject"/> 
<form:form action="${updateProject}" method="POST" modelAttribute="project">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-5">
						<h1 class="m-0">
							<span style="float: left;">Cập nhật dự án (Tuần:</span>
							<form:input path="week" class="form-control border-0" value="${current_week}" readonly="true" 
								style="width: 58px; float: left; font-size: 30px; font-weight: bold; margin-top:-2px; background-color: #f4f6f9;" />
							<span style="float: left;">- Năm:</span>
							<form:input path="year" class="form-control border-0" readonly="true" value="${current_year}" 
								style="width: 88px; float: left; font-size: 30px; font-weight: bold; margin-top:-2px; background-color: #f4f6f9;" />
							<span style="float: left;">)</span>
						</h1>
					</div>
					<div class="col-sm-2"><button type="submit">Update </button></div>
					<!-- /.col -->
					
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
											<label class="input-group-text">Tên dự án</label>
										</div>
										<form:hidden path="id" />
										<form:input path="name" class="form-control" placeholder="Tên dự án..." />
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-100">
											<span class="input-group-text w-100">Phạm vi cung cấp </span>
										</div>
										<form:textarea path="pham_vi_cung_cap" class="form-control" id="cr_mo_ta_du_an" />
									</div>
									 
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text">Tổng giá trị</label>
										</div>
										<fmt:formatNumber type="number"
														value="${project.tong_gia_tri_thuc_te}" var="tong_gia_tri"/>
														 
										<form:input  path="tong_gia_tri_thuc_te"  value="${tong_gia_tri }"  class="form-control" placeholder="Tổng giá trị" />
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
							
							<div class="card bg-gradient-secondary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard mr-2"></i> Kế hạch nghiệm thu & Thanh toán tạm ứng
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
									<div class="card bg-gradient-light collapsed-card">
										<!--test card  -->
										<div class="card-header border-0">
											<h3 class="card-title">
												<i class="fas fa-clipboard mr-2"></i> Kế hoạch nghiệm thu
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
													<label class="input-group-text">DAC</label>
												</div>
												<form:input path="DAC" type="date" class="form-control" placeholder="DAC" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text">PAC</label>
												</div>
												<form:input path="PAC" type="date" class="form-control" placeholder="PAC" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text">FAC</label>
												</div> 
												<form:input path="FAC" type="date" class="form-control" placeholder="FAC" />
											</div>
											
											
										</div>
										<!-- /.card-body-->
									</div>
									
									<div class="card bg-gradient-light collapsed-card">
										<!--test card  -->
										<div class="card-header border-0">
											<h3 class="card-title">
												<i class="fas fa-clipboard mr-2"></i> Thanh toán tạm ứng
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
													<label class="input-group-text">Số tiền</label>
												</div>
												<form:input path="so_tien_tam_ung" type="number" class="form-control" placeholder="so_tien_tam_ung" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text">Kế hoạch</label>
												</div> 
												<form:input path="ke_hoach_tam_ung" type="date" class="form-control" placeholder="ke_hoach_tam_ung" />
											</div>
										</div>
										<!-- /.card-body-->
									</div>
									
									
									
									<!--End test card  -->
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
											<label class="input-group-text w-100" for="loai_du_an">Loại dự án</label>
										</div>
										<form:select path="project_type" id="loai_du_an" class="custom-select" >  
        									<form:option value="1" label="Triển khai" />   
        									
        								</form:select>
									</div> 
									
									<div class="input-group mb-3">
										<div class="input-group-prepend w-25">
											<label class="input-group-text w-100" for="khach_hang">Khách hàng</label>
										</div>
										<form:select path="customer" id="khach_hang" class="custom-select">  
        									<form:option value="4" label="MOBIFONE"/> 
        								</form:select>
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
													<form:option value="${status.id }" label="${status.name }"/>
												</c:if>
											</c:forEach>
        								</form:select>
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							<!-- /.card -->
	
							<!-- ===== Card: Thông tin dự kiến của dự án ===== -->
							
							
							<div class="card bg-gradient-primary collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-clipboard-list mr-2"></i> Thanh toán DAC, PAC, FAC
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
									<div class="card bg-gradient-light collapsed-card">
										<!--test card  -->
										<div class="card-header border-0">
											<h3 class="card-title">
												<i class="fas fa-clipboard mr-2"></i> Thanh toán DAC
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
													<label class="input-group-text">Số tiền</label>
												</div>
												<form:input path="so_tien_DAC" type="number" class="form-control" placeholder="so_tien_DAC" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text">Kế hoạch</label>
												</div> 
												<form:input path="ke_hoach_thanh_toan_DAC" type="date" class="form-control" placeholder="ke_hoach_thanh_toan_DAC" />
											</div>
										</div>
										<!-- /.card-body-->
									</div>
									
									<div class="card bg-gradient-light collapsed-card">
										<!--test card  -->
										<div class="card-header border-0">
											<h3 class="card-title">
												<i class="fas fa-clipboard mr-2"></i> Thanh toán PAC
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
													<label class="input-group-text">Số tiền</label>
												</div>
												<form:input path="so_tien_PAC" type="number" class="form-control" placeholder="so_tien_PAC" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text">Kế hoạch</label>
												</div> 
												<form:input path="ke_hoach_thanh_toan_PAC" type="date" class="form-control" placeholder="ke_hoach_thanh_toan_PAC" />
											</div>
										</div>
										<!-- /.card-body-->
									</div>
									
									<div class="card bg-gradient-light collapsed-card">
										<!--test card  -->
										<div class="card-header border-0">
											<h3 class="card-title">
												<i class="fas fa-clipboard mr-2"></i> Thanh toán FAC
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
													<label class="input-group-text">Số tiền</label>
												</div>
												<form:input path="so_tien_FAC" type="number" class="form-control" placeholder="so_tien_FAC" />
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text">Kế hoạch</label>
												</div> 
												<form:input path="ke_hoach_thanh_toan_FAC" type="date" class="form-control" placeholder="ke_hoach_thanh_toan_FAC" />
											</div>
										</div>
										<!-- /.card-body-->
									</div>
								</div>
								<!-- /.card-body-->
							</div>
							
							<div class="card bg-gradient-info collapsed-card">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-comments-dollar mr-2"></i> Ghi chú
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
											<label class="input-group-text">Ghi chú</label>
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