<cfset filesPath="C:\workspace\www\gvsu\Writing Portfolio\files\documents\"/>

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
<cfif #finalPortfolio.recordcount# GT 0>
        <cflocation url="finalportfolio-submitError.htm?error=submitted">
</cfif>


<!--create folder with username if it doesnt exist -->
<cfif cgi.request_method EQ "post">
    <cfif directoryExists(filesPath & '\' & form.user)>
    <cfelse>
        <cfset directoryCreate(filesPath & '\' & form.user)> 
    </cfif>
</cfif>

            
<cffile action="upload" fileField="form.file1" destination="#filesPath#/#form.user#" nameconflict="makeunique">
    <cfQuery datasource="DS_GVINTRAAD" name="qryAddDraft">
        INSERT INTO writingdummy (USERNAME,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,FINAL,FILEID) VALUES ( '#form.user#', '#form.title1#', '#form.description1#', 0, '#CFFILE.SERVERFILE#', #form.final#,'<cfoutput>#createuuid()#</cfoutput>')
    </cfQuery>
    
<cffile action="upload" fileField="form.file2" destination="#filesPath#/#form.user#" nameconflict="makeunique">
    <cfQuery datasource="DS_GVINTRAAD" name="qryAddDraft">
        INSERT INTO writingdummy (USERNAME,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,FINAL,FILEID) VALUES ( '#form.user#', '#form.title2#', '#form.description2#', 0, '#CFFILE.SERVERFILE#', #form.final#,'<cfoutput>#createuuid()#</cfoutput>')
    </cfQuery>
    
<cffile action="upload" fileField="form.file3" destination="#filesPath#/#form.user#" nameconflict="makeunique">
    <cfQuery datasource="DS_GVINTRAAD" name="qryAddDraft">
        INSERT INTO writingdummy (USERNAME,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,FINAL,FILEID) VALUES ( '#form.user#', '#form.title3#', '#form.description3#', 0, '#CFFILE.SERVERFILE#', #form.final#,'<cfoutput>#createuuid()#</cfoutput>')
    </cfQuery>





<h2>The Following Portfolio Was Submitted</h2>
   
<table class="table">
    <thead>
        <tr>
            <th>User</th>
            <th>Title</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><cfdump var="#form.user#"></td>
            <td><cfdump var="#form.title1#"></td>
            <td><cfdump var="#form.description1#"></td>
        </tr>
        <tr>
            <td><cfdump var="#form.user#"></td>
            <td><cfdump var="#form.title2#"></td>
            <td><cfdump var="#form.description2#"></td>
        </tr>
        <tr>
            <td><cfdump var="#form.user#"></td>
            <td><cfdump var="#form.title3#"></td>
            <td><cfdump var="#form.description3#"></td>
        </tr>
    </tbody>
</table>

