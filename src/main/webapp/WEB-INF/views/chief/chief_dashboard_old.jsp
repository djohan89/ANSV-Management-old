<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard | Chief</title>
</head>
<body>
<link rel="stylesheet"
	href="<c:url value="/assets/user/vendor/dist/assets/owl.theme.default.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/user/vendor/dist/assets/owl.carousel.min.css" />">
<script src="<c:url value="/assets/user/vendor/dist/owl.carousel.min.js" />"></script>
<script src="<c:url value="/assets/user/vendor/dist/jquery.mousewheel.min.js" />"></script> <!-- Thư viện sử dụng con lăn chuột -->
<style>
.content-wrapper {
    background-color: #fff; 
}
</style>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">

			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<section class="col-lg-4">
						<!-- Sheet 1 card -->

					</section>

					<!-- === Content: Cột 2 (sheet 2) === -->


					<!-- === Content: Cột 3 (sheet 3) === -->

				</div>
				<!-- /.row (main row) -->
			</div>
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<!-- Main row -->
				<div class="row">
					<!-- right col (We are only adding the ID to make the widgets sortable)-->

					<div class="col-lg-6 col-sm-6">
						<!-- Map card -->
						<div class="card border border-primary shadow">
							<div class="card-header border-0 d-flex flex-row" style="background-color: #04355d; color: white;">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo triển khai tuần ${week} năm ${year}</b><br>
										<br>
									</h3>
								</div>
								<div class=" ml-auto card-tools">
									<div class="container">
										<!-- Trigger the modal with a button -->
										<c:if test="${not empty project_slideshow }">
										<button type="button" class="btn btn-danger btn-sm"
											data-toggle="modal" data-target="#myModal">
											<!-- <i class="fas fa-exclamation-triangle"></i> -->
											<i class="fas fa-play"></i>
										</button>
										</c:if>

										<c:if test="${not empty project_slideshow }">
										<!-- Modal -->
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content" style="color: black;">
													<div class="modal-header" style="border-bottom: none">
														<!-- <h5 class="modal-title" id="modal_title">Các dự án chậm tiến độ</h5> -->
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body"
														style="font-size: 15px; color: black">
														<!-- Slide cho màn hình lớn -->
														<div class="owl-carousel owl-theme" id="detail_slide">
														<!-- ===== Phần chèn thêm HTML ===== -->
														
															<c:forEach items="${project_slideshow }" var="project_item" varStatus="project_index">
																
																	<div class="container item">
																		<div>
																			<h5 class="pb-2 pt-1 pl-3" style="background: red; border-radius: 16px; text-align: center;">
																				<a href="javascript:void(0)" style="color: #fff">${project_item.name }</a>
																			</h5>
																			<div class="row">
																				<div class="col-8">
																					<p><b>Người phụ trách (PM):</b></b> ${project_item.pm }</p>
																				</div>
																				<div class="col-4">
																					<p><b>Người đầu mối (AM):</b></b> ${project_item.am }</p>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-8"><p><b>Mức độ ưu tiên:</b> ${project_item.priority }</p></div>
																				<div class="col-4"><p><b>Mức độ tình trạng:</b>  ${project_item.status }</p></div>
																			</div>
																			<div class="row">
																				<div class="col-8">
																					<p><b>Phạm vi cung cấp:</b> ${project_item.pham_vi_cung_cap }</p>
																				</div>
																				<div class="col-4">
																					<p><b>Tổng giá trị:</b> 
																						<c:if
																							test="${ project_item.tong_gia_tri_thuc_te !=0}">
																							<fmt:formatNumber type="number"
																								value="${project_item.tong_gia_tri_thuc_te }" />
																						</c:if>
																					</p>
																				</div>
																			</div>
																			
																		</div>
																		<div class="table-responsive">
														            		<table class="table table-bordered table-hover">
														            			<thead>
														            				<tr>
														            					<th colspan="3">Kế hoạch nghiệm thu</th>
														            					<th colspan="2">Thanh toán tạm ứng</th>
														            					<th colspan="2">Thanh toán DAC</th>
														            					<th colspan="2">Thanh toán PAC</th>
														            					<th colspan="2">Thanh toán FAC</th>
														            				</tr>
														            				<tr>
																			            <th>DAC</th>
																			            <th>PAC</th>
																			            <th>FAC</th>
																			            <th>Số tiền</th>
																			            <th>Kế hoạch</th>
																			            <th>Số tiền</th>
																			            <th>Kế hoạch</th>
																			            <th>Số tiền</th>
																			            <th>Kế hoạch</th>
																			            <th>Số tiền</th>
																			            <th>Kế hoạch</th>
																	            	</tr>
																	            </thead>
														            			<tbody>
														            				<tr>
															            				<td>
															            					<fmt:formatDate value="${project_item.DAC}" pattern="dd/MM/yyyy" />
															            				</td>
															                			<td>
															                				<fmt:formatDate value="${project_item.PAC}" pattern="dd/MM/yyyy" />
															                			</td>
															                			<td>
															                				<fmt:formatDate value="${project_item.FAC}" pattern="dd/MM/yyyy" />
															                			</td>
															                			<!--Kế hoạch nghiệm thu -->
															                			<td>
															                				<c:if test="${project_item.so_tien_tam_ung  !=0}">
																								<fmt:formatNumber type="number"
																									value="${project_item.so_tien_tam_ung  }" />
																							</c:if>
															                			</td>
															                			<td>
															                				<fmt:formatDate value="${project_item.ke_hoach_tam_ung}" pattern="dd/MM/yyyy" />
															                			</td>
																						<!-- Thanh toán tạm ứng --> 
															            				<td>
															            					<c:if test="${project_item.so_tien_DAC  !=0}">
																								<fmt:formatNumber type="number"
																									value="${project_item.so_tien_DAC }" />
																							</c:if>
															            				</td>
															                			<td>
															                				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_DAC}" pattern="dd/MM/yyyy" />
															                			</td>
																						<!-- Thanh toán DAC --> 
															            				<td>
															            					<c:if test="${project_item.so_tien_PAC  !=0}">
																								<fmt:formatNumber type="number"
																									value="${project_item.so_tien_PAC }" />
																							</c:if>
															            				</td>
															                			<td>
															                				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_PAC}" pattern="dd/MM/yyyy" />
															                			</td>
																						<!-- Thanh toán PAC --> 
															            				<td>
															            					<c:if test="${project_item.so_tien_FAC  !=0}">
																								<fmt:formatNumber type="number"
																									value="${project_item.so_tien_FAC }" />
																							</c:if>
															            				</td>
															                			<td>
															                				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_FAC}" pattern="dd/MM/yyyy" />
															                			</td>
																						<!-- Thanh toán FAC --> 
																					</tr>
														            			</tbody>
														            		</table>
														            	</div>
														            	<div class="row">
														            		<div class="col-6">
														            			<p><b>Tình trạng:</b> </p>
														            			<p class="text-justify" style="white-space: pre-wrap;"> ${project_item.tinh_trang_va_ke_hoach_chi_tiet }</p>
														                	</div>
														                	<div class="col-6">
														                		<p><b>Kết quả thực hiện kế hoạch:</b> </p>
														                		<p class="text-justify" style="white-space: pre-wrap;"> ${project_item.ket_qua_thuc_hien_ke_hoach }</p>
														                	</div>
														                </div>
														                <div>
														                	<figcaption class="text-center">${project_index.index +1 } / ${project_slideshow.size() } </figcaption>
														                </div>
																	</div> <!-- item carousel -->
															</c:forEach>
														</div>
														<!-- Slide cho màn hình nhỏ -->
														<div class="owl-carousel owl-theme" id="detail_slide_1">
														<!-- ===== Phần chèn thêm HTML ===== -->
														
															<c:forEach items="${project_slideshow }" var="project_item" varStatus="project_index">
																
																	<div class="container item">
																		<div>
																			<h5 class="pb-2 pt-1 pl-3" style="background: red;border-radius: 16px; ">
																				<a href="javascript:void(0)" style="color: #fff">${project_item.name }</a>
																			</h5>
																			<div class="row">
																				<div class="col-6">
																					<p><b>Người phụ trách (PM):</b></b> ${project_item.pm }</p>
																				</div>
																				<div class="col-6">
																					<p><b>Người đầu mối (AM):</b></b> ${project_item.am }</p>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-6"><p><b>Mức độ ưu tiên:</b> ${project_item.priority }</p></div>
																				<div class="col-6"><p><b>Mức độ tình trạng:</b>  ${project_item.status }</p></div>
																			</div>
																			<div class="row">
																				<div class="col-6">
																					<p ><b>Phạm vi cung cấp:</b> ${project_item.pham_vi_cung_cap }</p>
																				</div>
																				<div class="col-6">
																					<p><b>Tổng giá trị:</b> 
																						<c:if
																							test="${ project_item.tong_gia_tri_thuc_te !=0}">
																							<fmt:formatNumber type="number"
																								value="${project_item.tong_gia_tri_thuc_te }" />
																						</c:if>
																					</p>
																				</div>
																			</div>
																			
																		</div>
																		<div class="row">
																			<div class="col-4"><b>Kế hoạch DAC: </b></div>
																			<div class="col-4"><b>Kế hoạch PAC: </b></div>
																			<div class="col-4"><b>Kế hoạch FAC: </b></div>
																			<div class="col-4"><fmt:formatDate value="${project_item.DAC}" pattern="dd/MM/yyyy" /></div>
																			<div class="col-4"><fmt:formatDate value="${project_item.PAC}" pattern="dd/MM/yyyy" /></div>
																			<div class="col-4"><fmt:formatDate value="${project_item.FAC}" pattern="dd/MM/yyyy" /></div>
																		</div>
																		<div class="row">
																			<div class="col-6"><b>Số tiền thanh toán tạm ứng: </b>
																				<c:if test="${project_item.so_tien_tam_ung  !=0}">
																					<fmt:formatNumber type="number"
																						value="${project_item.so_tien_tam_ung  }" />
																				</c:if>
																			</div>
																			<div class="col-6"><b>Kế hoạch thanh toán tạm ứng:</b><fmt:formatDate value="${project_item.ke_hoach_tam_ung}" pattern="dd/MM/yyyy" /> </div>
																		</div>
																		<div class="row">
																			<div class="col-6"><b>Số tiền DAC: </b>
																				<c:if test="${project_item.so_tien_DAC  !=0}">
																					<fmt:formatNumber type="number"
																						value="${project_item.so_tien_DAC }" />
																				</c:if>
																			</div>
																			<div class="col-6"><b>Kế hoạch DAC: </b>
																				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_DAC}" pattern="dd/MM/yyyy" />
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-6"><b>Số tiền PAC: </b>
																				<c:if test="${project_item.so_tien_PAC  !=0}">
																					<fmt:formatNumber type="number"
																						value="${project_item.so_tien_PAC }" />
																				</c:if>
																			</div>
																			<div class="col-6"><b>Kế hoạch PAC: </b>
																				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_PAC}" pattern="dd/MM/yyyy" />
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-6"><b>Số tiền FAC: </b>
																				<c:if test="${project_item.so_tien_FAC  !=0}">
																					<fmt:formatNumber type="number"
																						value="${project_item.so_tien_FAC }" />
																				</c:if>
																			</div>
																			<div class="col-6"><b>Kế hoạch FAC: </b>
																				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_FAC}" pattern="dd/MM/yyyy" />
																			</div>
																		</div>
														            	<div class="row">
														            		<div class="col-6">
														            			<p><b>Tình trạng:</b> </p>
														            			<p class="text-justify" style="white-space: pre-wrap;">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</p>
														                	</div>
														                	<div class="col-6">
														                		<p><b>Kết quả thực hiện kế hoạch:</b> </p>
														                		<p class="text-justify" style="white-space: pre-wrap;">${project_item.ket_qua_thuc_hien_ke_hoach }</p>
														                	</div>
														                </div>
														                <div>
														                	<figcaption class="text-center">${project_index.index +1 } / ${project_slideshow.size() } </figcaption>
														                </div>
																	</div> <!-- item carousel -->
															</c:forEach>
														</div>
													</div><!-- End body modal -->
												</div><!--End modal content  -->
											</div>
										</div><!--End modal  -->
										</c:if>	
									</div>
								</div>
							</div>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="example_1" class="table " style="width: 100%;">
									<thead>
										<tr>
											<th>Dự án</th>
											<th style="width: 14%;">Priority</th>
											<th>Nhóm</th>
											<th style="width: 22%;">pic_name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Triển khai' && project_item.pic_role =='ROLE_PM' }">
												<tr>
													<td>
														
														<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
															<c:if test="${project_item.status =='High' }">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Medium' }">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Low' }">
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Complete' }">
																<span class="tooltiptext" style="background-color: #007bff">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
														</a>
													</td>
													<td>
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Complete' }">
															<button type="button" class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pic }</td>
												</tr>
											</c:if>
										</c:forEach>	
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<div class="col-sm-6 col-lg-6">
						<!-- solid sales graph -->
						<div class="card border border-primary shadow">
							<div class="card-header border-0 d-flex flex-row" style="background-color: #04355d; color: white;">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo viễn thông tuần ${week} năm ${year}</b><br>
										<br>
									</h3>
								</div>
								<div class="card-tools">
									<div class="container">
										<!-- Trigger the modal with a button -->

									</div>
								</div>
							</div>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="example_2" class="table " style="width: 100%;">
									<thead>
										<tr>
											<th>Dự án</th>
											<th style="width: 14%;">Priority</th>
											<th>Nhóm</th>
											<th style="width: 22%;">pic_name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Viễn thông' }">
												<tr>
													<td>
														<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
															<c:if test="${project_item.status =='High' }">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Medium' }">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Low' }">
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Complete' }">
																<span class="tooltiptext" style="background-color: #007bff">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
														</a>
													</td>
													<td>
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Complete' }">
															<button type="button" class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pic }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.card-footer -->
						</div>
						
						<div class="card border border-primary shadow mt-4">
							<div class="card-header border-0 d-flex flex-row" style="background-color: #04355d; color: white;">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo chuyển đổi số ${week} năm ${year}</b><br>
										<br>
									</h3>
								</div> 
								<div class="card-tools">
									<div class="container">
										<!-- Trigger the modal with a button -->

									</div>
								</div>
							</div>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="example_3" class="table " style="width: 100%;">
									<thead>
										<tr>
											<th>Dự án</th>
											<th style="width: 14%;">Priority</th>
											<th>Nhóm</th>
											<th style="width: 22%;">pic_name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Chuyển đổi số' }">
												<tr>
													<td>
														<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
															<c:if test="${project_item.status =='High' }">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Medium' }">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Low' }">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status =='Complete' }">
																<span class="tooltiptext" style="background-color: #007bff">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															
														</a>
													</td>
													<td>
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Complete'}">
															<button type="button" class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if> 
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pic }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
						<!-- /.card -->
					</div>
					
					<!-- /.card -->

					<!-- right col -->
				</div>
				<!-- /.row (main row) -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
