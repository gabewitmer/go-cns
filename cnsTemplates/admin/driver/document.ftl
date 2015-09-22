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
							<a href="/admin/driver">Drivers</a>
						</li>
						<li class="active">${(driver.firstName)!} ${(driver.lastName)!}</li>
						<li class="active">Documents</li>
						<#if !addnew??>
							<li>
								<a href="/admin/driver/${(driver.id)!}/document?addnew"><i class="fa fa-plus">&nbsp;Add New</i></a>
							</li>
						</#if>
					</ol>
				</div>
				<!-- BREADCRUMB NAVIGATION -->

				<#assign dqfs = [
					{"id":100,"name":"Driver's Application"},
					{"id":180,"name":"Certification of Violations"},
					{"id":200,"name":"Annual Inquery & Review"},
					{"id":250,"name":"Road Test Certication"},
					{"id":300,"name":"Previous Driver Inquires"},
					{"id":400,"name":"Drug & Alcohol Records Request"},
					{"id":450,"name":"Drug & Alcohol Certified Receipt"},
					{"id":500,"name":"Certification Compliance"},
					{"id":600,"name":"Confictions for a Driver Violation"},
					{"id":700,"name":"New Hire Stmt On Duty Hours"},
					{"id":750,"name":"Other Ompensated Work"},
					{"id":775,"name":"Fair Credit Reporting Act"}
				]>

				<#if addnew??>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							${(driver.firstName)!} ${(driver.lastName)!}
							<a href="/admin/driver/${(driver.id)!}/document" class="btn btn-default btn-sm pull-right">Cancel</a>
						</div>
						<div class="panel-body">
							body
						</div>
					</div>
				</div>
				</#if>

				<#if addnew??>
					<div class="col-lg-4">
						<div class="panel panel-default">
							<div class="panel-heading clearfix">
								Driver ${(driver.firstName)!} ${(driver.lastName)!}
								<a href="/admin/driver/${(driver.id)!}/document" class="btn btn-default btn-xs pull-right">Cancel</a>
							</div>
							<#--<div class="panel-body">-->
							<div id="documents" class="list-group">
								<#list dqfs as dqf>
									<div style="margin:7px;">
										<div class="col-xs-11">
											<p class="list-group-item-text">DQF${(dqf.id?c)!} - ${(dqf.name)!}</p>
										</div>
										<button id="addDoc" data-added="0" data-docId="${dqf.id?c}" class="btn-default btn btn-xs">
											<i class="fa fa-check"></i>
										</button>
									</div>
								</#list>
								<div class="list-group-item">
									<form id="documentForm" class="test-center" role="form" method="post" action="/admin/driver/${(driver.id?c)!}/document">
										<input type="hidden"  id="docIds" name="docIds">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<button id="done" class="btn btn-md btn-primary btn-block" type="submit" disabled="disabled">
											Please Select Documents
										</button>
									</form>
								</div>
							</div>
						<#--</div>-->
						</div>
					</div>
				</#if>

				<#if addnew??>
				<div class="col-lg-8">
				<#else>
				<div class="col-lg-12">
				</#if>
					<legend>Documents</legend>
					<!--<div class="panel panel-default">-->
						<!--<div class="panel-heading">Documents</div>-->
						<#if documents?has_content>
							<!--<div class="table-responsive">-->
								<table id="documents" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th>DQF</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody>
										<#list documents as document>
											<tr>
												<td>${(document.id?c)!}</td>
												<td>
													<#if document.documentId?c == '300' || document.documentId?c == '775' >
														<a href="/doc/dqf${(document.documentId?c)!}" target="_blank">${(document.documentId?c)!}</a>
													<#else/>
														${(document.documentId?c)!}
													</#if>
												</td>
												<td>
													<a href="#" class="btn btn-danger btn-xs delete-button"
													   data-delete="/admin/driver/${driver.id}/document/${(document.id)!}"
													   data-message="Are you sure you would like to delete this document?">
														Delete
													</a>
												</td>
											</tr>
										</#list>
									</tbody>
								</table>
							<!--</div>-->
						<#else/>
							<div class="text-center panel-body">
								No Documents
							</div>
						</#if>
					<!--</div>-->
				</div>
			</div>
		</div>
		<#include "../../stubs/scripts.ftl"/>
		<script src="/static/js/delete.js"></script>

		<script>
			var docId = [];
			$(document).ready(function() {
				$('button[id="addDoc"]').click(function() {
					if (this.getAttribute('data-added') == '0') {
						docId.push(this.getAttribute('data-docId'));
						this.setAttribute('class', 'btn-success btn btn-xs');
						this.setAttribute('data-added', '1');
						$('button[id="done"]').removeAttr('disabled');
						$('button[id="done"]')[0].innerText = "Add Documents To Driver";
					} else {
						docId = removeValue(docId, this.getAttribute('data-docId'));
						this.setAttribute('class', 'btn-default btn btn-xs');
						this.setAttribute('data-added', '0');
						if(docId.length < 1) {
							$('button[id="done"]').attr('disabled', 'disabled');
							$('button[id="done"]')[0].innerText = "Please Select Documents";
						}
					}
				});
				$('button[id="done"]').click(function(e){
					e.preventDefault();
					$('input[id="docIds"]').val(docId);
					$('form[id="documentForm"]').submit();
				});
			});
		</script>

		<script>
			$(document).ready(function() {
    		$('#documents').DataTable();
			});
		</script>
	</body>
</html>