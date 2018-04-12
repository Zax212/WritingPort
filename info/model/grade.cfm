<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryterm">
    SELECT stvterm_code AS termcode, stvterm_desc as term
    FROM saturn.stvterm 
    WHERE TRUNC(stvterm_end_date) >= TRUNC(SYSDATE)
    ORDER BY termcode asc
    FETCH FIRST 1 rows only
</cfquery>

<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryGradingGroup">
    SELECT * FROM GVSUOWNER.WP_GRADING_GROUPS WHERE termcode = #qryterm.termcode# AND professor = '#session.user.gnumber#'
</cfquery>

<!--READS-->
<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryFirstRead">
    SELECT createdby, portfolioid FROM GVSUOWNER.wp_portfolios WHERE firstreaduserid = '#session.user.gnumber#' AND firstreadgrade IS NULL
</cfQuery>
<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qrySecondRead">
    SELECT createdby, portfolioid FROM GVSUOWNER.wp_portfolios WHERE secondreaduserid = '#session.user.gnumber#' AND secondreadgrade IS NULL
</cfQuery>

<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryThirdRead">
    SELECT createdby, portfolioid FROM GVSUOWNER.wp_portfolios WHERE firstreadgrade != 'null' AND secondreadgrade != 'null' AND thirdreaduserid IS NULL AND finalgrade IS NULL AND firstreaduserid != '#session.user.gnumber#' AND secondreaduserid != '#session.user.gnumber#' OR (thirdreaduserid = '#session.user.gnumber#' AND thirdreadgrade IS NULL)
</cfQuery>

<cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryhungjury">
    SELECT createdby, portfolioid FROM GVSUOWNER.wp_portfolios WHERE firstreadgrade != 'null' AND secondreadgrade != 'null' AND thirdreadgrade != 'null' AND finalgrade IS NULL AND firstreaduserid = '#session.user.gnumber#'
</cfQuery>
