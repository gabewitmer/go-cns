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
					<!-- delete object alert -->
					<div id="deleteAlert" class="alert alert-danger clearfix hide">
						<form id="deleteForm" action="" method="post" class="col-lg-2">
							<button id="delete" class="btn btn-danger btn-sm">Yes</button>
							<a id="deleteCancel" class="btn btn-default btn-sm">No</a>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
						Are you sure you would like to permanently delete this user?
					</div>
				</div>

				<!-- BREADCRUMB NAVIGATION -->
				<div class="col-lg-12">
					<ol class="breadcrumb">
						<li>
							<a href="/admin/home">Home</a>
						</li>
						<li class="active">
							${(user??)?string('<a href="/admin/user">User</a>','Users')!}
						</li>
						${(user??)?string('<li class="active">${(user.firstName)!} ${(user.lastName)!}</li>','')!}
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							User
							<a href="/admin/user" class="btn btn-default btn-sm pull-right">Clear</a>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" action="/admin/user" method="post">

								<div class="form-group">
									<label class="control-label col-lg-4">Email</label>
									<div class="col-lg-8">
										<input type="text" name="username" class="form-control" value="${(user.username)!}"/>
									</div>
								</div>
								<#if user??>
									<div class="text-center">
										<a data-toggle="collapse" data-parent="#accordion"
										   href="#changePassword" class="text-primary">
											Click to change password
										</a>
									</div>
									<br/>
									<div id="changePassword" class="panel-collapse collapse">
										<!-- toggle show password input -->
										<div class="form-group">
											<label class="control-label col-lg-4">Password</label>
											<div class="col-lg-8">
												<div class="input-group">
													<input type="password" id="toggle-pass" name="password" class="form-control"/>
													<span class="input-group-btn">
														<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
																title="Click to show/hide your password">
															<i class="fa fa-eye-slash"></i>
														</button>
													</span>
												</div>
											</div>
										</div>
										<!-- toggle show password input -->
									</div>
								<#else/>
									<!-- toggle show password input -->
									<div class="form-group">
										<label class="control-label col-lg-4">Password</label>
										<div class="col-lg-8">
											<div class="input-group">
												<input type="password" id="toggle-pass" name="password" class="form-control"/>
												<span class="input-group-btn">
													<button id="toggle-pass" type="button" class="btn btn-default" data-toggle="tooltip" data-placement="right"
															title="Click to show/hide your password">
														<i class="fa fa-eye-slash"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
									<!-- toggle show password input -->
								</#if>
								<div class="form-group">
									<label class="control-label col-lg-4">Role</label>
									<div class="col-lg-8">
										<select class="form-control" name="role">
											<option ${(user?? && user.role == 'ROLE_DRIVER') ? string('selected', '')} value="ROLE_DRIVER">Driver</option>
											<option ${(user?? && user.role == 'ROLE_USER') ? string('selected', '')} value="ROLE_USER">User</option>
											<option ${(user?? && user.role == 'ROLE_ADMIN') ? string('selected', '')} value="ROLE_ADMIN">Admin</option>
										</select>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="form-group">
										<label>Active:</label>&nbsp;&nbsp;
										&nbsp;&nbsp;<input type="radio" name="active" value="1" ${(user??)? string((user?? && user.active == 1) ? string('checked', '') , 'checked')}/> Yes
										&nbsp;&nbsp;<input type="radio" name="active" value="0" ${(user?? && user.active == 0) ? string('checked', '')}/> No
									</div>
									<input type="hidden" name="id" value="${(user.id)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button class="btn btn-primary btn-block">Save</button>
									</div>
									<#if user??>
										<div class="form-group">
											<a href="#" id="deleteButton" data-delete="/admin/user/${(user.id)!}" class="btn btn-danger btn-block">Delete</a>
										</div>
									</#if>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<legend>Users</legend>
					<!--<div class="panel panel-default">-->
						<!--<div class="panel-heading">Users</div>-->
						<#if users?has_content>
							<!--<div class="table-responsive">-->
								<table id="users" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Id</th>
											<th>Email</th>
											<th>Active</th>
											<th>Role</th>
										</tr>
									</thead>
									<tbody>
										<#list users as user>
											<tr>
												<td><a href="/admin/user/${(user.id)!}" class="btn btn-primary btn-xs">${(user.id)!}</a></td>
												<td>${(user.username)!}</td>
												<td>${(user.active == 1) ? string('Yes', 'No')}</td>
												<#if user?? && user.role == 'ROLE_USER'>
													<td>User</td>
												<#elseif user?? && user.role == 'ROLE_ADMIN'>
													<td>Admin</td>
												<#elseif user?? && user.role == 'ROLE_DRIVER'>
													<td>Driver</td>
												</#if>
											</tr>
										</#list>
									</tbody>
								</table>
							<!--</div>-->
						<#else/>
							<div class="text-center panel-body">
								No Users
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
    		$('#users').DataTable();
			} );
		</script>
	</body>
</html>