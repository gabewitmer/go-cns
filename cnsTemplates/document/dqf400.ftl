<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		<#include "../stubs/header.ftl"/>
		<title>DQF 400</title>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<legend>Request for Drug and Alcohol Records<span class="pull-right">DQF 400</span></legend>
					<div><strong>Section A.</strong> To be completed by the new employer, signed by the employee, and transmitted to the previous employer:</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label left col-lg-2">Employee Name:</label>
							<div class="col-lg-5">
								<input type="text" name="applicant-name" class="form-control input-sm" value="${(driver.firstName)!} ${(driver.lastName)!}">
							</div>
							<label class="control-label left col-lg-2">Social Security/ID #:</label>
							<div class="col-lg-3">
								<input type="text" name="applicant-ssn-id" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-lg-2">Employee Signature:</label>
							<div class="col-lg-5">
								<input type="text" name="applicant-signature" class="form-control input-sm">
							</div>
							<label class="control-label left col-lg-2">Date:</label>
							<div class="col-lg-3">
								<input type="text" name="applicant-signature-date" class="form-control input-sm">
							</div>
						</div>
					</div>
					<div>
						I hereby authorize release of information from my Department of Transportation regulated drug and alcohol testing records by my previous
						employer. This release is in accordance with DOT Regulation 49 CFR Part 40, Section 40.25. I understand that information to be released by my
						previous employer, is limited to the following DOT-regulated testing items;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						1. Alcohol tests with a result of 0.04 or higher;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						2. Verified positive drug tests;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						3. Refusals to be tested;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						4. Other violations of DOT Agency drug and alcohol testing regulations;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						5. Information obtained from previous employers of a drug and alcohol rule violation;
					</div>
					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						6. Documentation, if any, of completion of the return-to-duty process following a rule violation.
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<hr/>
				</div>
				<div class="col-lg-6">
					<div class="form-horizontal">
						<h4><strong>A-1.</strong> New Employer Information</h4>
						<div class="form-group">
							<label class="control-label left col-xs-3">Name: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-name" class="form-control input-sm" value="${(company.name)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Street: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-street" class="form-control input-sm" value="${(company.street)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">City: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-city" class="form-control input-sm" value="${(company.city)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">State: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-state" class="form-control input-sm" value="${(company.state)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Zip: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-zip" class="form-control input-sm" value="${(company.zip)!}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Phone #: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-phone" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Fax #: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-fax" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Designated Rep: </label>
							<div class="col-xs-9">
								<input type="text" name="new-employer-rep" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-horizontal">
						<h4><strong>A-2.</strong> Previous Employer Information</h4>
						<div class="form-group">
							<label class="control-label left col-xs-3">Name: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-name" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Street: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-street" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">City: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-city" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">State: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-state" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Zip: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-zip" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Phone #: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-phone" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Fax #: </label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-fax" class="form-control input-sm">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label left col-xs-3">Designated Rep: (if&nbsp;known)</label>
							<div class="col-xs-9">
								<input type="text" name="previous-employer-rep" class="form-control input-sm">
							</div>
						</div>
					</div>
				</div>
			</div>
			<#if !driver??>
				<div class="row">
					<div class="col-lg-12">
						<hr>
						<div>
							<strong>Section B.</strong> To be completed by the previous employer and transmitted by mail or fax to the new employer:
						</div>
						<hr/>
						<div>
							<strong>B-1.</strong> In the two years prior to the date of the employee’s signature (in Section A), for DOT-regulated testing:
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						1.&nbsp;&nbsp;&nbsp; Did the employee have alcohol tests with a result of 0.04 or higher?
					</div>
					<div class="col-lg-4">
						<label class="checkbox-inline">
							<input type="checkbox" name="failed-alcohol-test"> Yes
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						2.&nbsp;&nbsp;&nbsp; Did the employee have verified positive drug tests?
					</div>
					<div class="col-lg-4">
						<label class="checkbox-inline">
							<input type="checkbox" name="positive-drug-test"> Yes
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						3.&nbsp;&nbsp;&nbsp; Did the employee refuse to be tested?
					</div>
					<div class="col-lg-4">
						<label class="checkbox-inline">
							<input type="checkbox" name="test-refuse"> Yes
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						4.&nbsp;&nbsp;&nbsp; Did the employee have other violations of DOT agency drug and alcohol
						testing regulations?
					</div>
					<div class="col-lg-4">
						<label class="checkbox-inline">
							<input type="checkbox" name="other-drug-violations"> Yes
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						5.&nbsp;&nbsp;&nbsp; Did a previous employer report a drug and alcohol rule violation to you?
					</div>
					<div class="col-lg-4">
						<label class="checkbox-inline">
							<input type="checkbox" name="previous-employer-report-drug-violation"> Yes
						</label>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						6.&nbsp;&nbsp;&nbsp; If you answered “yes” to any of the above items, did the employee
						complete the return-to-duty process?
					</div>
					<div class="col-lg-4">
						<label class="checkbox-inline">
							<input type="checkbox" name="employee-complete-return-to-duty"> Yes
						</label>
					</div>
				</div>
				<div class="row">
					<br/>
					<div class="col-lg-12">
						Note: If you answered “yes” to item 5, you must provide the previous employer’s report. If you answered “yes” to item 6, you
						must also transmit the appropriate return-to-duty documentation (e.g., SAP report(s), follow-up testing record).
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<hr/>
						<strong>B-2.</strong>
						<div class="form-horizontal">
							<div class="form-group">
								<label class="control-label left col-xs-4">
									Name of person providing information in Section B-1:
								</label>
								<div class="col-xs-4">
									<input type="text" name="name-of-b1-provider" class="form-control input-sm">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-4">Title:</label>
								<div class="col-xs-4">
									<input type="text" name="b1-provider-title" class="form-control input-sm">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-4">Phone #:</label>
								<div class="col-xs-4">
									<input type="text" name="b1-provider-phone" class="form-control input-sm">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label left col-xs-4">Date:</label>
								<div class="col-xs-4">
									<input type="text" name="b1-provider-date" class="form-control input-sm">
								</div>
							</div>
						</div>
					</div>
				</div>
			</#if>
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
