<cfif #error# eq "title">
    <h3>You did not enter a title</h3>
</cfif>
<cfif #error# eq "desc">
    <h3>You did not enter a description</h3>
</cfif>
<cfif #error# eq "file">
    <h3>You did not add a file</h3>
</cfif>
<cfif #error# eq "submitted">
    <h3>You already submitted a Portfolio</h3>
</cfif>
<br><br>
<div class="col-md-4 margin-top">
    <a href="finalportfolio-submit.htm#local.url#" class="btn btn-primary btn-block padding-height">Go Back</a>
</div>