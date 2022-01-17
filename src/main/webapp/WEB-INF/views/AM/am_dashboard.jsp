<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard | AM</title>
</head>
<body>
<link rel="stylesheet" href="<c:url value="/assets/user/vendor/dist/assets/owl.theme.default.min.css" />">
<link rel="stylesheet" href="<c:url value="/assets/user/vendor/dist/assets/owl.carousel.min.css" />">
<script src="<c:url value="/assets/user/vendor/dist/owl.carousel.min.js" />"></script>
<script src="<c:url value="/assets/user/vendor/dist/jquery.mousewheel.min.js" />"></script> <!-- Thư viện sử dụng con lăn chuột -->
<style>
	.content-wrapper {
	    background-color: #fff; 
	}
</style>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header ml-2">
			<a href="<c:url value='/AM/create_project/${week}_${year}' />" class="btn btn-info" role="button">Thêm dự án</a>
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<!-- Main row -->
				<div class="row">
					<!-- right col (We are only adding the ID to make the widgets sortable)-->

					<div class="col-lg-12 col-sm-12">
						<div>
							
						</div>
						<!-- Map card -->
						<div class="card" style="background: white">
							<div class="card-header border-0 d-flex flex-row">
								<div class="title-card">
									<h3 class="card-title d-flex">
										<i class="fas fa-clipboard-list" style="padding-right: 8px;"></i>
										<b id="name_sheet_1"> Báo cáo ${display_name } phụ trách</b><br>
										<br>
									</h3>
								</div>
							</div>
							
							<c:url value="0" var="week_link"/>
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="example_1" class="table " style="width: 100%;">
									<thead>
										<tr>
											<th>Dự án</th>
											<th style="width: 15%;">Type</th>
											<th style="width: 8%;">Priority</th> 
											<th>Nhóm</th>
											<th style="width: 15%;">PIC</th>
											<th style="width: 12%;"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table_pic}" var="project_item" varStatus="project_index">
												<tr>
													<td>
														<a href="<c:url value='/AM/detail/${week}_${year}_${project_item.id_pk}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.name }
															<c:if test="${project_item.status == 'High' }">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status == 'Medium' }">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
															<c:if test="${project_item.status == 'Low' }">
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</c:if>
														</a>
													</td>
													<td>${project_item.type}</td>
													<td align="center">
														<c:if test="${project_item.status =='High' }">
															<button type="button" class="btn btn-danger w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<button type="button" class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<button type="button" class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></button>
														</c:if>
													</td>
													<td>${project_item.customer }</td>
													<td>${project_item.pm }</td>
													<td style="border-left: 1px solid black;">
														<c:if test="${project_item.type != 'Triển khai' }">
															<%-- Nếu chưa từng được chuyển sang giai đoạn triển khai -> Cấp đầy đủ chức năng --%>
															<c:if test="${project_item.note < 1 }">
																<a href="<c:url value='/AM/delete_project/${project_item.week}_${project_item.year}_${project_item.id_pk}' />" 
																	class="float-right tooltip_icon">
																	<i class="fas fa-trash-alt fa-2x text-danger"></i>
																	<span class="tooltip_for_icon bg-danger text-center" 
																		style="margin-left: -7.2%; margin-top: -2.8%;">Xoá dự án</span>
																</a>
																<a href="<c:url value='/AM/update_project/${project_item.week}_${project_item.year}_${project_item.id_pk}' />" 
																	class="float-right tooltip_icon mr-3">
																	<i class="fas fa-edit fa-2x text-warning"></i>
																	<span class="tooltip_for_icon bg-warning text-center" 
																		style="margin-left: -5.6%; margin-top: -2.8%;">Cập nhật</span>
																</a>
																<a href="<c:url value='/AM/deployment/${project_item.week}_${project_item.year}_${project_item.id_pk}' />" class="float-right tooltip_icon mr-3">
																	<i class="fas fa-thumbs-up fa-2x text-success"></i>
																	<span class="tooltip_for_icon bg-success text-center" 
																		style="margin-left: -5.4%; margin-top: -2.8%;">Triển khai</span>
																</a>
															</c:if>
															
															<%-- Nếu đã từng được chuyển sang giai đoạn triển khai -> Ko thể chuyển giai đoạn, ko thể xoá --%>
															<c:if test="${project_item.note >= 1 }">
																<a href="<c:url value='/AM/update_project/${project_item.week}_${project_item.year}_${project_item.id_pk}' />" 
																	class="float-right tooltip_icon" style="margin-right: 41px;">
																	<i class="fas fa-edit fa-2x text-warning"></i>
																	<span class="tooltip_for_icon bg-warning text-center" 
																		style="margin-left: -5.6%; margin-top: -2.8%;">Cập nhật</span>
																</a>
															</c:if>
														</c:if>
													</td>
												</tr>
											
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
		var groupColumn = 3;
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