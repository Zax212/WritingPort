<cfSwitch expression="#sb.page#">
    <cfCase value="index">
        <cfParam name="url.error" default="" />
        <cfParam name="url.goto" default="" />
    </cfCase>
    <cfCase value="login_post">
        <cfParam name="url.goto" default="" />
    </cfCase>
    <cfCase value="menu">
        <cfIf NOT isDefined("session.user.access")>
            <cfSet sb.useRedirect ="loginerror.htm?error=user" />
        </cfIf>
    </cfCase>
</cfSwitch>

<cfSet session.cfc = "Writing Portfolio.files.cfc" />

<cfParam name="url.ds" default="DS_APPCFADVSTU" />
<!--- 
    To use a different datasource, add ?ds=DATASOURCE to the URL in the browser
    Other Datasources:
    DS_APPCFADVSTU_HRFI
    DS_APPCFADVSTU
    AdviseListStuMajor_Test
 --->