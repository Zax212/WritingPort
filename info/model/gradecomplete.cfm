<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qrygradecomplete">
    SELECT * FROM GVSUOWNER.WP_PORTFOLIOS WHERE FIRSTREADUSERID = '#session.user.gnumber#' AND FINALGRADE != 'null'
</cfquery>