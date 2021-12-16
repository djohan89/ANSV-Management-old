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
        <h2 style="text-align: center;">VNPT Tỉnh, thành phố </h2>
        
        <!-- Nav tabs -->
        <div class="btn-group btn-group1 ">
            <button type="button" class="btn btn-secondary dropdown-toggle ml-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span id="show">Chọn dự án</span>
            </button>
            <div class="dropdown-menu dropdown-menu-right dropdown1 ">
                <ul class="nav nav-tabs">
                    <li class="nav-item item"><a class="dropdown-item nav-link active" href="#du_an_1" type="button">HĐ 01-NET2</a></li>
                    <li class="nav-item item"><a class="dropdown-item nav-link " href="#du_an_2" type="button">HĐ 04-NET1</a></li>
                    <li class="nav-item item"><a class="dropdown-item nav-link " href="#du_an_3" type="button">GPON - DOT 1</a></li>
                    <li class="nav-item item"><a class="dropdown-item nav-link " href="#du_an_4" type="button">GPON - DOT 2</a></li>
                    <li class="nav-item item"><a class="dropdown-item nav-link " href="#du_an_5" type="button">GPON - DOT 3</a></li>
                    <li class="nav-item item"><a class="dropdown-item nav-link " href="#du_an_6" type="button">HTKT Truyền dẫn 2020</a></li>
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
            <div id="du_an_1" class="container tab-pane active"><br>
                <div>
                    <p>Người phụ trách: Hoàng Anh</p>
                    <p>Tên dự án: HĐ 01-NET2</p>
                    <p>Phạm vi cung cấp: Vật tư di động và dây nhảy quang</p>
                    <p>Tổng giá trị: 2,716,736,900đ</p>
                    <p>Mức độ ưu tiên: High</p>
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
                            <td></td>
                            <td></td>
                            <td></td>
                            <!--Kế hoạch nghiệm thu -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán tạm ứng -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán DAC -->
                            <td>2,119,054,782đ</td>
                            <td>12/16/2020</td>
                            <!-- Thanh toán PAC -->
                            <td>597,682,118đ</td>
                            <td>2/28/2021</td>
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
            <div id="du_an_2" class="container tab-pane fade"><br>
                <div>
                    <p>Người phụ trách: Thành Nam</p>
                    <p>Tên dự án: HĐ 04-NET1</p>
                    <p>Phạm vi cung cấp: Vật tư di động và dây nhảy quang</p>
                    <p>Tổng giá trị: 344,911,400đ</p>
                    <p>Mức độ ưu tiên:</p>
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
                            <td>4/27/2021</td>
                            <td></td>
                            <td></td>
                            <!--Kế hoạch nghiệm thu -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán tạm ứng -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán DAC -->
                            <td>2,119,054,782đ</td>
                            <td>12/16/2020</td>
                            <!-- Thanh toán PAC -->
                            <td>597,682,118đ</td>
                            <td>2/28/2021</td>
                            <!-- Thanh toán FAC -->
                        </tbody>
                    </table>
                </div>
                <div class="d-flex">
                    <div style="width: 70%;">
                        <p>Tình trạng:</p>
                        <p> Dự kiến 27/04 hàng về đến cảng -> Khả năng sẽ giao hàng chậm do hàng về chậm và trùng lễ.</p>
                    </div>
                    <div class="pl-5">
                        <p>Kết quả thực hiện kế hoạch:</p>
                        <p> </p>
                    </div>
                </div>
            </div>
            <div id="du_an_3" class="container tab-pane fade"><br>
                <div>
                    <p>Người phụ trách: Nguyễn Ngọc Minh</p>
                    <p>Tên dự án: GPON - DOT 1</p>
                    <p>Phạm vi cung cấp: </p>
                    <p>Tổng giá trị: 61,528,804,332đ</p>
                    <p>Mức độ ưu tiên:</p>
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
                            <td></td>
                            <td></td>
                            <td>5/31/2021</td>
                            <!--Kế hoạch nghiệm thu -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán tạm ứng -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán DAC -->
                            <td>16,868,576,238đ</td>
                            <td>5/30/2021</td>
                            <!-- Thanh toán PAC -->
                            <td>16,710,633,535đ</td>
                            <td>7/30/2021</td>
                            <!-- Thanh toán FAC -->
                        </tbody>
                    </table>
                </div>
                <div class="d-flex">
                    <div style="width: 70%;">
                        <p>Tình trạng:</p>
                        <p>26/4 hoàn thành chạy thử hệ thống. Dự kiến 15/5 hoàn thành hồ sơ chạy thử và trình FAC lên BQLDA NET </p>
                    </div>
                    <div class="pl-5">
                        <p>Kết quả thực hiện kế hoạch:</p>
                        <p>Tiến độ nghiệm thu FAC chậm DO đã điều chỉnh kế hoạch từ 26/4/21 thành 31/5/21. Tiến độ thanh toán PAC sẽ chậm DO điều chỉnh kế hoạch trong tháng 5/2021 (NET đã đăng ký vốn tháng 5). </p>
                    </div>
                </div>
            </div>
            <div id="du_an_4" class="container tab-pane fade"><br>
                <div>
                    <p>Người phụ trách: Nguyễn Ngọc Minh</p>
                    <p>Tên dự án: GPON - DOT 2</p>
                    <p>Phạm vi cung cấp: </p>
                    <p>Tổng giá trị: 55,702,111,783đ</p>
                    <p>Mức độ ưu tiên: High</p>
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
                            <td></td>
                            <td>5/29/2021</td>
                            <td>7/29/2021</td>
                            <!--Kế hoạch nghiệm thu -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán tạm ứng -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán DAC -->
                            <td>16,868,576,238đ</td>
                            <td>5/30/2021</td>
                            <!-- Thanh toán PAC -->
                            <td>16,710,633,535đ</td>
                            <td>7/30/2021</td>
                            <!-- Thanh toán FAC -->
                        </tbody>
                    </table>
                </div>
                <div class="d-flex">
                    <div style="width: 70%;">
                        <p>Tình trạng:</p>
                        <p>PAC+FAC bị chậm: TGĐ NET yêu cầu đưa toàn bộ thiết bị bao gồm cả sfp lên online trên hệ thống và đúng vị trí đăng ký lắp đặt. 25/3 NET đã gửi văn bản sang Ban công nghệ để push các tỉnh. Ban Công Nghệ đã đồng ý việc thiết bị không
                            cần quản lý online trên hệ thống, đang trao đổi với ban KHĐT để thống nhất. Hiện tại tổng số thiết bị chính online 94%, tuy nhiên số lượng SFP PON chỉ online 52% chủ yếu ở HN, HCM 2600 SFP. 5 Tỉnh VPC QBH HCM HNI KHA còn số
                            lượng thiết bị sfp offline nhiều, Ban KT đã gửi mail cho TPĐT và PGĐ tỉnh. </p>
                    </div>
                    <div class="pl-5">
                        <p>Kết quả thực hiện kế hoạch:</p>
                        <p>Tiến độ online thiết bị rất chậm => tiến độ nghiệm thu PAC, FAC bị chậm DO đã điều chỉnh kế hoạch nghiệm thu PAC từ 29/4/21 thành 29/5/21 và FAC từ 15/6/21 thành 29/7/21. </p>
                    </div>
                </div>
            </div>
            <div id="du_an_5" class=" container tab-pane fade "><br>
                <div>
                    <p>Người phụ trách: Nguyễn Anh Tuấn</p>
                    <p>Tên dự án: GPON - DOT 3</p>
                    <p>Phạm vi cung cấp: </p>
                    <p>Tổng giá trị: 22,361,832,768đ</p>
                    <p>Mức độ ưu tiên:</p>
                </div>
                <div class="table-responsive ">
                    <table class="table table-bordered  ">
                        <thead>
                            <tr>
                                <th colspan="3 ">Kế hoạch nghiệm thu</th>
                                <th colspan="2 ">Thanh toán tạm ứng</th>
                                <th colspan="2 ">Thanh toán DAC</th>
                                <th colspan="2 ">Thanh toán PAC</th>
                                <th colspan="2 ">Thanh toán FAC</th>
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
                            <td></td>
                            <td></td>
                            <td></td>
                            <!--Kế hoạch nghiệm thu -->
                            <td>2,032,893,888đ</td>
                            <td>4/26/2021</td>
                            <!-- Thanh toán tạm ứng -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán DAC -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán PAC -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán FAC -->
                        </tbody>
                    </table>
                </div>
                <div class="d-flex ">
                    <div style="width: 70%; ">
                        <p>Tình trạng:</p>
                        <p>Đã hoàn thành bàn giao toàn bộ hàng hóa, chuẩn bị HS nghiệm thu theo tiến độ HĐ.</p>
                    </div>
                    <div class="pl-5 ">
                        <p>Kết quả thực hiện kế hoạch:</p>
                        <p> Tiến độ tạm ứng bị chậm DO điều chỉnh kế hoạch tuần 1-tháng 5/2021. </p>
                    </div>
                </div>
            </div>
            <div id="du_an_6" class=" container tab-pane fade "><br>
                <div>
                    <p>Người phụ trách: </p>
                    <p>Tên dự án: HTKT Truyền dẫn 2020</p>
                    <p>Phạm vi cung cấp: </p>
                    <p>Tổng giá trị: 5,457,670,000</p>
                    <p>Mức độ ưu tiên:</p>
                </div>
                <div class="table-responsive ">
                    <table class="table table-bordered  ">
                        <thead>
                            <tr>
                                <th colspan="3 ">Kế hoạch nghiệm thu</th>
                                <th colspan="2 ">Thanh toán tạm ứng</th>
                                <th colspan="2 ">Thanh toán DAC</th>
                                <th colspan="2 ">Thanh toán PAC</th>
                                <th colspan="2 ">Thanh toán FAC</th>
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
                            <td></td>
                            <td></td>
                            <td></td>
                            <!--Kế hoạch nghiệm thu -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán tạm ứng -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán DAC -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán PAC -->
                            <td></td>
                            <td></td>
                            <!-- Thanh toán FAC -->
                        </tbody>
                    </table>
                </div>
                <div class="d-flex ">
                    <div style="width: 70%; ">
                        <p>Tình trạng:</p>
                        <p>Đang tiến hành Nghiệm thu tại NET 2 và Ban KTM cho Lần 01. 5 card lỗi nhận của NET chưa chuyển được cho NOKIA sửa => Đang làm PO bổ sung, Nokia VN sẽ tiến hành gửi nhận card.</p>
                    </div>
                    <div class="pl-5 ">
                        <p>Kết quả thực hiện kế hoạch:</p>
                        <p> </p>
                    </div>
                </div>
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