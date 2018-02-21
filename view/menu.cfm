<cfSet local.url = "" />
<cfIf url.ds NEQ "DS_APPCFADVSTU">
    <cfSet local.url = "?ds=#url.ds#" />
</cfIf>
<cfOutput>

<div class="panel panel-info">
    <cfif #session.user.type# EQ "facstaff">
        <div class="panel-heading">You are signed in as Faculty</div>
    <cfelseif #session.user.type# EQ "student">
        <div class="panel-heading">You are signed in as a student</div>
    </cfif>
    
    
    <div class="panel-body">

        <div class="col-md-4 margin-top">
            <a href="info-index.htm#local.url#" class="btn btn-primary btn-block padding-height"><i class="glyphicon glyphicon-info-sign"></i> Information</a>
        </div>
        <div class="col-md-4 margin-top">
            <a href="paperdraft-index.htm#local.url#" class="btn btn-primary btn-block padding-height"><i class="glyphicon glyphicon-pencil"></i> Paper Draft</a>
        </div>
        <div class="col-md-4 margin-top">
            <a href="finalportfolio-index.htm#local.url#" class="btn btn-primary btn-block padding-height"><i class="glyphicon glyphicon-folder-open"></i>  Final Portfolio</a>
        </div>
        <div class="col-md-4 margin-top">
            <a href="tutorial-index.htm#local.url#" class="btn btn-primary btn-block padding-height"><i class="glyphicon glyphicon-info-sign"></i> Tutorial</a>
        </div>
        <cfif #session.user.type# EQ "facstaff">
            <div class="col-md-4 margin-top">
            <a href="professor-index.htm#local.url#" class="btn btn-primary btn-block padding-height"><i class="glyphicon glyphicon-lock"></i> Teacher Only</a>
        </div>
        </cfif>    
    </div>
</div>

</cfOutput>

<cfIf listContainsNoCase("lindemae,snyderb,nelsnich", session.user.ldap) >
    <div class="well">
        <h5>Click on a link below to use a different datasource:</h5>
        <a href="menu.htm?ds=DS_APPCFADVSTU">DS_APPCFADVSTU (default)</a><br>
        <a href="menu.htm?ds=DS_APPCFADVSTU_HRFI">DS_APPCFADVSTU_HRFI</a><br>
        <a href="menu.htm?ds=AdviseListStuMajor_Test">AdviseListStuMajor_Test</a><br>
    </div>
</cfIf>
