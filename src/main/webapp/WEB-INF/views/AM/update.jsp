<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AM | Update dự án</title>
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
				<form action="">
					<c:forEach var="detail" items="${detail }" varStatus="detailIndex">
						<c:if
							test="${ detail.pic_role=='ROLE_PM' && detail.type=='Triển khai' }">
							<h2 class="text-center mt-3">${detail.name }</h2>
							<div class="row">
								<div class="col-md-5">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Mã dự án</span>
										</div>
										<input type="text" class="form-control" id="id_project"
											value="${detail.id }" disabled>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tên dự án</span>
										</div>
										<input type="text" class="form-control" id="name"
											value="${detail.name }" name="name">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="khach_hang">Khách
												hàng</label>
										</div>
										<select class="custom-select" id="khach_hang">
											
											
											<c:forEach var="customer" items="${customers}">
												<c:if test="${customer.name == detail.customer }">
													<option value="${customer.id }" selected>${customer.name }
												</c:if>
												<c:if test="${customer.name != detail.customer }">
													<option value="${customer.id }">${customer.name }
												</c:if>
												</option> 
											</c:forEach>
											
										</select>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Phạm vi cung cấp</span>
										</div>
										<textarea class="form-control" name="ud_pham_vi_cung_cap" id="ud_pham_vi_cung_cap">${detail.pham_vi_cung_cap }</textarea>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tổng giá trị</span>
										</div>
										
										<c:if test="${ detail.tong_gia_tri_thuc_te !=0}">
											<fmt:formatNumber type = "number" groupingUsed = "false" value = "${detail.tong_gia_tri_thuc_te }" var="price" />
										</c:if>
										<input type="number" class="form-control" name="ud_tong_gia_tri" id="ud_tong_gia_tri"
											value="${price}">
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="priority">Priority</label>
										</div>
										<select class="custom-select" id="priority">
											
											<c:forEach var="priority" items="${priorities}">
												<c:if test="${priority.name == detail.priority }">
													<option value="${priority.id }" selected>${priority.name }
												</c:if>
												<c:if test="${priority.name != detail.priority }">
													<option value="${priority.id }">${priority.name }
												</c:if>
												</option> 
											</c:forEach>
										</select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="status">Status</label>
										</div>
										<select class="custom-select" id="status">
											
											<c:forEach var="status" items="${status}">
												<c:if test="${status.name == detail.status }">
													<option value="${status.id }" selected>${status.name }
												</c:if>
												<c:if test="${status.name != detail.status }">
													<option value="${status.id }">${status.name }
												</c:if>
												</option> 
											</c:forEach>
										</select>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch NT DAC</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_nt_DAC" id="ud_kh_nt_DAC" value="detail.DAC">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch NT PAC</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_nt_PAC" id="ud_kh_nt_PAC"
											value="detail.PAC">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch NT FAC</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_nt_FAC" id="ud_kh_nt_FAC"
											value="detail.FAC">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Số tiền TT tạm ứng</span>
										</div>
										<c:if test="${ detail.so_tien_tam_ung !=0}">
											<fmt:formatNumber type = "number" groupingUsed = "false" value = "${detail.so_tien_tam_ung }" var="so_tien_tam_ung" />
										</c:if>
										<input type="number" class="form-control" name="ud_so_tien_tt_tam_ung" id="ud_so_tien_tt_tam_ung" 
												value="${so_tien_tam_ung }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch TT tạm ứng</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_tt_tam_ung" id="ud_kh_tt_tam_ung" value="${detail.ke_hoach_tam_ung }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Số tiền TT DAC</span>
										</div>
										<c:if test="${ detail.so_tien_DAC !=0}">
											<fmt:formatNumber type = "number" groupingUsed = "false" value = "${detail.so_tien_DAC }" var="so_tien_DAC" />
										</c:if>
										<input type="text" class="form-control" name="ud_so_tien_tt_DAC" id="ud_so_tien_tt_DAC" value="${so_tien_DAC }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch TT DAC</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_tt_DAC" id="ud_kh_tt_DAC" value="${detail.ke_hoach_thanh_toan_DAC }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Số tiền TT PAC</span>
										</div>
										<c:if test="${ detail.so_tien_PAC !=0}">
											<fmt:formatNumber type = "number" groupingUsed = "false" value = "${detail.so_tien_PAC }" var="so_tien_PAC" />
										</c:if>
										<input type="text" class="form-control" name="ud_so_tien_tt_PAC" id="ud_so_tien_tt_PAC"
											value="${so_tien_PAC }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch TT PAC</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_tt_PAC" id="ud_kh_tt_PAC"
											value="${detail.ke_hoach_thanh_toan_PAC }">
									</div>
									
		
								</div>
								<div class="col-md-7">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Số tiền TT FAC</span>
										</div>
										<c:if test="${ detail.so_tien_FAC !=0}">
											<fmt:formatNumber type = "number" groupingUsed = "false" value = "${detail.so_tien_FAC }" var="so_tien_FAC" />
										</c:if>
										<input type="text" class="form-control" name="ud_so_tien_tt_FAC" id="ud_so_tien_tt_FAC"
											value="${so_tien_FAC }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kế hoạch TT FAC</span>
										</div>
										<input type="date" class="form-control" name="ud_kh_tt_FAC" id="ud_kh_tt_FAC"
											value="${detail.ke_hoach_thanh_toan_FAC }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tình trạng kế hoạch</span>
										</div>
										<textarea id="ud_tinh_trang" name="ud_tinh_trang" class="form-control">${detail.tinh_trang_va_ke_hoach_chi_tiet }</textarea>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kết quả thực hiện</span>
										</div>
										<textarea id="ud_ket_qua" name="ud_ket_qua" class="form-control">${detail.ket_qua_thuc_hien_ke_hoach }</textarea>
									</div>
		
									
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Người phụ trách</span>
										</div>
										<input type="text" class="form-control" id="pic"
											value="${detail.pic_name }">
									</div>
								</div>
							
							</div>
						</c:if>
						<c:if test="${detail.type=='Viễn thông' }">
							<h2 class="text-center mt-3">${detail.name }</h2>
							<div class="row">
								<div class="col-md-5">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Mã dự án</span>
										</div>
										<input type="text" class="form-control" id="id_project"
											value="${detail.id }" disabled>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="khach_hang">Khách
												hàng</label>
										</div>
										<select class="custom-select" id="khach_hang">
											
											
											<c:forEach var="customer" items="${customers}">
												<c:if test="${customer.name == detail.customer }">
													<option value="${customer.id }" selected>${customer.name }
												</c:if>
												<c:if test="${customer.name != detail.customer }">
													<option value="${customer.id }">${customer.name }
												</c:if>
												</option> 
											</c:forEach>
											
										</select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="type">Loại dự án</label>
										</div>
										<select class="custom-select" id="khach_hang">
											
											
											<c:forEach var="type" items="${type}">
												<c:if test="${type.name == detail.type }">
													<option value="${type.id }" selected>${type.name }
												</c:if>
												<c:if test="${type.name != detail.type }">
													<option value="${type.id }">${type.name }
												</c:if>
												</option> 
											</c:forEach>
											
										</select>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Mô tả dự án</span>
										</div>
										<textarea name ="ud_mo_ta_du_an" id="ud_mo_ta_du_an" class="form-control">${detail.description }</textarea>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tổng mức đầu tư</span>
										</div>
										<input type="text" class="form-control" name="ud_tong_muc_dau_tu" id="ud_tong_muc_dau_tu"
											value="${detail.tong_muc_dau_tu_du_kien }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Hình thức đầu tư</span>
										</div>
										<input type="text" class="form-control" name="ud_hinh_thuc_dau_tu" id="ud_hinh_thuc_dau_tu"
											value="${detail.hinh_thuc_dau_tu }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="priority">Priority</label>
										</div>
										<select class="custom-select" id="priority">
											
											<c:forEach var="priority" items="${priorities}">
												<c:if test="${priority.name == detail.priority }">
													<option value="${priority.id }" selected>${priority.name }
												</c:if>
												<c:if test="${priority.name != detail.priority }">
													<option value="${priority.id }">${priority.name }
												</c:if>
												</option> 
											</c:forEach>
										</select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="ud_status">Status</label>
										</div>
										<select class="custom-select" id="ud_status">
											
											<c:forEach var="status" items="${status}">
												<c:if test="${status.name == detail.status }">
													<option value="${status.id }" selected>${status.name }
												</c:if>
												<c:if test="${status.name != detail.status }">
													<option value="${status.id }">${status.name }
												</c:if>
												</option> 
											</c:forEach>
										</select>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Người phụ trách</span>
										</div>
										<input type="text" class="form-control" id="pic"
											value="${detail.pic_name }"> 
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tình trạng kế hoạch</span>
										</div>
										<textarea name="ud_tinh_trang" id="ud_tinh_trang" class="form-control">${detail.tinh_trang_va_ke_hoach_chi_tiet }</textarea>
									</div>
		
								</div>
								<div class="col-md-7">
		
									
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Phân tích SWOT</span>
										</div>
										<textarea name="ud_swot" id="ud_swot" class="form-control">${detail.phan_tich_SWOT }</textarea>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kết quả thực hiện</span>
										</div>
										<textarea name="ud_ket_qua" id="ud_ket_qua" class="form-control">${detail.ket_qua_thuc_hien_ke_hoach }</textarea>
									</div>
		
								</div>
								
							</div>
						</c:if>
						<c:if test="${detail.type=='Chuyển đổi số' }">
							<h2 class="text-center mt-3">${detail.name }</h2>
							<div class="row">
								<div class="col-md-5">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Mã dự án</span>
										</div>
										<input type="text" class="form-control" id="id_project"
											value="${detail.id }" disabled>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="khach_hang">Khách
												hàng</label>
										</div>
										<select class="custom-select" id="khach_hang">
											
											
											<c:forEach var="customer" items="${customers}">
												<c:if test="${customer.name == detail.customer }">
													<option value="${customer.id }" selected>${customer.name }
												</c:if>
												<c:if test="${customer.name != detail.customer }">
													<option value="${customer.id }">${customer.name }
												</c:if>
												</option> 
											</c:forEach>
											
										</select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="type">Loại dự án</label>
										</div>
										<select class="custom-select" id="type">
											
											
											<c:forEach var="type" items="${type}">
												<c:if test="${type.name == detail.type }">
													<option value="${type.id }" selected>${type.name }
												</c:if>
												<c:if test="${type.name != detail.type }">
													<option value="${type.id }">${type.name }
												</c:if>
												</option> 
											</c:forEach>
											
										</select>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Mô tả dự án</span>
										</div>
										<textarea name ="ud_mo_ta_du_an" id="ud_mo_ta_du_an" class="form-control">${detail.description }</textarea>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tổng mức đầu tư</span>
										</div>
										<input type="text" class="form-control" name="ud_tong_muc_dau_tu" id="ud_tong_muc_dau_tu"
											value="${detail.tong_muc_dau_tu_du_kien }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Hình thức đầu tư</span>
										</div>
										<input type="text" class="form-control" name="ud_hinh_thuc_dau_tu" id="ud_hinh_thuc_dau_tu"
											value="${detail.hinh_thuc_dau_tu }">
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="ud_priority">Priority</label>
										</div>
										<select class="custom-select" name="ud_priority" id="ud_priority">
											
											<c:forEach var="priority" items="${priorities}">
												<c:if test="${priority.name == detail.priority }">
													<option value="${priority.id }" selected>${priority.name }
												</c:if>
												<c:if test="${priority.name != detail.priority }">
													<option value="${priority.id }">${priority.name }
												</c:if>
												</option> 
											</c:forEach>
										</select>
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<label class="input-group-text" for="ud_status">Status</label>
										</div>
										<select class="custom-select" name="ud_status" id="ud_status">
											
											<c:forEach var="status" items="${status}">
												<c:if test="${status.name == detail.status }">
													<option value="${status.id }" selected>${status.name }
												</c:if>
												<c:if test="${status.name != detail.status }">
													<option value="${status.id }">${status.name }
												</c:if>
												</option> 
											</c:forEach>
										</select>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Người phụ trách</span>
										</div>
										<input type="text" class="form-control" id="pic"
											value="${detail.pic_name }"> 
									</div>
									
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Tình trạng kế hoạch</span>
										</div>
										<textarea name="ud_tinh_trang" id="ud_tinh_trang" class="form-control">${detail.tinh_trang_va_ke_hoach_chi_tiet }</textarea>
									</div>
		
								</div>
								<div class="col-md-7">
		
									
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Phân tích SWOT</span>
										</div>
										<textarea name="ud_swot" id="ud_swot" class="form-control">${detail.phan_tich_SWOT }</textarea>
									</div>
		
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Kết quả thực hiện</span>
										</div>
										<textarea name="ud_ket_qua" id="ud_ket_qua" class="form-control">${detail.ket_qua_thuc_hien_ke_hoach }</textarea>
									</div>
		
								</div>
								
							</div>
						</c:if>
					</c:forEach>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>

		</section>
	</div>
</body>
</html>