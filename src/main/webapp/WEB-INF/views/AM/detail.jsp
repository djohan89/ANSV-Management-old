<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AM | Chi tiết dự án</title>
</head>

<body>
	<style>
.content-wrapper {
	background-color: #fff;
}
</style>
	<div class="content-wrapper">
	<div class="content-header">
		<a href="<c:url value='/AM/create/${week }' />" class="btn btn-info" role="button">Thêm dự án</a>
				
			<!-- /.container-fluid -->
		</div>

		<section class="content">
			<div class="container-fluid">
				<c:forEach var="detail" items="${detail }" varStatus="detailIndex">
					<c:if
						test="${ detail.pic_role=='ROLE_PM' && detail.type=='Triển khai' }">
						<h2 class="text-center mt-3">${detail.name }</h2>
						<div class="row">


							<div class="col-md-6">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered">
										<tr>
											<th colspan="2">Khách hàng</th>
											<td>${detail.customer }</td>
										</tr>
										<tr>
											<th colspan="2">Phạm vi cung cấp</th>
											<td>${detail.pham_vi_cung_cap }</td>
										</tr>
										<tr>
											<th colspan="2">Tổng giá trị</th>
											<td><c:if
													test="${ detail.tong_gia_tri_thuc_te !=0}">
													<fmt:formatNumber type="number"
														value="${detail.tong_gia_tri_thuc_te }" />
												</c:if></td>
										</tr>
										<tr>
											<th rowspan="3">Kế hoạch nghiệm thu</th>
											<th>DAC</th>
											<td>${detail.DAC }</td>
										</tr>
										<tr>
											<th>PAC</th>
											<td>${detail.PAC }</td>
										</tr>
										<tr>
											<th>FAC</th>
											<td>${detail.FAC }</td>
										</tr>
										<tr>
											<th rowspan="2">Thanh toán tạm ứng</th>
											<th>Số tiền</th>
											<td><c:if test="${detail.so_tien_tam_ung !=0} ">
													<fmt:formatNumber type="number"
														value="${detail.so_tien_tam_ung }" />
												</c:if></td>
										</tr>
										<tr>
											<th>Kế hoạch</th>
											<td>${detail.ke_hoach_tam_ung }</td>
										</tr>
										<tr>
											<th rowspan="2">Thanh toán DAC</th>
											<th>Số tiền</th>
											<td><c:if test="${ detail.so_tien_DAC !=0}">
													<fmt:formatNumber type="number"
														value="${detail.so_tien_DAC }" />
												</c:if></td>
										</tr>
										<tr>
											<th>Kế hoạch</th>
											<td>${detail.ke_hoach_thanh_toan_DAC }</td>
										</tr>
										<tr>
											<th rowspan="2">Thanh toán PAC</th>
											<th>Số tiền</th>

											<td><c:if test="${ detail.so_tien_PAC !=0}">
													<fmt:formatNumber type="number"
														value="${detail.so_tien_PAC }" />
												</c:if></td>
										</tr>
										<tr>
											<th>Kế hoạch</th>
											<td>${detail.ke_hoach_thanh_toan_PAC }</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-md-6">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered">
										<tr>
											<th rowspan="2">Thanh toán FAC</th>
											<th>Số tiền</th>
											<td><c:if test="${ detail.so_tien_FAC !=0}">
													<fmt:formatNumber type="number"
														value="${detail.so_tien_FAC }" />
												</c:if></td>
										</tr>
										<tr>
											<th>Kế hoạch</th>
											<td>${detail.ke_hoach_thanh_toan_FAC }</td>
										</tr>
										<tr>
											<th colspan="2">Tình trạng</th>
											<td>${detail.tinh_trang_va_ke_hoach_chi_tiet }</td>
										</tr>
										<tr>
											<th colspan="2">Priority</th>
											<td>${detail.priority }</td>
										</tr>
										<tr>
											<th colspan="2">Kết quả thực hiện kế hoạch</th>
											<td>${detail.ket_qua_thuc_hien_ke_hoach }</td>
										</tr>
										<tr>
											<th colspan="2">Phụ trách</th>
											<td>${detail.pic_name }</td>
										</tr>
									</table>
								</div>
								<div class="btn-function d-flex flex-row-reverse mb-3">
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
												<div class="modal-body">Bạn có muốn đóng dự án
													"${detail.name }"</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-danger">Đóng
														dự án</button>
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-warning mr-2">
										<a href="<c:url value='/AM/update/${week}/${detail.id}'/>" style="color: white;">Sửa</a> 
									</button>
								</div>
							</div>
					</c:if>
					<c:if test="${detail.type=='Viễn thông' }">
						<h2 class="text-center mt-3">${detail.name }</h2>
						<div class="row">
							<div class="col-md-6">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered ">
										<tr>
											<th>Dự án/Gói thầu</th>
											<td>${detail.name })</td>
										</tr>
										<tr>
											<th>Mô tả dự án</th>
											<td style="white-space: pre-wrap;">${detail.description }</td>
										</tr>
										<tr>
											<th>Tổng mức đầu tư</th>
											<td>${detai.tong_muc_dau_tu_du_kien }</td>
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
											<th>Tình trạng & Kế hoạch chi tiết</th>
											<td style="white-space: pre-wrap;">${detail.tinh_trang_va_ke_hoach_chi_tiet }</td>
										</tr>
										<tr>
											<th>Phân tích SWOT</th>
											<td style="white-space: pre-wrap;">${detail.phan_tich_SWOT }</td>
										</tr>
										<tr>
											<th>Kết quả thực hiện kế hoạch</th>
											<td style="white-space: pre-wrap;">${detail.ket_qua_thuc_hien_ke_hoach }</td>
										</tr>
										<tr>
											<th>Phụ trách</th>
											<td>${detail.pic_name}</td>
										</tr>
									</table>
								</div>
								<div class="btn-function d-flex flex-row-reverse mb-3">
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
												<div class="modal-body">Bạn có muốn đóng dự án
													"${detail.name }"</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-danger">Đóng
														dự án</button>
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-warning mr-2">
										<a href="<c:url value='/AM/update/${week}/${detail.id}' />" style="color: white;">Sửa</a>
									</button>
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
											<td>${detail.name })</td>
										</tr>
										<tr>
											<th>Mô tả dự án</th>
											<td style="white-space: pre-wrap;">${detail.description }</td>
										</tr>
										<tr>
											<th>Tổng mức đầu tư</th>
											<td>${detai.tong_muc_dau_tu_du_kien }</td>
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
											<th>Tình trạng & Kế hoạch chi tiết</th>
											<td style="white-space: pre-wrap;">${detail.tinh_trang_va_ke_hoach_chi_tiet }</td>
										</tr>
										<tr>
											<th>Phân tích SWOT</th>
											<td style="white-space: pre-wrap;">${detail.phan_tich_SWOT }</td>
										</tr>
										<tr>
											<th>Kết quả thực hiện kế hoạch</th>
											<td style="white-space: pre-wrap;">${detail.ket_qua_thuc_hien_ke_hoach }</td>
										</tr>
										<tr>
											<th>Phụ trách</th>
											<td>${detail.pic_name}</td>
										</tr>
									</table>
								</div>
								<div class="btn-function d-flex flex-row-reverse mb-3">
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
												<div class="modal-body">Bạn có muốn đóng dự án
													"${detail.name }"</div> 
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-danger">Đóng
														dự án</button>
												</div>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-warning mr-2">
										<a href="<c:url value='/AM/update/${week}/${detail.id}' />" style="color: white;">Sửa</a>
									</button>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

		</section>
	</div>
</body>
</html>