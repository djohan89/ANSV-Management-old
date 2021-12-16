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
						<div class="card" style="background: white">
							<div class="card-header border-0 d-flex flex-row">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo triển khai tuần ${week } </b><br>
										<br>
									</h3>
								</div>
								<div class=" ml-auto card-tools">
									<div class="container">
										<!-- Trigger the modal with a button -->
										<c:if test="${not empty project }">
										<button type="button" class="btn btn-danger btn-sm"
											data-toggle="modal" data-target="#myModal">
											<!-- <i class="fas fa-exclamation-triangle"></i> -->
											<i class="fas fa-exclamation-triangle"></i>
										</button>
										</c:if>

										<c:if test="${not empty project }">
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
														<div class="owl-carousel owl-theme" id="detail_slide">
														<!-- ===== Phần chèn thêm HTML ===== -->
														
															<c:forEach items="${project }" var="project_item" varStatus="project_index">
																<c:if test="${project_item.type == 'Triển khai' && project_item.status =='High' && project_item.pic_role=='ROLE_PM' }">
																	<div class="container item">
																		<div>
																			<h5 class="pb-2 pt-1 pl-3" style="background: red;border-radius: 16px; ">
																				<a href="javascript:void(0)" style="color: #fff">${project_item.name }</a>
																			</h5>
																			<p><b>Người phụ trách:</b></b> ${project_item.pic_name }</p>
																			<div class="row">
																				<div class="col-6">
																					<p style="white-space: pre-wrap;"><b>Phạm vi cung cấp:</b> ${project_item.pham_vi_cung_cap }</p>
																				</div>
																				<div class="col-6">
																					<p><b>Tổng giá trị:</b> ${project_item.tong_gia_tri_thuc_te }</p>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-6"><p><b>Mức độ ưu tiên:</b> ${project_item.priority }</p></div>
																				<div class="col-6"><p><b>Mức độ tình trạng:</b>  ${project_item.status }</p></div>
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
														            				<td>${project_item.DAC }</td>
														                			<td>${project_item.PAC }</td>
														                			<td>${project_item.FAC }</td>
														                			<!--Kế hoạch nghiệm thu -->
														                			<td>
														                				<c:if test="${project_item.so_tien_tam_ung  !=0} ">
																							<fmt:formatNumber type="number"
																								value="${project_item.so_tien_tam_ung  }" />
																						</c:if>
														                			</td>
														                			<td>${project_item.ke_hoach_tam_ung }</td>
																					<!-- Thanh toán tạm ứng --> +
														            				<td>
														            					<c:if test="${project_item.so_tien_DAC  !=0} ">
																							<fmt:formatNumber type="number"
																								value="${project_item.so_tien_DAC }" />
																						</c:if>
														            				</td>
														                			<td>${project_item.ke_hoach_thanh_toan_DAC }</td>
																					<!-- Thanh toán DAC --> 
														            				<td>
														            					<c:if test="${project_item.so_tien_PAC  !=0} ">
																							<fmt:formatNumber type="number"
																								value="${project_item.so_tien_PAC }" />
																						</c:if>
														            				</td>
														                			<td>${project_item.ke_hoach_thanh_toan_PAC }</td>
																					<!-- Thanh toán PAC --> 
														            				<td>
														            					<c:if test="${project_item.so_tien_FAC  !=0} ">
																							<fmt:formatNumber type="number"
																								value="${project_item.so_tien_FAC }" />
																						</c:if>
														            				</td>
														                			<td>${project_item.ke_hoach_thanh_toan_FAC }</td>
																					<!-- Thanh toán FAC --> 
														            			</tbody>
														            		</table>
														            	</div>
														            	<div class="d-flex">
														            		<div >
														            			<p><b>Tình trạng:</b> </p>
														            			<p style="white-space: pre-wrap;"> ${project_item.tinh_trang_va_ke_hoach_chi_tiet }</p>
														                	</div>
														                	<div class="pl-5">
														                		<p><b>Kết quả thực hiện kế hoạch:</b> </p>
														                		<p style="white-space: pre-wrap;"> ${project_item.ket_qua_thuc_hien_ke_hoach }</p>
														                	</div>
														                </div>
																	</div>
																</c:if>
															</c:forEach>
														
														</div>
													</div>
												</div>
											</div>
										</div>
										</c:if>	
									</div>
								</div>
							</div>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="example_1" class="table " style="width: 100%;">
									<thead>
										<tr>
											<th>Dự án</th>
											<th>Priority</th>
											<th>Nhóm</th>
											<th style="width: 22%;">pic_name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Triển khai' && project_item.pic_role =='ROLE_PM' }">
												<tr>
													<td>
														<c:if test="${project_item.status =='High' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
													</td>
													<td>
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pic_name }</td>
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
						<div class="card" style="background: white">
							<div class="card-header border-0 d-flex flex-row">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo viễn thông tuần ${week } </b><br>
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
											<th>Priority</th>
											<th>Nhóm</th>
											<th style="width: 22%;">pic_name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Viễn thông' }">
												<tr>
													<td>
														<c:if test="${project_item.status =='High' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
													</td>
													<td>
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pic_name }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>



							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					
					<!-- /.card -->

					<!-- right col -->
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<!-- Calendar -->
						<div class="card" style="background: white">
							<div class="card-header border-0 d-flex flex-row">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo chuyển đổi số ${week} </b><br>
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
											<th>Priority</th>
											<th>Nhóm</th>
											<th style="width: 22%;">pic_name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Chuyển đổi số' }">
												<tr>
													<td>
														<c:if test="${project_item.status =='High' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<a href="<c:url value='/chief/detail/${project_item.id }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
													</td>
													<td>
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pic_name }</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</div>
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
	            example_1.order([groupColumn, 'desc']).draw();
	        } else {
	            example_1.order([groupColumn, 'asc']).draw();
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
	            example_1.order([groupColumn, 'desc']).draw();
	        } else {
	            example_1.order([groupColumn, 'asc']).draw();
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