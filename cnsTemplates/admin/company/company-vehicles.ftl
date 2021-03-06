<!DOCTYPE html>
<html>
	<head>
		<#include "../../stubs/header.ftl"/>
		<title>Home</title>
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
							<a href="/admin/company">Companies</a>
						</li>
						<li>
							<a href="/admin/company/${(company.id)!}">${(company.name)!}</a>
						</li>
						<li class="active">
							${(vehicle??)?string('<a href="/admin/company/${(company.id)!}/vehicle">Vehicles</a>','Vehicles')!}
						</li>
						<#if !addnew?? && !vehicle??>
							<li>
								<a href="/admin/company/${(company.id)!}/vehicle?addnew"><i class="fa fa-plus">&nbsp;Add New</i></a>
							</li>
						<#else>
							${(vehicle??)?string('<li class="active">${(vehicle.name)!}</li>','')!}
						</#if>
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<#if vehicle?? || addnew??>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							${(company.name)!}'s Vehicle
							<a href="/admin/company/${(company.id)!}/vehicle" class="btn btn-default btn-xs pull-right">Cancel</a>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="/admin/company/${(company.id)!}/vehicle" method="post">
								<div class="form-group">
									<label class="control-label col-lg-4">Name</label>
									<div class="col-lg-8">
										<input type="text" name="name" class="form-control" value="${(vehicle.name)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Type</label>
									<div class="col-lg-8">
										<select class="form-control" name="type">
											<option value="TRUCK" ${(vehicle?? && vehicle.type == 'TRUCK') ? string('selected', '')}>Truck</option>
											<option value="TRAILER" ${(vehicle?? && vehicle.type == 'TRAILER') ? string('selected', '')}>Trailer</option>
											<option value="BUS" ${(vehicle?? && vehicle.type == 'BUS') ? string('selected', '')}>Bus</option>
										</select>
									</div>
								</div>
								<div class="col-lg-12">
									<input type="hidden" name="id" value="${(vehicle.id)!}"/>
									<input type="hidden" name="company_id" value="${(company.id)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-primary btn-block">Save</button>
									</div>
									<#if vehicle??>
										<div class="form-group">
											<a href="#" data-message="Are you sure you would like to permanently delete this vehicle?" data-delete="/admin/company/${(company.id)!}/vehicle/${(vehicle.id)!}" class="btn btn-danger btn-block delete-button">Delete</a>
										</div>
									</#if>
								</div>
							</form>
						</div>
					</div>
				</div>
				</#if>
				<#if vehicle?? || addnew??>
				<div class="col-lg-8">
				<#else>
				<div class="col-lg-12">
				</#if>
					<legend>${(company.name)!}'s Vehicles</legend>
					<!--<div class="panel panel-default">-->
						<!--<div class="panel-heading clearfix">-->
							<!--${(company.name)!}'s Vehicles-->
							<!--<a class="btn btn-default pull-right btn-xs" href="/admin/company/${(company.id)!}">Back to Company</a>-->
						<!--</div>-->
						<#if vehicles?has_content>
							<!--<div class="table-responsive">-->
								<table id="vehicles" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>Type</th>
										</tr>
									</thead>
									<tbody>
										<#list vehicles as vehicle>
											<tr>
												<td>
													<a href="/admin/company/${(company.id)!}/vehicle/${(vehicle.id)!}" class="btn btn-primary btn-xs">${(vehicle.id)!}</a>
												</td>
												<td>${(vehicle.name)!}</td>
												<td>${(vehicle.type?capitalize)!}</td>
											</tr>
										</#list>
									</tbody>
								</table>
							<!--</div>-->
						<#else/>
							<div class="text-center panel-body">
								No Vehicles
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
    			$('#vehicles').DataTable();
			} );
		</script>
	</body>
</html>