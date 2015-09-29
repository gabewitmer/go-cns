<!-- login error -->
<#if RequestParameters.error??>
	<div class="alert alert-danger alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		Invalid username or password. Please try again.
	</div>
</#if>

<!-- delete object alert -->
<div id="deleteAlert" class="alert alert-danger clearfix hide">
	<form id="deleteForm" action="" method="post" class="col-lg-2">
		<button id="delete" class="btn btn-danger btn-sm">Yes</button>
		<a id="deleteCancel" class="btn btn-default btn-sm">No</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<span id="message"></span>
</div>

<!-- other alerts -->
<#if alert??>
	<div class="alert alert-info alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		${alert}
	</div>
<#elseif alertError??/>
	<div class="alert alert-danger alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		${alertError}
	</div>
<#elseif alertSuccess??/>
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		${alertSuccess}
	</div>
</#if>
