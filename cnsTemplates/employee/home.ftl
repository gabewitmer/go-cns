<!DOCTYPE html>
<html>
	<head>
		<#include "../stubs/header.ftl"/>
		<title>Home</title>
	</head>
	<body>
		<#include "../stubs/secure-navbar-employee.ftl"/>
		<div class="container text-center">
			<#include "../stubs/alerts.ftl"/>
			<div>
				<img src="/static/img/cns-logo-lg.png" alt="CNS Truck Licensing Logo"/>
			</div>
			<br/>
			<div class="col-lg-offset-2 col-lg-8">
				<h3>
					<div class="col-lg-4">
						<div class="mute-contents">
							<a href="/employee/company">
								<i class="fa fa-4x fa-building-o logo-primary"></i>
								<br/><br/>
								Company
							</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="mute-contents">
							<a href="/employee/driver">
								<i class="fa fa-4x fa-male logo-primary"></i>
								<br/><br/>
								Driver
							</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="mute-contents">
							<a href="/employee/vehicle">
								<i class="fa fa-4x fa-truck logo-primary"></i>
								<br/><br/>
								Vehicle
							</a>
						</div>
					</div>
					<#--<div class="col-lg-4">-->
						<#--<div class="mute-contents">-->
							<#--<a href="/employee/task">-->
								<#--<i class="fa fa-4x fa-calendar logo-primary"></i>-->
								<#--<br/><br/>-->
								<#--Calendar-->
							<#--</a>-->
						<#--</div>-->
					<#--</div>-->
				</h3>
			</div>
		</div>
		<#include "../stubs/scripts.ftl"/>
	</body>
</html>