<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link"> <img
		src="<c:url value='/assets/user/dist/img/AdminLTELogo.png' />"
		alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
		style="opacity: .8"> <span class="brand-text font-weight-light">AdminLTE
			3</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="<c:url value='/assets/user/dist/img/user2-160x160.jpg' />"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">CEO | Thành Lê</a>
			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column nav-flat"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
              with font-awesome or any other icon font library -->
				<li class="nav-header">Báo cáo</li>
				<li class="nav-item menu-open"><a href="#"
					class="nav-link active"> <i class="nav-icon fas fa-table"></i>
						<p>
							Báo cáo 1 <i class="right fas fa-angle-left"></i> <span
								class="badge badge-info right">23</span>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="./index.html"
							class="nav-link active"> <i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									VNPT Tỉnh,thành phố <span class="badge badge-pill badge-danger">0</span>
									/ <b>2</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="./index2.html" class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p style="font-size: 13px;">
									VNPT Net <span class="badge badge-pill badge-danger">2</span> /
									<b>6</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="./index3.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									VNPT IT <span class="badge badge-pill badge-danger">0</span> /
									<b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="./index3.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									MOBIFONE <span class="badge badge-pill badge-danger">2</span> /
									<b>9</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="./index3.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									Thị trường doanh nghiệp <span
										class="badge badge-pill badge-danger">0</span> / <b>5</b>
								</p>
						</a></li>
					</ul></li>

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-table"></i>
						<p>
							Báo cáo 2 <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">34</span>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="pages/layout/top-nav.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									VNPT TỈNH/TP <span class="badge badge-pill badge-danger">0</span>
									/ <b>3</b>
								</p>
						</a></li>
						<li class="nav-item"><a
							href="pages/layout/top-nav-sidebar.html" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									VNPT Net <span class="badge badge-pill badge-danger">4</span> /
									<b>10</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/layout/boxed.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									MOBIFONE <span class="badge badge-pill badge-danger">5</span> /
									<b>10</b>
								</p>
						</a></li>
						<li class="nav-item"><a
							href="pages/layout/fixed-sidebar.html" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									VNPT Media <span class="badge badge-pill badge-danger">3</span>
									/ <b>5</b>
								</p>
						</a></li>
						<li class="nav-item"><a
							href="pages/layout/fixed-sidebar-custom.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									VNPT IT <span class="badge badge-pill badge-danger">1</span> /
									<b>2</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/layout/fixed-topnav.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									CMC Telecom <span class="badge badge-pill badge-danger">2</span>
									/ <b>3</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/layout/fixed-footer.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									Thales <span class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a
							href="pages/layout/collapsed-sidebar.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p style="font-size: 13px;">
									TTX Việt Nam <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-table"></i>
						<p>
							Báo cáo 3 <i class="right fas fa-angle-left"></i> <span
								class="badge badge-info right">31</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="pages/charts/chartjs.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									HỒ CHÍ MINH (A. Tú phụ trách) <span
										class="badge badge-pill badge-danger">1</span> / <b>4</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/flot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									CÁC DỰ ÁN ANH KHANH, A ĐOÀN TUẤN PHỤ TRÁCH - VNPT IT <span
										class="badge badge-pill badge-danger">1</span> / <b>7</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/inline.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									VINAPHONE <span class="badge badge-pill badge-danger">1</span>
									/ <b>4</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Hồ Chí Minh <span class="badge badge-pill badge-danger">0</span>
									/ <b>4</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Bộ Công An <span class="badge badge-pill badge-danger">0</span>
									/ <b>4</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Bộ KH&CN <span class="badge badge-pill badge-danger">0</span> /
									<b>2</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									VNPT TTP/ Sở ban ngành các tỉnh <span
										class="badge badge-pill badge-danger">0</span> / <b>4</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									BẢO HIỂM VIỆT NAM <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									ACB <span class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-header">Người phụ trách</li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Lê Tuấn Cảnh <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">2</span>
						</p>
				</a>
					<ul class="nav nav-treeview " style="font-size: 13px;">
						<li class="nav-item"><a href="pages/mailbox/mailbox.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Dự án 1(VNPT Tỉnh, thành phố) <span
										class="badge badge-pill badge-danger">0</span> / <b>9</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/mailbox/compose.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Dự án 2(VNPT Tỉnh, thành phố) <span
										class="badge badge-pill badge-danger">0</span> / <b>2</b>
								</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Hoàng Anh <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">4</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="pages/examples/invoice.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									HĐ 01-NET2 <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/examples/profile.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									HĐ01 - Atenna với MLMN <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/examples/e-commerce.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									HĐ02 - Atenna với MLMN <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/examples/projects.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									HĐ05 - Atenna với MLMN (MSTT) <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Thành Nam <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">1</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									HĐ 04-NET1 <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Nguyễn Ngọc Minh <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">3</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									GPON - DOT 1 <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									GPON - DOT 2 <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									GPON 40 TRẠM (ĐTRR) <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Nguyễn Anh Tuấn <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">1</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									GPON - DOT 3 <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Hoài Nam <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">2</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Dự án CSDLQG <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xử lý nước thải Đà Nẵng <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Tuấn Anh <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">7</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="pages/search/simple.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									MSTT thiết bị ONT 040H <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/search/enhanced.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									MSTT thiết bị STB AndroidTV <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/search/enhanced.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									MSTT trang bị thiết bị OLT-GPON năm 2021 cho các VNPT
									Tỉnh,thành phố <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/search/enhanced.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									OLT ứng cứu 2021 vùng 62 TTP <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/search/enhanced.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Trang bị bổ sung thiết bị phục vụ dịch chuyển node mạng <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/search/enhanced.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Mua sắm ONT theo hợp đồng khung ANSV-CMC PO02-PO05 <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="pages/search/enhanced.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>
									Mua sắm ONT theo hợp đồng khung ANSV-CMC Các PO tới hết 2021 <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>

					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Trần Tuấn Anh <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">1</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Thử nghiệm thiết bị Battery ReGeneration của GoldenPlus <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Lê Trường Giang <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">6</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Backbone 2021 <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trang bị OLT 4 PON <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Hệ thống Firewall cho mạng ĐHSXKD của VNPT-Net <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									MSTT mở rộng hệ thống Digital Cloud năm 2021 <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									MSTT mở rộng hệ thống CDN, MiddleWare VMP cung cấp dịch vụ MyTV
									và DigiLife <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Mở rộng hệ thống truyền dẫn CVCS tới Tân Thuận <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Hoàng Bảo Trung <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">10</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Dự Án anten năm 2021 của VNPT NET <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									OCS <span class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Mua sắm trang bị anten twinbeam phục vụ triển khai bổ sung
									Sector cho các trạm 4G lưu lượng cao <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Thỏa thuận khung MSTT Anten <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Mua sắm 50 bộ anten highgain phục vụ mạng lưới Miền Trung <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trang bị 4 bộ Load Balancer <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Thử nghiệm thiết bị Viba của hãng SLAE <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trang bị thiết bị an toàn bảo mật <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									IP to DVB -T2 <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Nâng cao ATBM hạ tầng mạng SXKD tại IDC NTL <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Trần Xuân Hiếu <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">8</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Mở rộng hệ thông NPB <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trang bị hệ thống SBC <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Hỗ trợ kỹ thuật hệ thống IN(cũ) <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Hệ thống bảo mật cho hệ thống báo hiệu quốc tế mạng MobiFone <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Hệ thống International SMPPGW phục vụ kinh doanh SMS Quốc
									tế(A2P, Transit ) <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng hệ thống quản lý nhân sự HRM <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Cung cấp lắp đặt thiết bị bảo mật <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Tăng cường năng lực kết nối hạ tầng mạng IDC và phục vụ khách
									hàng <span class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Tích hợp tính năng Chat trên Zalo với hệ thống IPCC <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Phan Quang Tùng <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">1</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Hệ thống tổng đài,điện thoại, switch cho dự án đường sắt trên
									cao tuyến Nhổn- Ga Hà nội <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Nguyễn Quốc Bình <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">4</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									IOC VNPT Vĩnh Phúc <span class="badge badge-pill badge-danger">0</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Danh mục CNTT đã được duyệt của Bộ KHCN <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									DA về toàn bộ lĩnh vực CNTT khách hàng bộ Khoa học và CN <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trung tâm bảo hành thông tin thông minh UBND tỉnh Vĩnh Phúc <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Trần Phong Ái Tú <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">4</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Lắp đặt hệ thống camera an ninh quan sát các tuyến cửa ngõ ra
									vào Quận 4 và Trung tâm Bồi dưỡng chính trị quận <span
										class="badge badge-pill badge-danger">1</span>/<b>1</b>

								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Cung cấp thiết bị đầu cuối IAD <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Dự án trang bị IOC và camera giám sát an ninh cho Q5 TPHCM <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Dự án trang bị IOC và camera giám sát an ninh cho Q7 TPHCM <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Đoàn Anh Tuấn <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">20</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trung tâm Giám sát và chỉ đạo điều hành tập trung trên nền tảng
									dữ liệu dân cư <span class="badge badge-pill badge-danger">1</span>
									/ <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Cơ sở dữ liệu Công chức Viên chức Bộ Nội vụ <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Lưu trữ tài liệu điện tử Phông lưu trữ nhà nước Việt Nam <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng trung tâm điều hành Bộ khoa học công nghệ <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng cổng dịch vụ công thành phố, hệ thống thông tin một
									cửa điện tử thành phố và hệ thống đánh giá sự hài lòng của
									người dân, doanh nghiệp <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng trung tâm điều hành thông minh và chuyển đổi kho lưu
									trữ cho VP đăng ký đất đai TP <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Thuê dịch vụ công nghệ thông tin thực hiện Hải quan số <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trung tâm Giám sát và chỉ đạo điều hành Bộ Thông tin truyền
									thông <span class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trung tâm Giám sát và chỉ đạo điều hành Bộ Xây dựng <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Thuê dịch vụ công nghệ thông tin hosting các hệ thống của Cổng
									thông tin điện tử Chính phủ <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng nền tảng trao đổi định danh và xác thực điện tử IDEx <span
										class="badge badge-pill badge-danger">1</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Triển khai mở rộng các lĩnh vực tiếp nhận và xử lý thông tin
									của các lĩnh vực thông qua cổng thông tin 1022; và kết nối,
									tích hợp các cổng thông tin, các ứng dụng của sở ngành <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Triển khai các thủ tục đầu tư dự án “Xây dựng Trung tâm tiếp
									nhận và xử lý thông tin khẩn cấp của thành phố Hồ Chí Minh
									thông qua một đầu số viễn thông duy nhất giai đoạn <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng Trung tâm điều hành ĐTTM <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng Trung tâm dữ liệu dùng chung, phục vụ cho việc kết
									nối, chia sẻ dữ liệu camera <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Nâng cấp trung tâm chỉ huy và lắp đặt hệ thống camera giám sát
									tại phòng Cảnh sát giao thông, Công an thành phố Hà Nội <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Nâng cấp trung tâm chỉ huy và lắp đặt hệ thống camera giám sát
									tại phòng Cảnh sát giao thông đường bộ - đường sát, Công an
									thành phố Hồ Chí Minh <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									IDP Bộ Công An (chưa có tên chính xác) <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Xây dựng trung tâm điều hành thông minh của Sở TTTT <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Quan Trắc môi trường Bình Dương <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-user"></i>
						<p>
							Vũ Duy Tùng <i class="fas fa-angle-left right"></i> <span
								class="badge badge-info right">3</span>
						</p>
				</a>
					<ul class="nav nav-treeview" style="font-size: 13px;">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Dự án trang bị Wi-Fi Quận 8, TP HCM <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trang bị Camera cho VNPT Thái Nguyên <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Trung tâm điều hành Bảo Hiểm XHVN <span
										class="badge badge-pill badge-danger">0</span> / <b>1</b>
								</p>
						</a></li>
					</ul></li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>