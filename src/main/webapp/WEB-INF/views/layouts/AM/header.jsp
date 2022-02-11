<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" data-widget="pushmenu" href="#" role="button">
				<i class="fas fa-bars"></i>
			</a>
		</li>
		<li class="nav-item" style="width: 300px; padding-top: 7px;">
			<font color="orange" style="font-size: 18px; padding-top: 1px">
    			<b>Tuần / Năm:</b>
    		</font>
    		<%-- <select id="select_week" onchange="location = this.value;" class="w-25"></select> --%>
    		<select id="select_week" class="w-25"></select>
    		<label class="ml-1 h5" style="margin-right: -8px;">/</label>
    		<select id="select_year" class="w-25"></select>
		</li>
	</ul>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<li class="nav-item"><a class="nav-link" data-widget="fullscreen"
			href="#" role="button"> <i class="fas fa-expand-arrows-alt"></i>
		</a></li>
	</ul>
</nav>