<script type="text/javascript">	
	$(document).ready(function(){
		var groupColumn = 2;
		/*Option table 1  */
		$('#example_1').DataTable( {
		    "scrollY": 300,
		    "scrollX": true,
		    "scrollCollapse": true,
		    "paging":         false,
		    "responsive": true,
		    "displayLength": 25,
		    "columnDefs": [
	            { "visible": false, "targets": groupColumn },
	            ],
		    "order": [
	            [groupColumn, 'asc']
	        ],
		    "drawCallback": function(settings) {
	            var api = this.api();
	            var rows = api.rows({ page: 'current' }).nodes();
	            var last = null;

	            api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
	                if (last !== group) {
	                    $(rows).eq(i).before(
	                        '<tr class="group">' + 
	                        	'<td colspan="18" align="center" style="background-color: #D3D3D3;">' + 
	                        		'<b>----- ' + group + ' -----</b>' + 
	                        	'</td>' + 
	                        '</tr>'
	                    );

	                    last = group;
	                }
	            });
	        },

		} );
		$('#example_1 tbody').on('click', 'tr.group', function() {
	        var currentOrder = example_1.order()[0];
	        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
	            example_1.order([groupColumn, 'desc']).draw();
	        } else {
	            example_1.order([groupColumn, 'asc']).draw();
	        }
	    });
		
		/* Option table 2 */
		
		$('#example_2').DataTable( {
		    "scrollY": 300,
		    "scrollX": true,
		    "scrollCollapse": true,
		    "paging":         false,
		    "responsive": true,
		    "displayLength": 25,
		    "columnDefs": [
	            { "visible": false, "targets": groupColumn },
	            ],
		    "order": [
	            [groupColumn, 'asc']
	        ],
		    "drawCallback": function(settings) {
	            var api = this.api();
	            var rows = api.rows({ page: 'current' }).nodes();
	            var last = null;

	            api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
	                if (last !== group) {
	                    $(rows).eq(i).before(
	                        '<tr class="group">' + 
	                        	'<td colspan="18" align="center" style="background-color: #D3D3D3;">' + 
	                        		'<b>----- ' + group + ' -----</b>' + 
	                        	'</td>' + 
	                        '</tr>'
	                    );

	                    last = group;
	                }
	            });
	        },

		} );
		$('#example_2 tbody').on('click', 'tr.group', function() {
	        var currentOrder = example_1.order()[0];
	        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
	            example_2.order([groupColumn, 'desc']).draw();
	        } else {
	            example_2.order([groupColumn, 'asc']).draw();
	        }
	    });
		
		/*Option table 3  */
		$('#example_3').DataTable( {
		    "scrollY": 300,
		    "scrollX": true,
		    "scrollCollapse": true,
		    "paging":         false,
		    "responsive": true,
		    "displayLength": 25,
		    "columnDefs": [
	            { "visible": false, "targets": groupColumn },
	            ],
		    "order": [
	            [groupColumn, 'asc']
	        ],
		    "drawCallback": function(settings) {
	            var api = this.api();
	            var rows = api.rows({ page: 'current' }).nodes();
	            var last = null;

	            api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
	                if (last !== group) {
	                    $(rows).eq(i).before(
	                        '<tr class="group">' + 
	                        	'<td colspan="18" align="center" style="background-color: #D3D3D3;">' + 
	                        		'<b>----- ' + group + ' -----</b>' + 
	                        	'</td>' + 
	                        '</tr>'
	                    );

	                    last = group;
	                }
	            });
	        },

		} );
		$('#example_3 tbody').on('click', 'tr.group', function() {
	        var currentOrder = example_1.order()[0];
	        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
	            example_3.order([groupColumn, 'desc']).draw();
	        } else {
	            example_3.order([groupColumn, 'asc']).draw();
	        }
	    });
		
		var owl = $('.owl-carousel');
	  	owl.owlCarousel({
	       items: 1,
	       loop: true,
	       nav: true,
	       margin: 10,
	       autoplay: true,
	       autoplayTimeout: 5000,
	       responsiveClass: true,
	       autoplayHoverPause: true
	   	});
	    
	  	owl.on('mousewheel', '.owl-stage', function (e) {
	        if (e.deltaY>0) {
	            owl.trigger('next.owl');
	        } else {
	            owl.trigger('prev.owl');
	        }
	        e.preventDefault();
	    });
		
	  	$('#myModal').modal('show');
		$('div.dataTables_wrapper').addClass("change_font_size");
	});
</script>
</body>
</html>