<cfheader name="Content-Disposition" value="attachment; filename=#FileName#"/>

<cfcontent file="#local.filesPath#/#username#/#FileName#">