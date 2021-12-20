<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chief | Customer</title>

</head>
<body>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<style>
.item{
    width: 100%;
} 
a:hover {
    color: #000;
}
.nav-tabs{
    border-bottom: 0px;
}
.dropdown-item:active, .nav-tabs .nav-link.active{
    background-color: #007bff !important;
    color: #fff !important;
}
</style>
	<div class="content-wrapper">
		<div class="content-header">

              <!-- /.container-fluid -->
          </div>
          <section class="content">
          	<div class="container-fluid">
          		<div class=" mt-3">
        
        <h2 style="text-align: center;">${customer[0].customer} </h2> 
        
        <!-- Nav tabs -->
        <div class="btn-group btn-group1 ">
            <button type="button" class="btn btn-secondary dropdown-toggle ml-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span id="show">Chọn dự án</span>
            </button>
            <div class="dropdown-menu dropdown-menu-right dropdown1 ">
                <ul class="nav nav-tabs">
                	<c:forEach var="item" items="${customer }" varStatus="index">
                		<c:if test="${ item.type=='Triển khai' && item.pic_role=='ROLE_PM'}">
                			 <c:if test="${index.first }">
                				<li class="nav-item item "><a class="dropdown-item nav-link active" href="#du_an_${index.count}" type="button">
                			</c:if>
                			<c:if test="${not index.first }">
                				<li class="nav-item item "><a class="dropdown-item nav-link " href="#du_an_${index.count}" type="button">
                			</c:if> 
                		
	                			${item.name }</a>
	                		</li>
                    	</c:if>
                    	
                    	<c:if test="${ item.type=='Viễn thông' }"> 
                    		<c:if test="${index.first }">
                				<li class="nav-item item "><a class="dropdown-item nav-link active" href="#du_an_${index.count}" type="button">
                			</c:if>
                			<c:if test="${not index.first }">
                				<li class="nav-item item "><a class="dropdown-item nav-link " href="#du_an_${index.count}" type="button">
                			</c:if>  
                		
	                			${item.name }</a>
	                		</li>
                    	</c:if>
                    	
                    	<c:if test="${ item.type=='Chuyển đổi số' }">
                    		<c:if test="${index.first }">
                				<li class="nav-item item active">
                			</c:if>
                			<c:if test="${not index.first }">
                				<li class="nav-item item ">
                			</c:if> 
                		
	                			<a class="dropdown-item nav-link " href="#du_an_${index.count}" type="button">${item.name }</a>
	                		</li>
                    	</c:if>
                	</c:forEach>
                    
                </ul>
            </div>
        </div>
        <!-- <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="#du_an_1">Dự án 1</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#du_an_2">Dự án 2</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#du_an_3">Dự án 3</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#du_an_4">Dự án 4</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#du_an_5">Dự án 5</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#du_an_6">Dự án 6</a>
            </li>
        </ul> -->

        <!-- Tab panes -->
        <div class="tab-content mb-3">
        	<c:forEach var="item" items="${customer }" varStatus="index">
                		<c:if test="${ item.type=='Triển khai' && item.pic_role=='ROLE_PM'}">
                			 <c:if test="${index.first }">
                			  <div id="du_an_${index.count }" class="container tab-pane active"><br>
                				
                			</c:if>
                			<c:if test="${not index.first }">
                			<div id="du_an_${index.count }" class="container tab-pane fade"><br>
                				
                			</c:if> 
                				 <div>
				                    <p>Người phụ trách: ${item.pic_name}</p>
				                    <p>Tên dự án: <a style="color: #000" href="<c:url value='/chief/detail/${week }/${item.id}' />">${item.name}</a> </p>
				                    <p >Phạm vi cung cấp: <span style="white-space: pre-wrap;">${item.pham_vi_cung_cap }</span></p>
				                    <p>Tổng giá trị: <c:if
													test="${ item.tong_gia_tri_thuc_te !=0}">
													<fmt:formatNumber type="number"
														value="${item.tong_gia_tri_thuc_te }" />
												</c:if></p>
				                    <p>Mức độ ưu tiên: ${item.status }</p>
				                </div>
				                <div class="table-responsive">
				                    <table class="table table-bordered ">
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
				                            <td>${item.DAC }</td>
				                            <td>${item.PAC }</td>
				                            <td>${item.FAC }</td>
				                            <!--Kế hoạch nghiệm thu -->
				                            <td>
				                            	<c:if
													test="${ item.so_tien_tam_ung !=0}">
													<fmt:formatNumber type="number"
														value="${item.so_tien_tam_ung }" />
												</c:if>
				                            </td>
				                            <td>${item.ke_hoach_tam_ung }</td>
				                            <!-- Thanh toán tạm ứng -->
				                            <td>
				                            	<c:if
													test="${ item.so_tien_DAC !=0}">
													<fmt:formatNumber type="number"
														value="${item.so_tien_DAC }" />
												</c:if>
				                            </td>
				                            <td>${item.ke_hoach_thanh_toan_DAC }</td>
				                            <!-- Thanh toán DAC -->
				                            <td>
				                            	<c:if
													test="${ item.so_tien_PAC !=0}">
													<fmt:formatNumber type="number"
														value="${item.so_tien_PAC }" />
												</c:if>
				                            </td>
				                            <td>${item.ke_hoach_thanh_toan_PAC }</td>
				                            <!-- Thanh toán PAC -->
				                            <td>
				                            	<c:if
													test="${ item.so_tien_FAC !=0}">
													<fmt:formatNumber type="number"
														value="${item.so_tien_FAC }" />
												</c:if>
				                            </td>
				                            <td>${item.ke_hoach_thanh_toan_FAC }</td>
				                            <!-- Thanh toán FAC -->
				                        </tbody>
				                    </table>
				                </div>
				                <div class="d-flex">
				                    <div style="width: 70%;">
				                        <p>Tình trạng:</p>
				                        <p> VNPT-IT sửa xong link hóa đơn & gửi lại khách hàng. BCC sửa lại hợp đồng (20/4)=> phòng KHĐT mới chuyển hồ sơ phòng KT.</p>
				                    </div>
				                    <div class="pl-5">
				                        <p>Kết quả thực hiện kế hoạch:</p>
				                        <p> Tiến độ thanh toán DAC và FAC rất chậm</p>
				                    </div>
				                </div>
				           
	                			</div>
	                		
                    	</c:if>
                    	<c:if test="${ item.type=='Viễn thông'}">
                			 <c:if test="${index.first }">
                			  <div id="du_an_${index.count }" class="container tab-pane active"><br>
                				
                			</c:if>
                			<c:if test="${not index.first }">
                			<div id="du_an_${index.count }" class="container tab-pane fade"><br>
                				
                			</c:if> 
                			<div>
                				<p><b>Người phụ trách:</b> ${item.pic_name }</p>
                				<p><b>Tên dự án:</b><a style="color: #000" href="<c:url value='/chief/detail/${week }/${item.id}' />">${item.name}</a></p>
                				<p ><b>Mô tả dự án:</b><span style="white-space: pre-wrap;">${item.description }</span></p>
                				<p><b>Tổng mức đầu tư:</b> 
													${item.tong_muc_dau_tu_du_kien }
												
								</p>
								<p><b>Hình thức đầu tư:</b> ${item.hinh_thuc_dau_tu }</p>
								<p><b>Mức độ ưu tiên:</b> ${item.priority }</p>
								<p><b>Mức độ khả thi:</b> ${item.muc_do_kha_thi }%</p>
								<p ><b>Tình trạng & Kế hoạch chi tiết:</b><span style="white-space: pre-wrap;">${item.tinh_trang_va_ke_hoach_chi_tiet }</span> </p>
                				<p ><b>Phân tích SWOT:</b><span style="white-space: pre-wrap;">${item.phan_tich_SWOT }</span> </p>
                				<p><b>Kết quả thực hiện kế hoạch:</b> <span style="white-space: pre-wrap;"> ${item.ket_qua_thuc_hien_ke_hoach }</span></p>
                			</div>
                		</c:if>
                		
                		<c:if test="${ item.type=='Chuyển đổi số'}">
                			 <c:if test="${index.first }">
                			  <div id="du_an_${index.count }" class="container tab-pane active"><br>
                				
                			</c:if>
                			<c:if test="${not index.first }">
                			<div id="du_an_${index.count }" class="container tab-pane fade"><br>
                				
                			</c:if> 
                			<div>
                				<p><b>Người phụ trách:</b> ${item.pic_name }</p>
                				<p><b>Tên dự án:</b> <a style="color: #000" href="<c:url value='/chief/detail/${week }/${item.id}' />">${item.name}</a></p>
                				<p style="white-space: pre-wrap;"><b>Mô tả dự án:</b><span >${item.description }</span></p>
                				<p><b>Tổng mức đầu tư:</b>  
													${item.tong_muc_dau_tu_du_kien }
												
								</p>
								<p><b>Hình thức đầu tư:</b> ${item.hinh_thuc_dau_tu }</p>
								<p><b>Mức độ ưu tiên:</b> ${item.priority }</p>
								<p><b>Mức độ khả thi:</b> ${item.muc_do_kha_thi }%</p>
								<p ><b>Tình trạng & Kế hoạch chi tiết:</b><span style="white-space: pre-wrap;">${item.tinh_trang_va_ke_hoach_chi_tiet }</span> </p>
                				<p ><b>Phân tích SWOT:</b><span style="white-space: pre-wrap;">${item.phan_tich_SWOT }</span> </p>
                				<p><b>Kết quả thực hiện kế hoạch:</b> <span style="white-space: pre-wrap;"> ${item.ket_qua_thuc_hien_ke_hoach }</span></p>
                			</div>
                		</c:if>
                	</c:forEach>
                
	            </div>
	               
            
        </div> 
        <!-- <p class="act "><b>Active Tab</b>: <span></span></p>
        <p class="prev "><b>Previous Tab</b>: <span></span></p> -->
    </div>
          	</div>
          </section>
	</div>
	<script>
       
        $(document).ready(function() {
            $('.dropdown1 button').click(function(){
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
</html>