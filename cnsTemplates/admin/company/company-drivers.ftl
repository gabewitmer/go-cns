<!DOCTYPE html>
<html>
	<head>
		<#include "../../stubs/header.ftl"/>
		<title>Driver</title>
	</head>
	<body>
		<#include "../../stubs/secure-navbar-admin.ftl"/>
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
						<li>
							<a href="/admin/company">Company</a>
						</li>
						<li>
							<a href="/admin/company/${(company.id)!}">${(company.name)!}</a>
						</li>
						<li class="active">
							${(driver??)?string('<a href="/admin/company/${(company.id)!}/driver">Drivers</a>','Drivers')!}
						</li>
						<#if !addnew?? && !driver??>
							<li>
								<a href="/admin/company/${(company.id)!}/driver?addnew"><i class="fa fa-plus">&nbsp;Add New</i></a>
							</li>
						<#else>
							${(driver??)?string('<li class="active">${(driver.firstName)!} ${(driver.lastName)!}</li>','')!}
						</#if>

					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<#if driver?? || addnew??>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							${(company.name)!}'s Driver
							<a href="/admin/company/${(company.id)!}/driver" class="btn btn-default btn-xs pull-right">Cancel</a>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="/admin/company/${(company.id)!}/driver/${(addnew??)? string('add', 'edit')}" method="post">

								<div class="form-group">
									<label class="control-label col-lg-4">First Name</label>
									<div class="col-lg-8">
										<input type="text" name="firstName" class="form-control" value="${(driver.firstName)!}"/>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-lg-4">Last Name</label>
									<div class="col-lg-8">
										<input type="text" name="lastName" class="form-control" value="${(driver.lastName)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Email</label>
									<div class="col-lg-8">
										<input type="text" name="email" class="form-control" value="${(driver.email)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Street</label>
									<div class="col-lg-8">
										<input type="text" name="street" class="form-control" value="${(driver.street)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">City</label>
									<div class="col-lg-8">
										<input type="text" name="city" class="form-control" value="${(driver.city)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">State</label>
									<div class="col-lg-8">
										<input type="text" name="state" class="form-control" value="${(driver.state)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Zip</label>
									<div class="col-lg-8">
										<input type="text" name="zip" class="form-control" value="${(driver.zip)!}"/>
									</div>
								</div>
								<div class="col-lg-12">
									<input type="hidden" name="id" value="${(driver.id?c)!}"/>
									<input type="hidden" name="userId" value="${(driver.userId?c)!}"/>
									<input type="hidden" name="company_id" value="${(company.id?c)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-primary btn-block">Save</button>
									</div>
									<#if driver??>
										<div class="form-group">
											<a href="#" data-message="Are you sure you would like to delete this driver?" data-delete="/admin/company/${(company.id)!}/driver/${(driver.id)!}" class="btn btn-danger btn-block delete-button">Delete</a>
										</div>
									</#if>
								</div>
							</form>
						</div>
					</div>
				</div>
				</#if>
				<#if driver?? || addnew??>
				<div class="col-lg-8">
				<#else>
				<div class="col-lg-12">
				</#if>
					<legend>
						${(company.name)!}'s Drivers
						<!--<a class="btn btn-default pull-right btn-xs" href="/admin/company/${(company.id)!}">Back to Company</a>-->
					</legend>
					<!--<div class="panel panel-default">-->
						<!--<div class="panel-heading clearfix">-->
							<!--${(company.name)!}'s Drivers-->
							<!--<a class="btn btn-default pull-right btn-xs" href="/admin/company/${(company.id)!}">Back to Company</a>-->
						<!--</div>-->
						<#if drivers?has_content>
							<!--<div class="table-responsive">-->
								<table id="drivers" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Id</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Address</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<#list drivers as driver>
											<tr>
												<td>
													<a href="/admin/company/${(company.id)!}/driver/${(driver.id)!}" class="btn btn-primary btn-xs">${(driver.id)!}</a>
												</td>
												<td>${(driver.firstName)!}</td>
												<td>${(driver.lastName)!}</td>
												<td>${(driver.street)!} ${(driver.city)!}</td>
												<td class="text-center">
													<div class="btn-group btn-group-xs">
														<a href="/admin/driver/${(driver.id)!}/document" class="btn btn-default">Manage Documents</a>
													</div>
												</td>
											</tr>
										</#list>
									</tbody>
								</table>
							<!--</div>-->
							<#else/>
							<div class="text-center panel-body">
								No Drivers
							</div>
						</#if>
					<!--</div>-->
				</div>
			</div>
		</div>
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/password.js"></script>
		<script src="/static/js/delete.js"></script>
		<script>
			$(document).ready(function() {
    		$('#drivers').DataTable();
			} );
		</script>
	</body>
</html>