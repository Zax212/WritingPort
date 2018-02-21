<!--check if error with form data -->
<cfif (len(trim(form.title)) eq 0)>
    <cflocation url="paperdraft-submitError.htm?error=title">
</cfif>
<cfif (len(trim(form.description)) eq 0)>
    <cflocation url="paperdraft-submitError.htm?error=desc">
</cfif>
<cfif (len(trim(form.uploadfile)) eq 0)>
    <cflocation url="paperdraft-submitError.htm?error=file">
</cfif>


<cfset filesPath="C:\workspace\www\gvsu\Writing Portfolio\files\documents\"/>

<!--create folder with username if it doesnt exist -->
<cfif cgi.request_method EQ "post">
    <cfif directoryExists(filesPath & '\' & form.user)>
    <cfelse>
        <cfset directoryCreate(filesPath & '\' & form.user)> 
    </cfif>
</cfif>

<cffile action="upload" fileField="form.uploadfile" destination="#filesPath#/#form.user#" nameconflict="makeunique">

    <cfQuery datasource="DS_GVINTRAAD" name="qryAddDraft">
        INSERT INTO writingdummy (USERNAME,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,FINAL,FILEID) VALUES ( '#form.user#', '#form.title#', '#form.description#', #form.draftnum#, '#cffile.serverfile#', #form.final#,'<cfoutput>#createuuid()#</cfoutput>')
    </cfQuery>