<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
        <#include "../stubs/header.ftl"/>
        <title>DQF 775</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <legend>Fair Credit Reporting Act<span class="pull-right">DQF 775</span></legend>
                <p><strong>
                    In accordance with the provisions of Section 604(b)(2)(A) of the Air Credit Reporting Act, Public
                    Law91-508, as amended by the consumer Credit Reporting Act of 1996 (Title II, Subtitle D, Chapter
                    I, of Public Law 104-208), you are giving permission to the listed employer below to receive and
                    verify your previous employment records. These records include the following, previous drug and
                    alcohol test results and driving record. These documents will be verified for employment purposes.
                    The Federal Motor Carrier Administration requires an employer to hold these records according to
                    Sections 382.413, 391.23, 391.25.
                </strong></p>
                <hr>
                <div class="form-inline">
                    I
                    <input type="text" class="form-control input-sm" name="name" value="${(driver.firstName)!} ${(driver.lastName)!}">
                    , give my employer
                    <input type="text" class="form-control input-sm" name="employer" value="${(company.name)!}">, permission to receive and
                    review my records in the accordance of the Fair Credit Reporting Act.
                </div>
                <br><br><br><br><br><br>
                <div>
                    <div class="pull-left">
                        Applicant Signature
                    </div>
                    <div class="col-xs-6">
                        <input type="text" class="form-control" name="signature">
                    </div>
                    <div class="col-xs-1 text-right">
                        Date
                    </div>
                    <div class="col-xs-3">
                        <input type="text" class="form-control" name="date">
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
