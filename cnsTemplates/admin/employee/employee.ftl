<!DOCTYPE html>
<html>
	<head>
		<#include "../../stubs/header.ftl"/>
		<title>Employee</title>
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
							${(employee??)?string('<a href="/admin/employee">Employees</a>','Employees')!}
						</li>
						<#if !addnew?? && !employee??>
							<li>
								<a href="/admin/employee?addnew"><i class="fa fa-plus">&nbsp;Add New</i></a>
							</li>
						<#else>
							${(employee??)?string('<li class="active">${(employee.firstName)!} ${(employee.lastName)!}</li>','')!}
						</#if>
					
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->
				
				<#if employee?? || addnew??>
					<div class="col-lg-4">
						<div class="panel panel-default">
							<div class="panel-heading clearfix">
								${(employee.firstName)!} ${(employee.lastName)!}
								<a href="/admin/employee" class="btn btn-default btn-xs pull-right">Cancel</a>
							</div>
							<div class="panel-body">
								<form class="form-horizontal" action="/admin/employee/${(addnew??)? string('add', 'edit')}" method="post">
									
									<div class="form-group">
										<label class="control-label col-lg-4">First Name</label>
										<div class="col-lg-8">
											<input type="text" name="firstName" class="form-control" value="${(employee.firstName)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">Last Name</label>
										<div class="col-lg-8">
											<input type="text" name="lastName" class="form-control" value="${(employee.lastName)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">Email</label>
										<div class="col-lg-8">
											<input type="text" name="email" class="form-control" value="${(employee.email)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">Street</label>
										<div class="col-lg-8">
											<input type="text" name="street" class="form-control" value="${(employee.street)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">City</label>
										<div class="col-lg-8">
											<input type="text" name="city" class="form-control" value="${(employee.city)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">State</label>
										<div class="col-lg-8">
											<input type="text" name="state" class="form-control" value="${(employee.state)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">Zip</label>
										<div class="col-lg-8">
											<input type="text" name="zip" class="form-control" value="${(employee.zip)!}"/>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4">Role</label>
										<div class="col-lg-8">
											<select class="form-control" name="role">
												<option ${(employee?? && users[employee.userId?string] == 'ROLE_EMPLOYEE') ? string('selected', '')} value="ROLE_EMPLOYEE">Employee</option>
												<option ${(employee?? && users[employee.userId?string] == 'ROLE_ADMIN') ? string('selected', '')} value="ROLE_ADMIN">Admin</option>
											</select>
										</div>
									</div>
									<div class="col-lg-12">
										<input type="hidden" name="id" value="${(employee.id?c)!}"/>
										<input type="hidden" name="userId" value="${(employee.userId?c)!}"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<div class="form-group">
											<button class="btn btn-primary btn-block">Save</button>
										</div>
										<#if employee??>
											<div class="form-group">
												<a href="#" data-message="Are you sure you would like to delete this employee?" data-delete="/admin/employee/${(employee.id)!}" class="btn btn-danger btn-block delete-button">Delete</a>
											</div>
										</#if>
									</div>
								</form>
							</div>
						</div>
					</div>
				</#if>
				<#if employee?? || addnew??>
				<div class="col-lg-8">
				<#else>
				<div class="col-lg-12">
				</#if>
				<legend>
					Employees
					<!--<a class="btn btn-default pull-right btn-xs" href="/employee/company/${(company.id)!}">Back to Company</a>-->
				</legend>
				<!--<div class="panel panel-default">-->
				<!--<div class="panel-heading clearfix">-->
				<!--${(company.name)!}'s Employees-->
				<!--<a class="btn btn-default pull-right btn-xs" href="/employee/company/${(company.id)!}">Back to Company</a>-->
				<!--</div>-->
				<#if employees?has_content>
					<!--<div class="table-responsive">-->
					<table id="employees" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Address</th>
								<th>Role</th>
							</tr>
						</thead>
						<tbody>
							<#list employees as employee>
								<tr>
									<td>
										<a href="/admin/employee/${(employee.id)!}" class="btn btn-primary btn-xs">${(employee.id)!}</a>
									</td>
									<td>${(employee.firstName)!}</td>
									<td>${(employee.lastName)!}</td>
									<td>${(employee.street)!} ${(employee.city)!}</td>
									<#if users[employee.userId?string] == 'ROLE_EMPLOYEE'>
									<td>Employee</td>
									<#elseif users[employee.userId?string] == 'ROLE_ADMIN'>
									<td>Admin</td>

									</#if>
								</tr>
							</#list>
						</tbody>
					</table>
					<!--</div>-->
					<#else/>
					<div class="text-center panel-body">
						No Employees
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
    		$('#employees').DataTable();
			} );
		</script>
	</body>
</html>