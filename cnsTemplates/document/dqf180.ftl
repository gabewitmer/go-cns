<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		<#include "../stubs/header.ftl"/>
		<title>DQF 180</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<legend>Certification of Violations<span class="pull-right">DQF 180</span></legend>
					<div>
						§ 391.27 Each motor carrier shall, at least once every 12 months, require each driver it employs to prepare and furnish it with
						a list of all violations of motor vehicle traffic laws and ordinances (other than violations involving only parking) of which the
						driver has been convicted or on account of which he/she has forfeited bond or collateral during the preceding 12 months.
						Each driver shall furnish the list required in accordance with the paragraph above of this section. If the driver has not been
						convicted of, or forfeited bond or collateral on account of, any violation which must be listed, he/she shall so certify.
					</div>
					<hr/>
				</div>

				<div class="col-lg-6">
					<div class="form-horizontal">
						<h4>Driver Information</h4>
						<div class="form-group">
							<label class="control-label left col-xs-3">Name: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-name" class="form-control input-sm" value="${(driver.firstName)!} ${(driver.lastName)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Date: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-date" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Employee ID: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-employee-id" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">SSN: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-ssn" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">License Number: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-license-number" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">State: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-state" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Exp: </label>
							<div class="col-xs-9">
								<input type="text" name="applicant-exp" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="form-horizontal">
						<h4>Motor Carrier Information</h4>
						<div class="form-group">
							<label class="control-label left col-xs-3">Motor Carrier: </label>
							<div class="col-xs-9">
								<input type="text" name="motor-carrier-name" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Street: </label>
							<div class="col-xs-9">
								<input type="text" name="motor-carrier-street" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">City: </label>
							<div class="col-xs-9">
								<input type="text" name="motor-carrier-city" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">State: </label>
							<div class="col-xs-9">
								<input type="text" name="motor-carrier-state" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Zip: </label>
							<div class="col-xs-9">
								<input type="text" name="motor-carrier-zip" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr>
					<div>
						I certify that the following is a true and complete list of traffic violations (other than parking
						violations) for which I have been convicted or forfeited bond or collateral during the past 12 months.
					</div>
					<div>
						<input type="checkbox" name="noViolations" value="true">
						None. Check here if you have not had any violations in the past 12 months.
					</div>
					<div id="parent" data-group="previous-address">
						<br/>
						<label>Violations Within the Past 12 Months</label>
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Date</th>
									<th>Offense</th>
									<th>Location</th>
									<th>Type of Vehicle Operated</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr class="multiple">
									<td><input type="text" class="form-control input-sm" name="violation-date" id="multi"></td>
									<td><input type="text" class="form-control input-sm" name="violation-offense" id="multi" ></td>
									<td><input type="text" class="form-control input-sm" name="violation-location" id="multi" ></td>
									<td><input type="text" class="form-control input-sm" name="violation-vehicle-type" id="multi" ></td>
									<td id="remove-button"></td>
								</tr>
							</tbody>
						</table>
						<button class="btn btn-primary add">Add</button>
						<br/><br/>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
					<div>
						If no violations are listed above, I certify that I have not been convicted or forfeited bond or collateral
						on account of any violation required to be listed during the past 12 months.
					</div>
					<br/>
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-2">Driver Signature:</label>
							<div class="col-lg-6">
								<input type="text" name="applicant-agreement-signature" class="form-control input-sm">
							</div>
							<label class="control-label left col-lg-1">Date:</label>
							<div class="col-lg-3">
								<input type="text" name="applicant-agreement-signature-date" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-lg-2">Reviewer's Signature:</label>
							<div class="col-lg-6">
								<input type="text" name="reviewer-agreement-signature" class="form-control input-sm">
							</div>
							<label class="control-label left col-lg-1">Title:</label>
							<div class="col-lg-3">
								<input type="text" name="reviewer-title" class="form-control input-sm">
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
