<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryGradingGroup">
    SELECT groupnum FROM GVSUOWNER.WP_grading_groups WHERE termcode = #form.termcode# AND professor = '#session.user.gnumber#'
</cfquery>

<!--READ 1-->
<cfif #form.read# eq 1>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryFindNextRead1">
        SELECT professor FROM GVSUOWNER.WP_grading_groups WHERE termcode = #form.termcode# AND professor != '#session.user.gnumber#' AND groupnum = #qryGradingGroup.groupnum# ORDER BY dbms_random.value FETCH FIRST 1 rows only
    </cfQuery>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdategrade1">
        UPDATE GVSUOWNER.wp_portfolios SET FIRSTREADGRADE = '#form.grade#', FIRSTREADCOMMENTS = '#form.comment#', SECONDREADUSERID = '#qryFindNextRead1.professor#' WHERE portfolioid = '#form.portfolioid#'
    </cfQuery>
</cfif>


<!--READ 2-->
<cfif #form.read# eq 2>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdategrade2">
        UPDATE GVSUOWNER.wp_portfolios SET SECONDREADGRADE = '#form.grade#', SECONDREADCOMMENTS = '#form.comment#' WHERE portfolioid = '#form.portfolioid#'
    </cfQuery>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qrycheckportfoliograde2">
        SELECT FIRSTREADGRADE, SECONDREADGRADE FROM GVSUOWNER.WP_PORTFOLIOS WHERE PORTFOLIOID = '#form.portfolioid#'
    </cfQuery>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdatefinalgrade2">
        UPDATE GVSUOWNER.wp_portfolios SET FINALGRADE = '#form.grade#' WHERE portfolioid = '#form.portfolioid#' AND '#qrycheckportfoliograde2.firstreadgrade#' = '#qrycheckportfoliograde2.secondreadgrade#'
    </cfQuery>
</cfif>

<!--READ 3-->
<cfif #form.read# eq 3>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdategrade3">
        UPDATE GVSUOWNER.wp_portfolios SET THIRDREADGRADE = '#form.grade#', THIRDREADCOMMENTS = '#form.comment#' WHERE portfolioid = '#form.portfolioid#'
    </cfQuery>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qrycheckportfoliograde3">
        SELECT FIRSTREADGRADE, SECONDREADGRADE, THIRDREADGRADE FROM GVSUOWNER.WP_PORTFOLIOS WHERE PORTFOLIOID = '#form.portfolioid#'
    </cfQuery>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdatefinalgrade3">
        UPDATE GVSUOWNER.wp_portfolios SET FINALGRADE = '#form.grade#' WHERE portfolioid = '#form.portfolioid#' AND ( '#qrycheckportfoliograde3.firstreadgrade#' = '#qrycheckportfoliograde3.secondreadgrade#' OR '#qrycheckportfoliograde3.firstreadgrade#' = '#qrycheckportfoliograde3.thirdreadgrade#' OR '#qrycheckportfoliograde3.thirdreadgrade#' = '#qrycheckportfoliograde3.secondreadgrade#')
    </cfQuery>
</cfif>

<!--READ 4-->
<cfif #form.read# eq 4>
    <cfQuery datasource="DS_APPCFWRTPORTFOLIO" name="qryupdategrade3">
        UPDATE GVSUOWNER.wp_portfolios SET FINALGRADE = '#form.grade#', FINALGRADECOMMENTS = '#form.comment#' WHERE portfolioid = '#form.portfolioid#'
    </cfQuery>
</cfif>
