<!-- Error Check -->
<cfif (len(trim(form.title1)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=title">
</cfif>
<cfif (len(trim(form.description1)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=desc">
</cfif>
<cfif (len(trim(form.file1)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=file">
</cfif>
<cfif (len(trim(form.title2)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=title">
</cfif>
<cfif (len(trim(form.description2)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=desc">
</cfif>
<cfif (len(trim(form.file2)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=file">
</cfif>
<cfif (len(trim(form.title3)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=title">
</cfif>
<cfif (len(trim(form.description3)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=desc">
</cfif>
<cfif (len(trim(form.file3)) eq 0)>
    <cflocation url="finalportfolio-submitError.htm?error=file">
</cfif>
<cfif #finalPortfolio.recordCount# GT 0>
    <cflocation url="finalportfolio-submitError.htm?error=submitted">
</cfif>


<!--create folder with username if it doesnt exist -->
<cfif cgi.request_method EQ "post">
    <cfif directoryExists(local.filesPath & '\' & form.user)>
        <cfelse>
            <cfset directoryCreate(local.filesPath & '\' & form.user)>
    </cfif>
</cfif>

<!--Create portfolio uuid-->
        <cfset portfolioid = #createuuid()# />
        
<cffile action="upload" fileField="form.file1" destination="#local.filesPath#/#form.user#" nameconflict="makeunique"accept="application/pdf">
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryAddDraft1">
        INSERT INTO GVSUOWNER.wp_papers (CREATEDBY,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,PAPERID,PORTFOLIOID,CREATEDDT) VALUES ( '#form.user#', '#form.title1#', '#form.description1#', 0, '#CFFILE.SERVERFILE#','<cfoutput>#createuuid()#</cfoutput>','<cfoutput>#portfolioid#</cfoutput>',<cfoutput>#Now()#</cfoutput>)
    </cfQuery>
    <cffile action="upload" fileField="form.file2" destination="#local.filesPath#/#form.user#" nameconflict="makeunique"accept="application/pdf">
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryAddDraft2">
        INSERT INTO GVSUOWNER.wp_papers (CREATEDBY,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,PAPERID,PORTFOLIOID,CREATEDDT) VALUES ( '#form.user#', '#form.title2#', '#form.description2#', 0, '#CFFILE.SERVERFILE#','<cfoutput>#createuuid()#</cfoutput>','<cfoutput>#portfolioid#</cfoutput>',<cfoutput>#Now()#</cfoutput>)
    </cfQuery>
        <cffile action="upload" fileField="form.file3" destination="#local.filesPath#/#form.user#" nameconflict="makeunique"accept="application/pdf">
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryAddDraft3">
        INSERT INTO GVSUOWNER.wp_papers (CREATEDBY,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,PAPERID,PORTFOLIOID,CREATEDDT) VALUES ( '#form.user#', '#form.title3#', '#form.description3#', 0, '#CFFILE.SERVERFILE#','<cfoutput>#createuuid()#</cfoutput>','<cfoutput>#portfolioid#</cfoutput>',<cfoutput>#Now()#</cfoutput>)
    </cfQuery>
                        <!--Create portoflio row -->
            <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="createPortfolio">
                INSERT INTO GVSUOWNER.wp_portfolios (portfolioid,firstreaduserid,createdby,createddt) Values ('<cfoutput>#portfolioid#</cfoutput>','G01128406','#form.user#',<cfoutput>#Now()#</cfoutput>)</cfQuery>