<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard | User</title>
</head>
<body>

<style>
.content-wrapper {
    background-color: #fff; 
}
</style>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		
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
							<div class="table-responsive card-body" style="padding: 5px;">
								<table id="example_1" class="table " style="width: 100%;">
									<thead>
										<tr>
											<th>Dự án</th>
											<th>Type</th>
											<th>Priority</th> 
											<th>Nhóm</th>
											<th>PIC</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table_pic }" var="project_item" varStatus="project_index">
											
												<tr>
													<td>
														<c:if test="${project_item.status =='High' }">
															<a href="<c:url value='/user/detail/${week }/${project_item.id_pk }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Medium' }">
															<a href="<c:url value='/user/detail/${week }/${project_item.id_pk }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
														<c:if test="${project_item.status =='Low' }">
															<a href="<c:url value='/user/detail/${week }/${project_item.id_pk }' />" class="tooltip_css" style="font-weight: bold" data-html="true">
																${project_item.name }
																<span class="tooltiptext" style="background-color: #262626">${project_item.tinh_trang_va_ke_hoach_chi_tiet }</span>
															</a>
														</c:if>
													</td>
													<td>${project_item.type }</td>
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
													<td>${project_item.pm }</td>
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
		
		$('div.dataTables_wrapper').addClass("change_font_size");
	});



</script>
</body>
</html>