<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User | Chi tiết dự án</title>
</head>

<body>
	<style>
.content-wrapper {
	background-color: #fff;
}
</style>
	<div class="content-wrapper">
		<section class="content">
			<div class="container-fluid">
				<c:forEach var="detail" items="${detail }" varStatus="detailIndex">
						<c:if test="${ detail.pic_role=='ROLE_PM' && detail.type=='Triển khai' }">
							<h2 class="text-center mt-3">${detail.name }</h2>
							<div class="row pt-2">
							<div class="col-md-7">
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
											<th class="w-25">Phạm vi cung cấp</th>
											<td>${detail.pham_vi_cung_cap}</td>
										</tr>
										<tr>
											<th>Tình trạng & kế hoạch chị tiết</th>
											<td>${detail.tinh_trang_va_ke_hoach_chi_tiet}</td>
										</tr>
										<tr>
											<th>Kết quả thực hiện kế hoạch</th>
											<td>${detail.ket_qua_thuc_hien_ke_hoach}</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-md-5">
								<div class="table-responsive-sm">
									<table class="table table-hover table-bordered">
										<tr>
											<th style="width: 20%;" class="text-center">Kế hoạch</th>
											<th class="text-center">Số tiền<br />(VNĐ)</th>
											<th class="text-center" style="width: 26%;">Ngày thanh toán<br/>(D / M / Y)</th>
											<th class="text-center" style="width: 26%;">Nghiệm thu<br/>(D / M / Y)</th>
										</tr>
										<tr class="text-center">
											<th>DAC</th>
											<td class="text-right">
												<c:if test="${detail.so_tien_DAC != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_DAC}" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.ke_hoach_thanh_toan_DAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.DAC}" pattern="dd / MM / yyyy" /></td>
										</tr>
										<tr class="text-center">
											<th>PAC</th>
											<td class="text-right">
												<c:if test="${detail.so_tien_PAC != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_PAC}" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.ke_hoach_thanh_toan_PAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.PAC}" pattern="dd / MM / yyyy" /></td>
										</tr>
										<tr class="text-center">
											<th>FAC</th>
											<td class="text-right">
												<c:if test="${detail.so_tien_FAC != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_FAC}" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.ke_hoach_thanh_toan_FAC}" pattern="dd / MM / yyyy" /></td>
											<td><fmt:formatDate value="${detail.FAC}" pattern="dd / MM / yyyy" /></td>
										</tr>
										<tr class="text-center">
											<th>Tổng</th>
											<td class="text-right">
												<c:if test="${detail.tong_gia_tri_thuc_te != 0}">
													<fmt:formatNumber type="number" value="${detail.tong_gia_tri_thuc_te }" />
												</c:if>
											</td>
											<td class="bg-dark"></td>
											<td class="bg-dark"></td>
										</tr>
										<tr class="text-center">
											<th>Tạm ứng</th>
											<td class="text-right">
												<c:if test="${detail.so_tien_tam_ung != 0}">
													<fmt:formatNumber type="number" value="${detail.so_tien_tam_ung }" />
												</c:if>
											</td>
											<td><fmt:formatDate value="${detail.ke_hoach_tam_ung}" pattern="dd / MM / yyyy" /></td>
											<td class="bg-dark"></td>
										</tr>
									</table>
								</div>
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
												<td>${detail.name }</td>
											</tr>
											<tr>
												<th>Mô tả dự án</th>
												<td style="white-space: pre-wrap;">${detail.description }</td>
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
												<td style="white-space: pre-wrap;">${detail.description }</td>
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
									
								</div>
							</div>
						</c:if>
				</c:forEach>
			</div>
		</section>
	</div>
</body>
</html>