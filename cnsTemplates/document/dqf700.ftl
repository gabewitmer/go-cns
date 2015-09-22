<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		<#include "../stubs/header.ftl"/>
		<title>DQF 700</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<legend>Certification of Violations<span class="pull-right">DQF 700</span></legend>
					<div>
						<strong>§ 395.8 (j) (2)</strong>
					</div>
					<br/>
					<div>
						Motor carriers, when using a driver for the first time or intermittently, shall obtain from the driver a signed
						statement giving the total time on duty during the immediately preceding 7 days and the time at which the
						driver was last relieved from duty prior to beginning work for the motor carriers.
					</div>
					<hr/>
					<div class="col-lg-offset-3 col-lg-6">
						<div class="form-horizontal">
							<h4>Driver Information</h4>
							<div class="form-group">
								<label class="control-label left col-xs-3">Name:</label>
								<div class="col-xs-9">
									<input type="text" name="driver-name" class="form-control input-sm" value="${(driver.firstName)!} ${(driver.lastName)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">Employee #:</label>
								<div class="col-lg-9">
									<input type="text" name="driver-employee-no" class="form-control input-sm">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">Street: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-street" class="form-control input-sm" value="${(driver.street)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">City: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-city" class="form-control input-sm" value="${(driver.city)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">State: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-state" class="form-control input-sm" value="${(driver.state)!}">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-3">Zip: </label>
								<div class="col-xs-9">
									<input type="text" name="driver-zip" class="form-control input-sm" value="${(driver.zip)!}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr>
					<div>
						List the day, date and hours worked in the previous 7 days below. If the driver is off-duty any of the days, note
						that day as “Off-Duty”
					</div>
					<br/>
					<label>7 day work history</label>
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th></th>
								<th>Date</th>
								<th>Day of Week</th>
								<th>Hours On-Duty</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.</td>
								<td><input type="text" class="form-control input-sm" name="1-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="1-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="1-driver-duty-hours"></td>
							</tr>
							<tr>
								<td>2.</td>
								<td><input type="text" class="form-control input-sm" name="2-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="2-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="2-driver-duty-hours"></td>
							</tr>
							<tr>
								<td>3.</td>
								<td><input type="text" class="form-control input-sm" name="3-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="3-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="3-driver-duty-hours"></td>
							</tr>
							<tr>
								<td>4.</td>
								<td><input type="text" class="form-control input-sm" name="4-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="4-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="4-driver-duty-hours"></td>
							</tr>
							<tr>
								<td>5.</td>
								<td><input type="text" class="form-control input-sm" name="5-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="5-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="5-driver-duty-hours"></td>
							</tr>
							<tr>
								<td>6.</td>
								<td><input type="text" class="form-control input-sm" name="6-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="6-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="6-driver-duty-hours"></td>
							</tr>
							<tr>
								<td>7.</td>
								<td><input type="text" class="form-control input-sm" name="7-driver-duty-date"></td>
								<td><input type="text" class="form-control input-sm" name="7-driver-duty-day"></td>
								<td><input type="text" class="form-control input-sm" name="7-driver-duty-hours"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-4">Total hours On-Duty the past 7 days:</label>
							<div class="col-lg-2">
								<input type="text" name="driver-total-hours" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-lg-4">Note the last date and time the driver was On-Duty:</label>
							<div class="col-lg-2">
								<input type="text" name="driver-last-date-time-on-duty" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
					<div>
						By signing below, I have stated accurate and true information of my 7 proceeding days of compensated work.
					</div>
					<br/>
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-2">Driver Signature:</label>
							<div class="col-lg-6">
								<input type="text" name="driver-signature" class="form-control input-sm">
							</div>
							<label class="control-label left col-lg-1">Date:</label>
							<div class="col-lg-3">
								<input type="text" name="driver-signature-date" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1 col-lg-offset-9">
				<button type="button" name="button" id="save" >Save</button>
			</div>
			<div class="col-lg-1">
				<button type="button" name="button" id="complete" >Complete</button>
			</div>
		</div>
		<#include "../stubs/scripts.ftl"/>
		<script src="/static/js/input-tools.js"></script>
		<script src="/static/js/document.js"></script>
		<script>

			var id = '${(document.id)!}';
			var documentId = '${(document.documentId)!}';
			var data = '${(document.data)!}';

		</script>
	</body>
</html>
