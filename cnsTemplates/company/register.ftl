<!DOCTYPE html>
<html>
	<head lang="en">
		<#include "../stubs/header.ftl"/>
		<title>${(company.name)!}'s Driver Registration</title>
	</head>
	<body>

		<!-- navigation -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/login/${(company.slug)!}">
						<span style="margin-left:90px;">DQF Management System Driver Registration</span>
					</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/landing/${(company.slug)!}"><i class="fa fa-home"></i>&nbsp;${(company.name)!}</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- navigation -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<#include "../stubs/alerts.ftl"/>
				</div>
				<div class="col-lg-offset-3 col-lg-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<#if company.logo>
								<a href="/landing/${(company.slug)!}">
									<div class="form-group text-center">
										<img id="src-image" class="img-responsive col-lg-6 col-lg-offset-3" src="/logo/${(company.slug)!}"/>
									</div>
									<br/><br/>
								</a>
							</#if>
							<div class="col-lg-12">
								<p class="lead text-center">Driver Registration</p>
							</div>
							<form action="/apply/${(company.id)!}/add" method="post">
								<div class="col-lg-6">
									<div class="form-group">
										<label class="control-label">First Name</label>
										<input type="text" name="firstName" class="form-control" value="${(driver.firstName)!}"/>
									</div>
									<div class="form-group">
										<label class="control-label">Last Name</label>
										<input type="text" name="lastName" class="form-control" value="${(driver.lastName)!}"/>
									</div>
									<div class="form-group">
										<label class="control-label">Email</label>
										<input type="text" name="email" class="form-control" value="${(driver.email)!}"/>
									</div>
									<div class="form-group">
										<label class="control-label">Date of Birth</label>
										<input type="date" name="dateOfBirth" class="form-control"/>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label class="control-label">Street</label>
										<input type="text" name="street" class="form-control" value="${(driver.street)!}"/>
									</div>
									<div class="form-group">
										<label class="control-label">City</label>
										<input type="text" name="city" class="form-control" value="${(driver.city)!}"/>
									</div>
									<div class="form-group">
										<label class="control-label">State</label>
										<input type="text" name="state" class="form-control" value="${(driver.state)!}"/>
									</div>
									<div class="form-group">
										<label class="control-label">Zip</label>
										<input type="text" name="zip" class="form-control" value="${(driver.zip)!}"/>
									</div>
								</div>
								<div class="col-lg-12">
									<input type="hidden" name="companyId" value="${(company.id?c)!}"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<div class="form-group">
										<button id="dynamic-btn" class="btn btn-primary btn-block">
											Register As Driver For ${(company.name)!}
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<p class="text-center">
						<small>*Powered by CNS Compliance Company &amp; Truck Licensing</small>
					</p>
				</div>
			</div>
		</div>

		<div class="modal fade" id="disclaimerModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Disclaimer</h4>
					</div>
					<div class="modal-body">
						<p>
							The sky is the limit only for those who aren't afraid to fly!
						</p>
						<p>
							I don't know what you could say about a day in which you have seen four beautiful sunsets.
						</p>
						<p>
							We choose to go to the moon in this decade and do the other things, not because they are easy,
							but because they are hard, because that goal will serve to organize and measure the best of our
							energies and skills, because that challenge is one that we are willing to accept, one we are unwilling
							to postpone, and one which we intend to win.
						</p>
					</div>
					<div class="modal-footer">
						<a href="/landing/${(companySlug)!}" class="btn btn-default" >Disagree</a>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Agree</button>
					</div>
				</div>
			</div>
		</div>

		<#include "../stubs/scripts.ftl"/>
		<script src="/static/js/color-theif.min.js"></script>
		<script src="/static/js/color-styler.js"></script>
		<script>
			$(document).ready(function() {
				$('#disclaimerModal').modal('show');
			});
		</script>
	</body>
</html>