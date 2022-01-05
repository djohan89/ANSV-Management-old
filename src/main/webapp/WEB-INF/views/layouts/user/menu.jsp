<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="<c:url value='/user/dashboard/${week}_${year}' />" class="brand-link"> 
		<img src="<c:url value='/assets/user/img/logo/logo_menu.png' />"
			alt="ANSV Logo" class="brand-image img-circle elevation-3"
			style="opacity: .8; width: 33px; height: 33px; background-color: white;">
		<span class="brand-text font-weight-light" style="font-family: 'Lobster'; 
			font-size: 21px;"><b>ANSV Management</b>
		</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-2 pb-1 mb-3 d-flex">
			<ul class="nav nav-list nav-menu-list-style">
                <li>
                	<label class="tree-toggle nav-header" id="display_name">
                		<div class="image">
							<img src="<c:url value='/assets/user/dist/img/user2-160x160.jpg' />"
								class="img-circle elevation-2" alt="User Image">
						</div>
						<div class="info" style="overflow: visible;">
							<a href="javascript:void(0)" class="d-block">
								${display_name}
								<i class="right fas fa-angle-left" id="arrow_icon" style="margin-left: 13px;"></i>
							</a>
						</div>
                	</label>
                    <ul class="nav nav-list tree">
                        <li class="text-white pl-3" style="width: 100%;">
                        	<a href="#">
								<i class="far fa-id-card" style="font-size: 25px;"></i>
	                        	<span class="pl-3">Thông tin cá nhân</span>
							</a>
	                    </li>
	                    <li class="text-white pl-3 mt-1">
                        	<form action="<c:url value="/j_spring_security_logout" />" id="formLogout" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<a href="javascript:void(0)" id="yourLinkId">
	                        		<i class="fas fa-sign-out-alt" style="font-size: 25px;"></i>
		                        	<span class="pl-3">Đăng xuất</span>
								</a>
							</form>
	                    </li>
                    </ul>
                </li>
            </ul>
		</div>

		<!-- SidebarSearch Form -->
		<!-- <div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div> -->

		<!-- Sidebar Menu -->
		
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>