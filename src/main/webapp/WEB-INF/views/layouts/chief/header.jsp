<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/taglib.jsp"%>

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
			href="#" role="button"><i class="fas fa-bars"></i></a></li>
		<li class="nav-item d-none d-sm-inline-block"><a
			href="index3.html" class="nav-link">Trang chủ</a></li>
		<li class="nav-item d-none d-sm-inline-block"><a href="#"
			class="nav-link">Liên hệ</a></li>
		<li class="nav-item d-none d-sm-inline-block">
			<form action="<c:url value="/j_spring_security_logout" />" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button type="submit" class="btn btn-secondary btn-fill" style="font-size: 20px;">
					<i class="fa fa-sign-out" style="font-weight: bold;"></i><b> Log out</b>
				</button>
			</form>
		</li>
	</ul>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<!-- Navbar Search -->
		<li class="nav-item"><a class="nav-link"
			data-widget="navbar-search" href="#" role="button"> <i
				class="fas fa-search"></i>
		</a>
			<div class="navbar-search-block">
				<form class="form-inline">
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
							<button class="btn btn-navbar" type="button"
								data-widget="navbar-search">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>
			
			
			
		<li class="nav-item dropdown">
			<a class="nav-link thong-ke" data-toggle="dropdown" href="#"> <!-- Class 'thong-ke' không có thuộc tính -->
				<b>Thống kê</b>
				<i class="fas fa-angle-left"></i>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right not-close" style="min-width: 650px;">
			
				<c:forEach items="${ project_types }" var="types" varStatus="type_status">
				
					<c:forEach items="${ statistics }" var="statistics" varStatus="statistics_status">
						<c:if test="${theCount.index <= 3}"></c:if>
					</c:forEach>
				
					<div class="dropdown-item">
						<div class="row">
							<div class="col-md-5">Báo cáo - ${ types.name } (tuần ...)</div>
							
							<c:url value="${ 0 + type_status.index * 10 }" var="position"/> <!-- Tạo biến đánh số vị trí trong mảng thống kê -->
							
							<div class="col-2">
								<span class="badge badge-danger right badge-statistics">${ statistics[position] }</span>
	                   			<span class="badge badge-warning right badge-statistics">${ statistics[position + 1] }</span>
	                   			<span class="badge badge-success right badge-statistics">${ statistics[position + 2] }</span>
							</div>
							<div class="col-2">
								<span class="badge badge-danger right badge-statistics">${ statistics[position + 3] }</span>
	                   			<span class="badge badge-warning right badge-statistics">${ statistics[position + 4] }</span>
	                   			<span class="badge badge-success right badge-statistics">${ statistics[position + 5] }</span>
							</div>
							<div class="col-2">
								<span class="badge badge-danger right badge-statistics">${ statistics[position + 6] }</span>
	                   			<span class="badge badge-warning right badge-statistics">${ statistics[position + 7] }</span>
	                   			<span class="badge badge-success right badge-statistics">${ statistics[position + 8] }</span>
							</div>
							<div class="col-1 pl-3">
								<span class="badge badge-primary right badge-statistics">${ statistics[position + 9] }</span>
							</div>
							
						</div>
					</div>
					<div class="dropdown-divider"></div>
				</c:forEach>
			
				<%-- <div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Báo cáo triển khai (tuần ...) ${ statistics.size() }</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">${ statistics[0] }</span>
                   			<span class="badge badge-warning right">${ statistics[1] }</span>
                   			<span class="badge badge-danger right">${ statistics[2] }</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="margin-left: -2%;">
							<span class="badge badge-success right">${ statistics[3] }</span>
                   			<span class="badge badge-warning right">${ statistics[4] }</span>
                   			<span class="badge badge-danger right">${ statistics[5] }</span>
						</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">${ statistics[6] }</span>
                   			<span class="badge badge-warning right">${ statistics[7] }</span>
                   			<span class="badge badge-danger right">${ statistics[8] }</span>
						</div>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Báo cáo viễn thông (tuần ...)</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">${ statistics[9] }</span>
                   			<span class="badge badge-warning right">${ statistics[10] }</span>
                   			<span class="badge badge-danger right">${ statistics[11] }</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="margin-left: -2%;">
							<span class="badge badge-success right">${ statistics[12] }</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Báo cáo chuyển đổi số (tuần ...)</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="margin-left: -2%;">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
					</div>
				</div> --%>
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Ưu tiên</div>
						<div class="col-md-2" style="padding-left: 5.2%;">Cao</div>
						<div class="col-md-2" style="padding-left: 4.2%;">Trung</div>
						<div class="col-md-2" style="padding-left: 4.6%;">Thấp</div>
						<div class="col-md-1">Done</div>
					</div>
				</div>
			</div>
		</li>
			
			

		<!-- Messages Dropdown Menu -->
		<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#">
				<i class="far fa-comments"></i>
				<span class="badge badge-danger navbar-badge">3</span>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="<c:url value='/assets/user/dist/img/user1-128x128.jpg' />"
							alt="User Avatar" class="img-size-50 mr-3 img-circle">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Brad Diesel 
								<span class="float-right text-sm text-danger">
									<i class="fas fa-star"></i>
								</span>
							</h3>
							<p class="text-sm">Call me whenever you can...</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="<c:url value='/assets/user/dist/img/user8-128x128.jpg' />"
							alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								John Pierce 
								<span class="float-right text-sm text-muted">
									<i class="fas fa-star"></i>
								</span>
							</h3>
							<p class="text-sm">I got your message bro</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img
							src="<c:url value='/assets/user/dist/img/user3-128x128.jpg' />"
							alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Nora Silvester <span class="float-right text-sm text-warning"><i
									class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">The subject goes here</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Messages</a>
			</div></li>
		<!-- Notifications Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link"
			data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
				class="badge badge-warning navbar-badge">15</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header">15 Notifications</span>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i
					class="fas fa-envelope mr-2"></i> 4 new messages <span
					class="float-right text-muted text-sm">3 mins</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i>
					8 friend requests <span class="float-right text-muted text-sm">12
						hours</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
					3 new reports <span class="float-right text-muted text-sm">2
						days</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All
					Notifications</a>
			</div></li>
			
			
			
		<li class="nav-item dropdown">
			<a class="nav-link thong-ke" data-toggle="dropdown" href="#"> <!-- Class 'thong-ke' không có thuộc tính -->
				<b>Tiện ích</b>
				<i class="fas fa-angle-left"></i>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right not-close" style="max-width: 800px; min-width: 600px;">
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Báo cáo triển khai (tuần ...)</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="margin-left: -2%;">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Báo cáo viễn thông (tuần ...)</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="margin-left: -2%;">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Báo cáo chuyển đổi số (tuần ...)</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="margin-left: -2%;">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
						<div class="col-md-2 pl-4">
							<span class="badge badge-success right">23</span>
                   			<span class="badge badge-warning right">34</span>
                   			<span class="badge badge-danger right">45</span>
						</div>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<div class="dropdown-item">
					<div class="row">
						<div class="col-md-5">Ưu tiên</div>
						<div class="col-md-2" style="padding-left: 8.2%;">Cao</div>
						<div class="col-md-1"></div>
						<div class="col-md-2" style="padding-left: 2.3%;">Trung</div>
						<div class="col-md-2" style="padding-left: 5.5%;">Thấp</div>
					</div>
				</div>
			</div>
		</li>
			
			
			
		<li class="nav-item"><a class="nav-link" data-widget="fullscreen"
			href="#" role="button"> <i class="fas fa-expand-arrows-alt"></i>
		</a></li>
		<%-- <li class="nav-item"><a class="nav-link"
			data-widget="control-sidebar" data-slide="true" href="#"
			role="button"> <i class="fas fa-th-large"></i>
		</a></li> --%>
	</ul>
</nav>