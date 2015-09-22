<!DOCTYPE html>
<html>
	<head>
		<#include "../../stubs/header.ftl"/>
		<title>Company</title>
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
						<li class="active">
							${(company??)?string('<a href="/admin/company">Company</a>','Companies')!}
						</li>
						<#if !addnew??>
							<li>
								<a href="/admin/company?addnew"><i class="fa fa-plus">&nbsp;Add New</i></a>
							</li>
						</#if>
						${(company??)?string('<li class="active">${(company.name)!}</li>','')!}
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<#if company?? || addnew??>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							Company
							<a href="/admin/company" class="btn btn-default btn-sm pull-right">Cancel</a>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="/admin/company" method="post">
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
								<div class="form-group">
									<label class="control-label col-lg-4">Age Requirement</label>
									<div class="col-lg-8">
										<input type="number" name="ageRequirement" class="form-control" value="${(company.ageRequirement)!}"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-4">Feature</label>
									<div class="col-lg-8">
										<label class="radio-inline">
											<input type="radio" name="feature" value="true" checked/> Yes
										</label>
										<label class="radio-inline">
											<input type="radio" name="feature" value="false"/> No
										</label>
									</div>
								</div>
								<div class="col-lg-12">
									<input type="hidden" name="id" value="${(company.id)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-primary btn-block">Save</button>
									</div>
									<#if company??>
										<div class="form-group">
											<a href="#" data-message="Are you sure you would like to permanently delete this company?" data-delete="/admin/company/${(company.id)!}" class="btn btn-danger btn-block delete-button">Delete</a>
										</div>
									</#if>
								</div>
							</form>
						</div>
					</div>
				</div>
				</#if>

				<#if company?? || addnew??>
				<div class="col-lg-8">
				<#else>
				<div class="col-lg-12">
				</#if>
					<legend>All Companies</legend>
					<!--<div class="panel panel-default">-->
						<!--<div class="panel-heading">Companies</div>-->
						<#if companies?has_content>
							<!--<div class="table-responsive">-->
								<table id="companies" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Id</th>
											<th>Name</th>
											<th>Address</th>
										</tr>
									</thead>
									<tbody>
										<#list companies as company>
											<tr>
												<td><a href="/admin/company/${(company.id)!}" class="btn btn-primary btn-xs">${(company.id)!}</a></td>
												<td>${(company.name)!}</td>
												<td>${(company.street)!} ${(company.city)!}</td>
											</tr>
										</#list>
									</tbody>
								</table>
							<!--</div>-->
						<#else/>
							<div class="text-center panel-body">
								No Companies
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
    		$('#companies').DataTable();
			} );
		</script>
	</body>
</html>