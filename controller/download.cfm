<cfset filesPath="C:\workspace\www\gvsu\Writing Portfolio\files\documents\" />

<cfheader name="Content-Disposition" value="attachment; filename=#FileName#"/>

<cfcontent file="#filesPath#/#username#/#FileName#">