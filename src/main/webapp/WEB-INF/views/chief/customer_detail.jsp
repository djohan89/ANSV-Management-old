<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="utf-8">
<title>CEO | Customer</title>
</head>
<body>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<style>
.item {
	width: 100%;
}

a:hover {
	color: #000;
}

.nav-tabs {
	border-bottom: 0px;
}

.dropdown-item:active, .nav-tabs .nav-link.active {
	background-color: #007bff !important;
	color: #fff !important;
}
.content-wrapper{
	background-color: #fff;
}
</style>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-10">
						<div class="btn-group btn-group1">
							<button type="button" class="btn btn-secondary dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span id="show">Chọn dự án</span>
							</button>
							<div class="dropdown-menu dropdown-menu-right dropdown1">
								<ul class="nav nav-tabs">
									<c:forEach var="item" items="${customer }" varStatus="index">
										<li class="nav-item item"><c:if test="${index.first }">
												<a class="dropdown-item nav-link active"
													href="#du_an_${index.count}" type="button"> ${item.name }
												</a>
											</c:if> <c:if test="${not index.first }">
												<a class="dropdown-item nav-link"
													href="#du_an_${index.count}" type="button"> ${item.name }
												</a>
											</c:if></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-sm-2">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a
								href="<c:url value='/chief/home/${week}_${year}' />">Home</a></li>
							<li class="breadcrumb-item active">Customer's Project</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<section class="content">
			<div class="container-fluid">
				<div>
					<h2 style="text-align: center;">${customer[0].customer}</h2>
					<!-- Tab panes -->
					<div class="tab-content mt-5 mb-3">
						<c:forEach var="item" items="${customer}" varStatus="index">
							<c:if test="${ item.type=='Triển khai' && item.pic_role=='ROLE_PM'}">
								<c:if test="${index.first }">
									<div id="du_an_${index.count }" class="tab-pane active">
										<br>
								</c:if>
								<c:if test="${not index.first }">
									<div id="du_an_${index.count }" class="tab-pane fade">
										<br>
								</c:if>
									<div class="row pt-2">
										<div class="col-md-6">
											<div class="table-responsive-sm">
												<table class="table table-hover table-bordered">
													<tr>
														<td><span class="font-weight-bold">Tên dự án:</span></td>
														<td>${item.name}</td>
													</tr>
													<tr>
														<td width="35%">
															<span class="font-weight-bold">Status:</span>
															<span class="pl-2">${item.status}</span>
														</td>
														<td>
															<span class="font-weight-bold">PIC:</span>
															<span class="pl-2">${item.pic_name}</span>
														</td>
													</tr>
													<tr>
														<td>
															<span class="font-weight-bold">Priority:</span>
															<span class="pl-2">${item.priority}</span>
														</td>
														<td>
															<span class="font-weight-bold">Khách hàng:</span>
															<span class="pl-2">${item.customer}</span>
														</td>
													</tr>
												</table>
												
												<table class="table table-hover table-bordered">
													<tr>
														<th class="w-25">Tiến độ chung</th>
														<td>${item.pham_vi_cung_cap}</td>
													</tr>
													<tr>
														<th>Khó khăn</th>
														<td>${item.general_issue}</td>
													</tr>
													<tr>
														<th>Giải pháp</th>
														<td>${item.solution}</td>
													</tr>
													<tr>
														<th>Kế hoạch</th>
														<td>${item.ke_hoach}</td>
													</tr>
													<tr>
														<th>Kết quả</th>
														<td>${item.ket_qua_thuc_hien_ke_hoach}</td>
													</tr>
												</table>
											</div>
										</div>
										<div class="col-md-6">
											<div class="table-responsive-sm">
												<table class="table table-hover table-bordered">
													<tr>
														<th style="width: 14%;" class="text-center">Kế hoạch</th>
														<th class="text-center">Số tiền<br />(VNĐ)</th>
														<th class="text-center" style="width: 17%;">Hợp đồng<br/>(D / M / Y)</th>
														<th class="text-center" style="width: 17%;">Mục tiêu<br/>(D / M / Y)</th>
														<th class="text-center" style="width: 17%;">Thực tế<br/>(D / M / Y)</th>
														<th class="text-center" style="width: 9%;">CL<br/>(Ngày)</th>
													</tr>
													<tr class="text-center">
														<th>DAC</th>
														<td class="text-right">
															<c:if test="${item.so_tien_DAC != 0}">
																<fmt:formatNumber type="number" value="${item.so_tien_DAC}" />
															</c:if>
														</td>
														<td><fmt:formatDate value="${item.DAC}" pattern="dd / MM / yyyy" /></td>
														<td><fmt:formatDate value="${item.ke_hoach_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
														<td><fmt:formatDate value="${item.thuc_te_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
														<td>${item.chenh_lech_DAC}</td>
													</tr>
													<tr class="text-center">
														<th>PAC</th>
														<td class="text-right">
															<c:if test="${item.so_tien_PAC != 0}">
																<fmt:formatNumber type="number" value="${item.so_tien_PAC}" />
															</c:if>
														</td>
														<td><fmt:formatDate value="${item.PAC}" pattern="dd / MM / yyyy" /></td>
														<td><fmt:formatDate value="${item.ke_hoach_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
														<td><fmt:formatDate value="${item.thuc_te_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
														<td>${item.chenh_lech_PAC}</td>
													</tr>
													<tr class="text-center">
														<th>FAC</th>
														<td class="text-right">
															<c:if test="${item.so_tien_FAC != 0}">
																<fmt:formatNumber type="number" value="${item.so_tien_FAC}" />
															</c:if>
														</td>
														<td><fmt:formatDate value="${item.FAC}" pattern="dd / MM / yyyy" /></td>
														<td><fmt:formatDate value="${item.ke_hoach_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
														<td><fmt:formatDate value="${item.thuc_te_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
														<td>${item.chenh_lech_FAC}</td>
													</tr>
													<tr class="text-center">
														<th>Tổng</th>
														<td class="text-right">
															<c:if test="${item.tong_gia_tri_thuc_te != 0}">
																<fmt:formatNumber type="number" value="${item.tong_gia_tri_thuc_te }" />
															</c:if>
														</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
													</tr>
													<tr class="text-center">
														<th>Tạm ứng</th>
														<td class="text-right">
															<c:if test="${item.so_tien_tam_ung != 0}">
																<fmt:formatNumber type="number" value="${item.so_tien_tam_ung }" />
															</c:if>
														</td>
														<td><fmt:formatDate value="${item.ke_hoach_tam_ung}" pattern="dd / MM / yyyy" /></td>
														<td>N/A</td>
														<td>N/A</td>
														<td>N/A</td>
													</tr>
												</table>
											</div>
											<div>
												<c:if test="${item.week == current_week || item.week == (current_week - 1)}">
													<a href="<c:url value='/chief/update_project_tk/${week_option}_${year_option}_${item.id}' />"
														style="position: absolute; left: 1%;" class="float-right btn btn-warning">
														<i class="fas fa-edit"></i>
													</a>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							
							<c:if test="${ item.type=='Viễn thông'}">
								<c:if test="${index.first }">
									<div id="du_an_${index.count }" class="tab-pane active">
										
								</c:if>
								<c:if test="${not index.first }">
									<div id="du_an_${index.count }" class="tab-pane fade">
										
								</c:if>
										<p><b>Người phụ trách:</b> ${item.pic_name }</p>
										<p><b>Tên dự án:</b> 
											<a style="color: #000" href="<c:url value='/chief/detail/${week}_${year}_${item.id}' />">${item.name}</a>
										</p>
										<p><b>Mô tả dự án:</b><span>${item.description }</span></p>
										<div class="row">
											<div class="col-md-4">
												<p><b>Tổng mức đầu tư:</b> ${item.tong_muc_dau_tu_du_kien }</p>
											</div>
											<div class="col-md-4">
												<p><b>Mức độ ưu tiên:</b> ${item.priority }</p>
											</div>
											<div class="col-md-4">
												<p><b>Mức độ khả thi:</b> ${item.muc_do_kha_thi }%</p>
											</div>
										</div>
										
										<p><b>Hình thức đầu tư:</b> ${item.hinh_thuc_dau_tu }</p>
										<div class="row">
											<div class="col-md-6">
											<p><b>Kế hoạch:</b><span class="text-justify">${item.ke_hoach}</span></p>
										</div>
											<div class="col-md-6">
												<p>
													<b>Khó khăn:</b>
													<span class="text-justify">${item.general_issue}</span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<p>
													<b>Giải pháp:</b>
													<span class="text-justify">${item.solution}</span>
												</p>
											</div>
											<div class="col-md-6">
												<p>
													<b>Phân tích SWOT:</b>
													<span>${item.phan_tich_SWOT }</span>
												</p>
											</div>
										</div>
										<p>
											<b>Kết quả thực hiện kế hoạch:</b> 
											<span class="text-justify">${item.ket_qua_thuc_hien_ke_hoach }</span>
										</p>
										<div class="row">
											<c:if test="${item.week == current_week || item.week == (current_week - 1)}">
												<a href="<c:url value='/chief/update_project/${week_option}_${year_option}_${item.id}' />"
													 class="float-right btn btn-warning">
													<i class="fas fa-edit"></i> 
												</a>
											</c:if>
										</div>
										
									</div>
									
								</c:if>
								
								<c:if test="${ item.type=='Chuyển đổi số'}">
									<c:if test="${index.first }">
										<div id="du_an_${index.count }" class="tab-pane active">
									</c:if>
									<c:if test="${not index.first }">
										<div id="du_an_${index.count }" class="tab-pane fade">
									</c:if>
										<p><b>Người phụ trách:</b> ${item.pic_name }</p>
										<p><b>Tên dự án:</b> 
											<a style="color: #000"href="<c:url value='/chief/detail/${week}_${year}_${item.id}' />">${item.name}</a>
										</p>
										<p><b>Mô tả dự án:</b><span>${item.description }</span></p>
										<div class="row">
											<div class="col-md-4">
												<p><b>Tổng mức đầu tư:</b> ${item.tong_muc_dau_tu_du_kien }</p>
											</div>
											<div class="col-md-4">
												<p><b>Mức độ ưu tiên:</b> ${item.priority }</p>
											</div>
											<div class="col-md-4">
												<p><b>Mức độ khả thi:</b> ${item.muc_do_kha_thi }%</p>
											</div>
										</div>
										
										<p><b>Hình thức đầu tư:</b> ${item.hinh_thuc_dau_tu }</p>
										<div class="row">
											<div class="col-md-6">
											<p><b>Kế hoạch:</b><span class="text-justify">${item.ke_hoach}</span></p>
										</div>
											<div class="col-md-6">
												<p><b>Khó khăn:</b><span class="text-justify">${item.general_issue}</span></p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<p><b>Giải pháp:</b><span class="text-justify">${item.solution}</span></p>
											</div>
											<div class="col-md-6">
												<p><b>Phân tích SWOT:</b><span>${item.phan_tich_SWOT }</span></p>
											</div>
										</div>
										<p>
											<b>Kết quả thực hiện kế hoạch:</b> 
											<span class="text-justify">${item.ket_qua_thuc_hien_ke_hoach }</span>
										</p>
										<div class="row">
											<c:if test="${item.week == current_week || item.week == (current_week - 1)}">
												<a href="<c:url value='/chief/update_project/${week_option}_${year_option}_${item.id}' />"
													 class="float-right btn btn-warning">
													<i class="fas fa-edit"></i> 
												</a>
											</c:if>
										</div>
									</div>	
								</c:if>
					
						</c:forEach>
					</div>
				</div>
			</div>
		
		</section>
	<!-- <p class="act "><b>Active Tab</b>: <span></span></p>
        <p class="prev "><b>Previous Tab</b>: <span></span></p> -->
	</div>

	<script>
		$(document).ready(function() {
			$('.dropdown1 button').click(function() {
				$('#show').text($(this).text());
			});
			$(".nav-tabs a ").click(function() {
				$(this).tab('show');
			});
			console.log(document.querySelector('a.active').textContent);
			// $('.nav-tabs a').on('shown.bs.tab', function(event) {
			//     var x = $(event.target).text(); // active tab
			//     var y = $(event.relatedTarget).text(); // previous tab
			//     $(".act span ").text(x);
			//     $(".prev span ").text(y);
			// });
		});
	</script>
</body>