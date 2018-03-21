<cfset local.filesPath=GetDirectoryFromPath(GetBaseTemplatePath()) & "files/documents">
    <cfset local.filesPath=# replacenocase( "#local.filesPath#", "\", "/", "ALL")#>

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


        <!--create folder with username if it doesnt exist -->
        <cfif cgi.request_method EQ "post">
            <cfif directoryExists(local.filesPath & '\' & form.user)>
                <cfelse>
                    <cfset directoryCreate(local.filesPath & '\' & form.user)>
            </cfif>
        </cfif>

        <cffile action="upload" fileField="form.uploadfile" destination="#local.filesPath#/#form.user#" nameconflict="makeunique">

            <cfQuery datasource="DS_GVINTRAAD" name="qryAddDraft">
                INSERT INTO wp_papers (USERNAME,TITLE,DESCRIPTION,DRAFTNUM,FILENAME,FINAL,FILEID,isDeleted) VALUES ( '#form.user#', '#form.title#', '#form.description#', #form.draftnum#, '#cffile.serverfile#', #form.final#,'
                <cfoutput>#createuuid()#</cfoutput>',0)
            </cfQuery>
