<cfif session.user.role eq 'ADMIN'>
    
    <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryterm">
    SELECT stvterm_start_date AS startdate, stvterm_end_date AS enddate 
    FROM saturn.stvterm 
    WHERE stvterm_code = #form.term#
</cfquery>
    
    <cfif #form.type# eq "professorsearch">
       <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryprofsearch">
            SELECT FIRSTREADGRADE AS grade
            FROM GVSUOWNER.WP_PORTFOLIOS
            WHERE FIRSTREADUSERID = '#form.prof#' AND CREATEDDT > to_date(substr('#qryterm.startdate#',1,10), 'YYYY-MM-DD') AND CREATEDDT < to_date(substr('#qryterm.enddate#',1,10), 'YYYY-MM-DD')
           UNION
            SELECT SECONDREADGRADE AS grade
            FROM GVSUOWNER.WP_PORTFOLIOS
            WHERE SECONDREADUSERID = '#form.prof#' AND CREATEDDT > to_date(substr('#qryterm.startdate#',1,10), 'YYYY-MM-DD') AND CREATEDDT < to_date(substr('#qryterm.enddate#',1,10), 'YYYY-MM-DD')
           UNION
           SELECT THIRDREADGRADE AS grade
            FROM GVSUOWNER.WP_PORTFOLIOS
            WHERE SECONDREADUSERID = '#form.prof#' AND CREATEDDT > to_date(substr('#qryterm.startdate#',1,10), 'YYYY-MM-DD') AND CREATEDDT < to_date(substr('#qryterm.enddate#',1,10), 'YYYY-MM-DD')                  
        </cfquery>
        
    </cfif>
    <cfif #form.type# eq "termsearch">
        <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qrytermsearch">
            SELECT FIRSTREADGRADE,SECONDREADGRADE,THIRDREADGRADE,FINALGRADE
            FROM GVSUOWNER.WP_PORTFOLIOS
            WHERE CREATEDDT > to_date(substr('#qryterm.startdate#',1,10), 'YYYY-MM-DD') AND CREATEDDT < to_date(substr('#qryterm.enddate#',1,10), 'YYYY-MM-DD')     
        </cfquery>
        
    </cfif>
    <cfif #form.type# eq "gradegroupsearch">

        <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryprofsingroup">
            SELECT professor
            FROM GVSUOWNER.WP_GRADING_GROUPS
            WHERE to_char(TERMCODE) = '#form.term#' AND GROUPNUM = #form.gradinggroup#
        </cfquery>
        
        <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qrygradingroupsearch">
            SELECT FINALGRADE
            FROM GVSUOWNER.WP_PORTFOLIOS
            WHERE CREATEDDT > to_date(substr('#qryterm.startdate#',1,10), 'YYYY-MM-DD') AND CREATEDDT < to_date(substr('#qryterm.enddate#',1,10), 'YYYY-MM-DD')  AND firstreaduserid = '#qryprofsingroup.professor#'   
        </cfquery>

        
    </cfif>
</cfif>