<!--Left(#FileName#, len(#FileName#)-4) -->

<cfheader name="Content-Disposition" value="attachment; filename=#FileName#"/>

<cfcontent file="C:\workspace\www\gvsu\Writing Portfolio\files\documents/#FileName#">