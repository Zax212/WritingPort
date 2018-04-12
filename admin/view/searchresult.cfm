<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="admin-search.htm">Search Again</a>
    </li>
</ul>
    <h3>Search Results:</h3>
    <cfif #form.type# eq "professorsearch">
        <cfset filename=dateFormat(now(), 'yyyy-mm-dd')&'-' & '#form.prof#' & '.xls'>
        
        <cfset excel=spreadsheetNew( "Profsearch")>
            <cfset spreadsheetaddcolumn(excel,"Grade")>
            <cfset spreadsheetAddRows(excel, qryprofsearch)>
                <cfheader name="Content-Disposition" value="attachment; filename=#filename#">
                    <cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(excel)#">
    </cfif>
    <cfif #form.type# eq "termsearch">
        <cfset filename=dateFormat(now(), 'yyyy-mm-dd')&'-' & '#form.term#' & '.xls'>
        <cfset excel=spreadsheetNew( "Termsearch")>
                <cfset spreadsheetaddcolumn(excel,"FirstGrade")>
                <cfset spreadsheetaddcolumn(excel,"SecondGrade")>
                <cfset spreadsheetaddcolumn(excel,"ThirdGrade")>
                <cfset spreadsheetaddcolumn(excel,"FinalGrade")>
            <cfset spreadsheetAddRows(excel, qrytermsearch)>
                <cfheader name="Content-Disposition" value="attachment; filename=#filename#">
                    <cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(excel)#">
    </cfif>
    <cfif #form.type# eq "gradegroupsearch">
        <cfset filename=dateFormat(now(), 'yyyy-mm-dd')&'-' & '#form.term#' &'-' &'#form.gradinggroup#' & '.xls'>
        <cfset excel=spreadsheetNew( "GradingGroupsearch")>
            <cfset spreadsheetaddcolumn(excel,"Grade")>
            <cfset spreadsheetAddRows(excel, qrygradingroupsearch)>
                <cfheader name="Content-Disposition" value="attachment; filename=#filename#">
                    <cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(excel)#">
    </cfif>
