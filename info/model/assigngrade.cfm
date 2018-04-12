<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryterm">
    SELECT stvterm_code AS termcode, stvterm_desc as term FROM saturn.stvterm WHERE TRUNC(stvterm_end_date) >= TRUNC(SYSDATE) ORDER BY termcode asc FETCH FIRST 1 rows only
</cfquery>

<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryportfolio">
    SELECT * FROM GVSUOWNER.wp_papers WHERE ISDELETED = 0 and portfolioid = '#portfolioid#'
</cfQuery>

<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryGradingGroup">
    SELECT groupnum FROM GVSUOWNER.WP_grading_groups WHERE termcode = #qryterm.termcode# AND professor = '#session.user.gnumber#'
</cfquery>

<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdateread3">
    UPDATE GVSUOWNER.wp_portfolios SET THIRDREADUSERID = '#session.user.gnumber#' WHERE portfolioid = '#portfolioid#' AND #read# = 3
</cfQuery>

<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryhungjury">
    SELECT FIRSTREADCOMMENTS, FIRSTREADGRADE, SECONDREADCOMMENTS, SECONDREADGRADE, THIRDREADCOMMENTS, THIRDREADGRADE
    FROM GVSUOWNER.wp_portfolios
    WHERE portfolioid = '#portfolioid#'
</cfQuery>