<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="javascript:void(0)" class="brand-link"> 
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
                        <li>
	                        <i class="far fa-id-card" style="color: white; font-size: 25px;"></i>
	                        <span style="margin-top: 5px;">Thông tin cá nhân</span>
	                    </li>
                    </ul>
                </li>
            </ul>
		</div>
		
		<%-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="<c:url value='/assets/user/dist/img/user2-160x160.jpg' />"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="javascript:void(0)" id="display_name" class="d-block">${display_name}</a>
			</div>
		</div> --%>

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
				
				<li class="nav-header">Báo cáo</li>
				<c:if test="${ not empty project_types }">
					<c:forEach var="item" items="${project_types}" varStatus="index">
						<li class="nav-item menu-click"> <!-- class 'menu-click' không có thuộc tính -->
							<a href="#" class="nav-link">
								<i class="nav-icon fas fa-clipboard-list"></i>
								<%-- <p>
									${item.name} <i class="right fas fa-angle-left"></i>
								</p> --%>
								<p>
	                                ${item.name}
	                                <i class="right fas fa-angle-left"></i>
	                                <span class="badge badge-info right">${item.number}</span>
	                            </p>
							</a>
							<ul class="nav nav-treeview">
							
								<c:forEach var="customers" items="${customers}" varStatus="index_type">
								
									<c:if test="${ customers.project_type == item.name }">
										<li class="nav-item">
			                                <a href="<c:url value='/chief/customer_detail/${week}/${item.id }/${customers.customer_id}' />" class="nav-link">
			                                    <i class="far fa-circle nav-icon"></i>
			                                    <span style="font-size: 14px;">${ customers.customer }</span>
			                                    <span class="badge badge-info right">${ customers.number }</span>
			                                </a>
			                            </li>
									</c:if>
								
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${ empty project_types }">
					<p align="center" style="color: white; margin-bottom: 0;">===== Empty =====</p>
				</c:if>
				
				<li class="nav-header">PIC</li>
				
				<c:forEach var="pic" items="${ pic }" varStatus="index_pic">
					<li class="nav-item menu-click"> <!-- class 'menu-click' không có thuộc tính -->
						<a href="#" class="nav-link">
							<i class="nav-icon fas fa-user"></i>
							<p>
								${ pic.display_name }
								<i class="right fas fa-angle-left"></i>
	                           	<span class="badge badge-info right">${ pic.number }</span>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<c:forEach var="project" items="${ menu_project }" varStatus="index_project">
								<c:if test="${ project.pic == pic.pic_id }">
									<li class="nav-item">
										<a href="<c:url value='/chief/detail/${project.week }/${project.id }' />" class="nav-link">
											<i class="far fa-circle nav-icon"></i><p>${ project.name }</p>
										</a>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
				<c:if test="${ empty pic }">
					<p align="center" style="color: white; margin-bottom: 0;">===== Empty =====</p>
				</c:if>
				
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>