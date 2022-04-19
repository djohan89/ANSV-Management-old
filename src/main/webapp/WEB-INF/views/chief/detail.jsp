<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO | Chi tiết dự án</title>
</head>

<body>
	<div class="content-wrapper bg-light">
		<section class="content">
			<div class="container-fluid">
				<c:forEach var="detail" items="${project_detail}" varStatus="detailIndex">
					<c:if test="${detail.pic_role=='ROLE_PM' && detail.type=='Triển khai'}">
						<h2 class="text-center mt-3">${detail.name}</h2>
						<div class="row pt-2">
							<div class="col-md-5">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered">
										<tr>
											<td width="35%">
												<span class="font-weight-bold">Status:</span>
												<span class="pl-5">${detail.status}</span>
											</td>
											<td>
												<span class="font-weight-bold">PIC:</span>
												<span class="pl-2">${detail.pic_name}</span>
											</td>
										</tr>
										<tr>
											<td>
												<span class="font-weight-bold">Priority:</span>
												<span class="pl-5">${detail.priority}</span>
											</td>
											<td>
												<span class="font-weight-bold">Khách hàng:</span>
												<span class="pl-2">${detail.customer}</span>
											</td>
										</tr>
									</table>
									
									<table class="table table-hover table-bordered">
										<tr>
											<th class="w-25">Tiến độ chung</th>
											<td>${detail.pham_vi_cung_cap}</td>
										</tr>
										<tr>
											<th>Khó khăn</th>
											<td>${detail.general_issue}</td>
										</tr>
										<tr>
											<th>Giải pháp</th>
											<td>${detail.solution}</td>
										</tr>
										<tr>
											<th>Kế hoạch</th>
											<td>${detail.ke_hoach}</td>
										</tr>
										<tr>
											<th>Kết quả</th>
											<td>${detail.ket_qua_thuc_hien_ke_hoach}</td>
										</tr>
									</table>
									
								</div>
								
								
							</div>
							<div class="col-md-7">
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
												<c:if test="${detail.so_tien_DAC != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_DAC}" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.DAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.ke_hoach_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.thuc_te_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
											<td>${detail.chenh_lech_DAC}</td>
										</tr>
										<tr class="text-center">
											<th>PAC</th>
											<td class="text-right">
												<c:if test="${detail.so_tien_PAC != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_PAC}" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.PAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.ke_hoach_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.thuc_te_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
											<td>${detail.chenh_lech_PAC}</td>
										</tr>
										<tr class="text-center">
											<th>FAC</th>
											<td class="text-right">
												<c:if test="${detail.so_tien_FAC != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_FAC}" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.FAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.ke_hoach_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.thuc_te_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
											<td>${detail.chenh_lech_FAC}</td>
										</tr>
										<tr class="text-center">
											<th>Tổng</th>
											<td class="text-right">
												<c:if test="${detail.tong_gia_tri_thuc_te != 0}">
													<fmt:formatNumber type="number" value="${detail.tong_gia_tri_thuc_te }" />
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
												<c:if test="${detail.so_tien_tam_ung != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_tam_ung }" />
												</c:if>
											</td>
											<td>N/A</td>
											<td><fmt:formatDate value="${detail.ke_hoach_tam_ung}" pattern="dd / MM / yyyy" /></td>
											<td>N/A</td>
											<td>N/A</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<c:if test="${detail.week == current_week || detail.week == (current_week - 1)}">
										<a href="<c:url value='/chief/update_project_tk/${week_option}_${year_option}_${detail.id}' />"
											style="position: absolute; left: 1%;" class="float-right btn btn-warning">
											<i class="fas fa-edit"></i>
										</a>
									</c:if>
								</div>
							</div>
						</div>
						
						
						<%-- <div class="row">
							<div class="col-md-12 d-flex flex-row-reverse">
								<button data-toggle="modal" data-target="#delete-course-modal" type="button" class="btn btn-danger">Đóng</button>
								<!-- {{!-- Confirm delete courses --}} -->
								<div class="modal fade" id="delete-course-modal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Modal
													title</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">bạn có muốn đóng dự án
												${detail.name }</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<a type="button" href="<c:url value='/chief/delete_project/${week}_${year}_${detail.id}' />" class="btn btn-danger">Đóng
													dự án</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> --%>
					</c:if>
					<c:if test="${detail.type=='Viễn thông' }">
						<h2 class="text-center mt-3">${detail.name}</h2>
						<div class="row">
							<div class="col-md-5">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered ">
										<tr>
											<th width="30%">Dự án/Gói thầu</th>
											<td>${detail.name}</td>
										</tr>
										<tr>
											<th>Mô tả dự án</th>
											<td >${detail.description}</td>
										</tr>
										<tr>
											<th>Tổng mức đầu tư</th>
											<td>${detail.tong_muc_dau_tu_du_kien}</td>
										</tr>
										<tr>
											<th>Hình thức đầu tư</th>
											<td>${detail.hinh_thuc_dau_tu}</td>
										</tr>
										<tr>
											<th>Mức độ khả thi</th>

											<td><c:if test="${detail.muc_do_kha_thi != 0}">
													${detail.muc_do_kha_thi }%
												</c:if></td>
										</tr>
										<tr>
											<th>Priority</th>
											<td>${detail.priority }</td>
										</tr>
									</table>
									
								</div>
							</div>
							<div class="col-md-7">
								<div class="table-responsive-sm">
									<table class="table table-bordered table-hover">
										<tr>
											<th width="35%">Kế hoạch</th>
											<td class="text-justify">${detail.ke_hoach}</td>
										</tr>
										<tr>
											<th>Khó khăn</th>
											<td class="text-justify" >${detail.general_issue}</td>
										</tr>
										<tr>
											<th>Giải pháp</th>
											<td class="text-justify" >${detail.solution}</td>
										</tr>
										<tr>
											<th>Phân tích SWOT</th>
											<td class="text-justify">${detail.phan_tich_SWOT }</td>
										</tr>
										<tr>
											<th>Kết quả thực hiện kế hoạch</th>
											<td class="text-justify" >${detail.ket_qua_thuc_hien_ke_hoach }</td>
										</tr>
										<tr>
											<th>Phụ trách</th>
											<td>${detail.pic_name}</td>
										</tr>
									</table>
								</div>
								<%-- <div class="btn-function d-flex flex-row-reverse mb-3">
									<button data-toggle="modal" data-target="#delete-course-modal"
										type="button" class="btn btn-danger">Đóng</button>
									<!-- {{!-- Confirm delete courses --}} -->
									<div class="modal fade" id="delete-course-modal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Modal
														title</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">bạn có muốn đóng dự án
													${detail.name }</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<a type="button" href="<c:url value='/chief/delete_project/${week}_${year}_${detail.id}' />" class="btn btn-danger">Đóng
														dự án</a>
												</div>
											</div>
										</div>
									</div>
								</div> --%>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<c:if test="${detail.week != current_week && detail.week != (current_week - 1)}"></c:if>
									<c:if test="${detail.week == current_week || detail.week == (current_week - 1)}">
										<a href="<c:url value='/chief/update_project/${week_option}_${year_option}_${detail.id}' />"
											style="position: absolute; left: 1%;" class="float-right btn btn-warning">
											<i class="fas fa-edit"></i>
										</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${detail.type=='Chuyển đổi số' }">
						<h2 class="text-center mt-3">${detail.name }</h2>
						<div class="row">
							<div class="col-md-6">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered ">
										<tr>
											<th>Dự án/Gói thầu</th>
											<td>${detail.name }</td>
										</tr>
										<tr>
											<th>Mô tả dự án</th>
											<td >${detail.description }</td>
										</tr>
										<tr>
											<th>Tổng mức đầu tư</th>
											<td>${detail.tong_muc_dau_tu_du_kien }</td>
										</tr>
										<tr>
											<th>Hình thức đầu tư</th>
											<td>${detail.hinh_thuc_dau_tu }</td>
										</tr>
										<tr>
											<th>Mức độ khả thi</th>

											<td><c:if test="${detail.muc_do_kha_thi != 0  }">
													${detail.muc_do_kha_thi }%
												</c:if></td>
										</tr>
										<tr>
											<th>Priority</th>
											<td>${detail.priority }</td>
										</tr>
									</table>
									
								</div>
							</div>
							<div class="col-md-6">
								<div class="table-responsive-sm">
									<table class="table table-bordered table-hover">
										<tr>
											<th>Kế hoạch</th>
											<td class="text-justify">${detail.ke_hoach}</td>
										</tr>
										<tr>
											<th>Khó khăn</th>
											<td class="text-justify" >${detail.general_issue}</td>
										</tr>
										<tr>
											<th>Giải pháp</th>
											<td class="text-justify" >${detail.solution}</td>
										</tr>
										<tr>
											<th>Phân tích SWOT</th>
											<td class="text-justify">${detail.phan_tich_SWOT}</td>
										</tr>
										<tr>
											<th>Kết quả thực hiện kế hoạch</th>
											<td class="text-justify" >${detail.ket_qua_thuc_hien_ke_hoach}</td>
										</tr>
										<tr>
											<th>Phụ trách</th>
											<td>${detail.pic_name}</td>
										</tr>
									</table>
								</div>
								<%-- <div class="btn-function d-flex flex-row-reverse mb-3">
									<button data-toggle="modal" data-target="#delete-course-modal"
										type="button" class="btn btn-danger">Đóng</button>
									<!-- {{!-- Confirm delete courses --}} -->
									<div class="modal fade" id="delete-course-modal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Modal
														title</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">bạn có muốn đóng dự án
													${detail.name }</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<a type="button" href="<c:url value='/chief/delete_project/${week}_${year}_${detail.id}' />" class="btn btn-danger">Đóng
														dự án</a>
												</div>
											</div>
										</div>
									</div>
								</div> --%>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<c:if test="${detail.week != current_week && detail.week != (current_week - 1)}"></c:if>
									<c:if test="${detail.week == current_week || detail.week == (current_week - 1)}">
										<a href="<c:url value='/chief/update_project/${week_option}_${year_option}_${detail.id}' />"
											style="position: absolute; left: 1%;" class="float-right btn btn-warning">
											<i class="fas fa-edit"></i>
										</a>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<a href="javascript:history.back()" class="float-right">Quay lại</a>
			</div> <!-- End: container-fluid -->
		</section>
	</div>
</body>
</html>