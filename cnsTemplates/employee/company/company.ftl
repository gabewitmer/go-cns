<html>
	<head>
		<#include "../../stubs/header.ftl"/>
		<title>Company</title>
	</head>
	<body>
		<#include "../../stubs/secure-navbar-employee.ftl"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<#include "../../stubs/alerts.ftl"/>
				</div>

				<!-- BREADCRUMB NAVIGATION -->
				<div class="col-lg-12">
					<ol class="breadcrumb">
						<li>
							<a href="/">Home</a>
						</li>
						<li class="active">
							${(company??)?string('<a href="/employee/company">Companies</a>','Companies')!}
						</li>
						${(company??)?string('<li class="active">${(company.name)!}</li>','')!}
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">Company</div>
						<div class="panel-body">
							<form class="form-horizontal" action="/employee/company" method="post">
								<div class="form-group">
									<label class="control-label col-lg-4">Name</label>
									<div class="col-lg-8">
										<input type="text" name="name" class="form-control" value="${(company.name)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Street</label>
									<div class="col-lg-8">
										<input type="text" name="street" class="form-control" value="${(company.street)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">City</label>
									<div class="col-lg-8">
										<input type="text" name="city" class="form-control" value="${(company.city)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">State</label>
									<div class="col-lg-8">
										<input type="text" name="state" class="form-control" value="${(company.state)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Zip</label>
									<div class="col-lg-8">
										<input type="text" name="zip" class="form-control" value="${(company.zip)!}"/>
									</div>
								</div>
								<div class="col-lg-12">
									<input type="hidden" name="id" value="${(company.id)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-primary btn-block">Save</button>
									</div>
									<div class="form-group">
										<a href="#" data-delete="/employee/company/${(company.id)!}" data-message="Are you sure you would like to permanently delete this company?" class="btn btn-danger btn-block delete-button">Delete</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">Driver Stats</div>
						<div class="panel-body">
							<p>Number of drivers: ${(driverCount)!'0'}</p>
							<a class="btn btn-block btn-default" href="/employee/company/${(company.id)!}/driver">Manage Drivers</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">Vehicle Stats</div>
						<div class="panel-body">
							<p>Number of vehicles: ${(vehicleCount)!'0'}</p>

							<p>Number of trucks</p>
							<a class="btn btn-block btn-default" href="/employee/company/${(company.id)!}/vehicle">Manage Vehicles</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="panel panel-default">
						<div class="panel-heading">Document Stats</div>
						<div class="panel-body">
							<!--TODO: make sql statements-->
							<p>Company Active Documents: ${(DocumentCount)!'0'}</p>
							<p>Driver Active Documents: </p>
							<a class="btn btn-block btn-default" href="/employee/company/${(company.id)!}/document">Manage Documents</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete.js"></script>
	</body>
</html>