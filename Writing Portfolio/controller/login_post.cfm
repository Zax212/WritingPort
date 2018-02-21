<!---
    DATE        DEVELOPER       DESCRIPTION
    07/23/2010  Brian Snyder    File Created
--->
<cfIf NOT isDefined("session.user.ldap")>

        <cfTry>
            <cfIf cgi.http_host NEQ "localhost">
                <cfLdap
                    server="auth-office.ldap.gvsu.edu"
                    port="636"
                    secure="CFSSL_BASIC"
                    username="CN=imauth-lds,OU=LDS-SEARCH-USERS,DC=OFFICELDS"
                    password="st@nley.b0st1tch"
                    action="query"
                    name="qryUser"
                    scope="subtree"
                    start="OU=DEPARTMENTS,DC=OFFICELDS"
                    attributes="dn,cn,displayname,department"
                    filter="DisplayName=#session.user.id#"
                />
            <cfElse>
                <cfSet qryUser = queryNew("dn") />
                <cfSet queryAddRow(qryUser) />
                <cfSet querySetCell(qryUser,"dn","CN=LOCAL ADMIN, OU=IT-ADMIN, OU=DEPARTMENTS, DC=OFFICELDS") />
            </cfIf>
            <cfIf isDefined("qryUser.recordCount")>
                <cfIf qryUser.recordCount EQ 0>
                    <cfSet sb.useRedirect = "loginerror.htm?error=user" />
                <cfElse>
                    <cfSet local.container = #trim(listGetAt(trim(listGetAt(qryUser.dn, 2)), 2, "="))# />

                    <cfIf listContainsNoCase(
                                "IT-CONSULT
                                ,IT-HELPDESK-L1
                                ,IT-SETUP
                                ,RETIREE
                                ,TRADE-INST
                                ,TSCONTRACT
                                ,CAMP
                                ,MAREC
                                ,OLYMPIAD"
                                ,local.container) >
                        <cfSet sb.useRedirect ="loginerror.htm?error=noaccess" />
                    </cfIf>
                </cfIf>
            <cfElse>
                <cfSet sb.useRedirect ="loginerror.htm?error=user" />
            </cfIf>
            <cfCatch type="Any">
                <cfSet sb.useRedirect ="loginerror.htm?error=user" />
            </cfCatch>

        </cfTry>

        <cfIf isDefined("local.container")>
            <cfSet session.user.ldap = session.user.id />
            <cfSet session.user.container = local.container />
            <cfSet session.user.access = "" />
            <!--- Setup User Access Rights --->
            <cfQuery datasource="DS_GVINTRAAD" name="qrySecureContainer">
                SELECT
                    section
                FROM
                    gvintraad.bapps_secure
                WHERE
                    secure_by = <cfQueryParam value="container" />
                    AND identifier = <cfQueryParam value="#lCase(session.user.container)#" />
            </cfQuery>
            <cfLoop query="qrySecureContainer">
                <cfSet session.user.access = listAppend(session.user.access, #qrySecureContainer.section#) />
            </cfLoop>
         <cfElse>
            <!--- If the user doesn't have a container defined by the cfLdap lookup then they don't have access --->
            <cfSet sb.useRedirect ="loginerror.htm?error=noaccess" />
        </cfIf>
    </cfIf>
    <cfIf isDefined("session.user.access")>
        <cfIf url.goto EQ "">
            <cfSet sb.useRedirect = "menu.htm" />
        <cfElse>
            <cfSet sb.useRedirect = form.goto />
        </cfIf>
    <cfElse>
        <cfSet sb.useRedirect ="loginerror.htm?error=user" />
    </cfIf>