<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<head>
<meta charset="UTF-8">
<title>Dashboard | CEO</title>
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
	<c:url value="pl-3" var="padding_left_slideshow"/>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">

			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
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
													<div class="modal-header" style="border-bottom: none;">
														<!-- <h5 class="modal-title" id="modal_title">Các dự án chậm tiến độ</h5> -->
														<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
													</div>
													<div class="modal-body" style="font-size: 15px; color: black; margin-top: -3%;">
														<!-- Slide cho màn hình lớn -->
														<div class="owl-carousel owl-theme" id="detail_slide">
															<!-- ===== Phần chèn thêm HTML ===== -->
															<c:forEach items="${project_slideshow }" var="project_item" varStatus="project_index">
																
																<div class="container item">
																	<div class="row d-flex">
																		<h5 class="pb-2 pt-1 pl-3" style="width: 97%; background: red; border-radius: 16px; text-align: center;">
																			<a href="javascript:void(0)" style="color: #fff; font-weight: bold;">${project_item.name }</a>
																		</h5>
																		<button type="button" class="close ml-3 pb-2" data-dismiss="modal">&times;</button>
																	</div>
																	
																	<div class="row ml-2 pt-2 pb-1 pl-4 mb-4" style="width: 95.6%; padding-bottom: 0; background: lightgrey; border-radius: 0 0 16px 16px; margin-top: -1%;">
																		<div class="col-5">
																			<b>AM:</b><span class="${padding_left_slideshow}">${project_item.am}</span>
																		</div>
																		<div class="col-5">
																			<b>PM:</b><span class="${padding_left_slideshow}">${project_item.pm}</span>
																		</div>
																		<div class="col-2 pl-4">
																			<b>Priority:</b><span class="${padding_left_slideshow}">${project_item.priority}</span>
																		</div>
																	</div>
																	
																	<div class="table-responsive">
																		<div class="row" style="width: 99.9%;">
																			<div class="col-6 overflow">
																				<c:if test="${not empty project_item.pham_vi_cung_cap}">
																					<p>
																						<b>Tiến độ chung:</b><br/>
																						<span class="d-flex">
																							<i class="far fa-hand-point-right"></i>
																							<span class="ml-2 pl-2 border-left border-primary">${project_item.pham_vi_cung_cap}</span>	
																						</span>
																					</p><hr>
																				</c:if>
																				<c:if test="${not empty project_item.ke_hoach}">
																					<p>
																						<b>Kế hoạch:</b><br/>
																						<span class="d-flex ">
																							<i class="far fa-hand-point-right"></i>
																							<span class="ml-2 pl-2 border-left border-primary ">${project_item.ke_hoach}</span>
																						</span>
																					</p><hr>
																				</c:if>
																				<c:if test="${not empty project_item.general_issue}">
																					<p>
																						<b>Khó khăn:</b><br/>
																						<span class="d-flex ">
																							<i class="far fa-hand-point-right"></i>
																							<span class="ml-2 pl-2 border-left border-primary ">${project_item.general_issue}</span>
																						</span>
																					</p><hr>
																				</c:if>
																				<c:if test="${not empty project_item.solution}">
																					<p>
																						<b>Giải pháp:</b><br/>
																						<span class="d-flex ">
																							<i class="far fa-hand-point-right"></i>
																							<span class="ml-2 pl-2 border-left border-primary ">${project_item.solution}</span>
																						</span>
																					</p>
																				</c:if>
																			</div>
																			<div class="col-6 pl-4">
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
																							<c:if test="${project_item.so_tien_DAC != 0}">
																								<fmt:formatNumber type="number" value="${project_item.so_tien_DAC}" />
																							</c:if>
																						</td>
																						<td><fmt:formatDate value="${project_item.DAC}" pattern="dd / MM / yyyy" /></td>
																						<td><fmt:formatDate value="${project_item.ke_hoach_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
																						<td><fmt:formatDate value="${project_item.thuc_te_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
																						<td>${project_item.chenh_lech_DAC}</td>
																					</tr>
																					<tr class="text-center">
																						<th>PAC</th>
																						<td class="text-right">
																							<c:if test="${project_item.so_tien_PAC != 0}">
																								<fmt:formatNumber type="number" value="${project_item.so_tien_PAC}" />
																							</c:if>
																						</td>
																						<td><fmt:formatDate value="${project_item.PAC}" pattern="dd / MM / yyyy" /></td>
																						<td><fmt:formatDate value="${project_item.ke_hoach_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
																						<td><fmt:formatDate value="${project_item.thuc_te_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
																						<td>${project_item.chenh_lech_PAC}</td>
																					</tr>
																					<tr class="text-center">
																						<th>FAC</th>
																						<td class="text-right">
																							<c:if test="${project_item.so_tien_FAC != 0}">
																								<fmt:formatNumber type="number" value="${project_item.so_tien_FAC}" />
																							</c:if>
																						</td>
																						<td><fmt:formatDate value="${project_item.FAC}" pattern="dd / MM / yyyy" /></td>
																						<td><fmt:formatDate value="${project_item.ke_hoach_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
																						<td><fmt:formatDate value="${project_item.thuc_te_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
																						<td>${project_item.chenh_lech_FAC}</td>
																					</tr>
																					<tr class="text-center">
																						<th>Tổng</th>
																						<td class="text-right">
																							<c:if test="${project_item.tong_gia_tri_thuc_te != 0}">
																								<fmt:formatNumber type="number" value="${project_item.tong_gia_tri_thuc_te }" />
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
																							<c:if test="${project_item.so_tien_tam_ung != 0}">
																								<fmt:formatNumber type="number" value="${project_item.so_tien_tam_ung }" />
																							</c:if>
																						</td>
																						<td>N/A</td>
																						<td><fmt:formatDate value="${project_item.ke_hoach_tam_ung}" pattern="dd / MM / yyyy" /></td>
																						<td>N/A</td>
																						<td>N/A</td>
																					</tr>
																				</table>
																			</div>
																		</div>
													            	</div>
													            	
													            	<div class="row">
													            		<div class="col-12 pt-3">
													                		<p class="text-justify">
													                		
													                			<b>Kết quả thực hiện kế hoạch:</b><br/>
													                			${project_item.ket_qua_thuc_hien_ke_hoach}
													                		</p>
													                	</div>
													                </div>
													                <div>
													                	<figcaption class="text-center">${project_index.index +1 } / ${project_slideshow.size()}</figcaption>
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
																			<div class="row">
																				<div class="col-11">
																					<h5 class="pb-2 pt-1 pl-3" style="background: red;border-radius: 16px; ">
																						<a href="javascript:void(0)" style="color: #fff">${project_item.name }</a>
																					</h5>
																				</div>
																				<div class="col-1">
																					<button type="button" class="close" data-dismiss="modal">&times;</button>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-6">
																					<p><b>PM:</b> ${project_item.pm }</p>
																				</div>
																				<div class="col-6">
																					<p><b>AM:</b> ${project_item.am }</p>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-6"><p><b>Priority:</b> ${project_item.priority }</p></div>
																				<div class="col-6"><p><b>Status:</b>  ${project_item.status }</p></div>
																			</div>
																			<div class="row">
																				<div class="col-6">
																					<p ><b>Tiến độ chung:</b> ${project_item.pham_vi_cung_cap }</p>
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
																			<div class="col-4"><b>DAC(Hợp đồng): </b></div>
																			<div class="col-4"><b>PAC(Hợp đồng): </b></div>
																			<div class="col-4"><b>FAC(Hợp đồng): </b></div>
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
																			<div class="col-6"><b>Kế hoạch tạm ứng:</b><br>
																				<fmt:formatDate value="${project_item.ke_hoach_tam_ung}" pattern="dd/MM/yyyy" /> 
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-6"><b>Số tiền DAC: </b>
																				<c:if test="${project_item.so_tien_DAC  !=0}">
																					<fmt:formatNumber type="number"
																						value="${project_item.so_tien_DAC }" />
																				</c:if>
																			</div>
																			<div class="col-6"><b>Mục tiêu DAC: </b>
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
																			<div class="col-6"><b>Mục tiêu PAC: </b>
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
																			<div class="col-6"><b>Mục tiêu FAC: </b>
																				<fmt:formatDate value="${project_item.ke_hoach_thanh_toan_FAC}" pattern="dd/MM/yyyy" />
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-4"><b>DAC(Thực tế): </b></div>
																			<div class="col-4"><b>PAC(Thực tế): </b></div>
																			<div class="col-4"><b>FAC(Thực tế): </b></div>
																			<div class="col-4"><fmt:formatDate value="${project_item.thuc_te_thanh_toan_DAC}" pattern="dd/MM/yyyy" /></div>
																			<div class="col-4"><fmt:formatDate value="${project_item.thuc_te_thanh_toan_PAC}" pattern="dd/MM/yyyy" /></div>
																			<div class="col-4"><fmt:formatDate value="${project_item.thuc_te_thanh_toan_FAC}" pattern="dd/MM/yyyy" /></div>
																		</div>
														            	<div class="row">
														            		<div class="col-6 left">
														            			<p><b>Tình trạng:</b> </p>
														            			<div class="overflow_mb"><p class="text-justify" >${project_item.ke_hoach }</p></div>
														            			
														                	</div>
														                	<div class="col-6 ">
														                		<p><b>Khó khăn:</b> </p>
														                		<div class="overflow_mb"><p class="text-justify" >${project_item.general_issue}</p></div>
														                		
														                	</div>
														                </div><br>												                <div class="row">
														            		<div class="col-6 left">
														            			<p><b>Giải pháp:</b> </p>
														            			<div class="overflow_mb"><p class="text-justify" >${project_item.solution }</p></div>
														            			
														                	</div>
														                	<div class="col-6 ">
														                		<p><b>Kết quả thực hiện kế hoạch:</b> </p>
														                		<div class="overflow_mb">
														                			<p class="text-justify" >${project_item.ket_qua_thuc_hien_ke_hoach }</p>
														                		</div>
														                		
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
											<th style="width: 22%;">PIC</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Triển khai' && project_item.pic_role =='ROLE_PM' }">
												<tr>
													<td>
														<c:if test="${week < 10 }">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
														</c:if>
														<c:if test="${week >=10 }">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
														</c:if>
															<c:if test="${project_item.status == 'High'}">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status == 'Medium'}">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status == 'Low'}">
																<span class="tooltiptext" style="background-color: #262626">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status == 'Complete'}">
																<span class="tooltiptext" style="background-color: #007bff">${project_item.ke_hoach }</span>
															</c:if>
														</a>
													</td>
													<td>
													<c:if test="${week < 10 }">
														<c:if test="${project_item.status == 'High'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Medium'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Low'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Complete'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
													</c:if>
													<c:if test="${week >=10 }">
														<c:if test="${project_item.status == 'High'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Medium'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Low'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Complete'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
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
											<th style="width: 22%;">PIC</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Viễn thông' }">
												<tr>
													<td>
														<c:if test="${week < 10 }">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
														</c:if>
														<c:if test="${week >=10 }">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
														</c:if>
															<c:if test="${project_item.status == 'High'}">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status == 'Medium'}">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status == 'Low'}">
																<span class="tooltiptext" style="background-color: #262626">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status == 'Complete'}">
																<span class="tooltiptext" style="background-color: #007bff">${project_item.ke_hoach }</span>
															</c:if>
														</a>
													</td>
													<td>
													<c:if test="${week < 10 }">
														<c:if test="${project_item.status == 'High'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Medium'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Low'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Complete'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
													</c:if>
													<c:if test="${week >=10 }">
														<c:if test="${project_item.status == 'High'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Medium'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Low'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Complete'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
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
											<th style="width: 22%;">PIC</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project_table }" var="project_item" varStatus="project_index">
											<c:if test="${project_item.type == 'Chuyển đổi số' }">
												<tr>
													<td>
														<c:if test="${week < 10}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
														</c:if>
														<c:if test="${week >= 10}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />" class="tooltip_css" style="font-weight: bold" data-html="true">
															${project_item.project_name }
														</c:if>
															<c:if test="${project_item.status =='High' }">
																<span class="tooltiptext" style="background-color: rgb(230, 46, 51)">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status =='Medium' }">
																<span class="tooltiptext" style="background-color: #ff9900">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status =='Low' }">
																<span class="tooltiptext" style="background-color: #262626">${project_item.ke_hoach }</span>
															</c:if>
															<c:if test="${project_item.status =='Complete' }">
																<span class="tooltiptext" style="background-color: #007bff">${project_item.ke_hoach }</span>
															</c:if>
															
														</a>
													</td>
													<td>
													<c:if test="${week < 10 }">
														<c:if test="${project_item.status == 'High'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Medium'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Low'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Complete'}">
															<a href="<c:url value='/chief/detail/0${week}_${year}_${project_item.id}' />"  class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
													</c:if>
													<c:if test="${week >=10 }">
														<c:if test="${project_item.status == 'High'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-danger w-100"><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Medium'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-warning w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Low'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-success w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
														<c:if test="${project_item.status == 'Complete'}">
															<a href="<c:url value='/chief/detail/${week}_${year}_${project_item.id}' />"  class="btn btn-primary w-100" ><font size="-1">${project_item.priority }</font></a>
														</c:if>
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
	       autoplayTimeout: 10000,
	       responsiveClass: true,
	       autoplayHoverPause: true
	   	});
	    
	  	/* owl.on('mousewheel', '.owl-stage', function (e) {
	        if (e.deltaY>0) {
	            owl.trigger('next.owl');
	        } else {
	            owl.trigger('prev.owl');
	        }
	        e.preventDefault();
	    }); */
		
	  	$('#myModal').modal('show');
		$('div.dataTables_wrapper').addClass("change_font_size");
	});
</script>
</body>