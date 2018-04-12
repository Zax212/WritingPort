<cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryterm">
    SELECT stvterm_code AS termcode, stvterm_desc as term 
    FROM saturn.stvterm 
    WHERE TRUNC(stvterm_end_date) <= TRUNC(SYSDATE)
    ORDER BY termcode desc
    FETCH FIRST 9 rows only
</cfquery>
    
    <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qrygradinggroup">
        select distinct groupnum from gvsuowner.wp_grading_groups
    </cfquery>
    
    <cfquery datasource="DS_APPCFWRTPORTFOLIO" name="qryFaculty">
                SELECT 
                    distinct spriden_id AS gnumber,
                    gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_LAST') AS lastname
                    ,gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_FIRST') AS firstname,
                    sirasgn_term_code AS termcode
                    
                FROM
                    saturn.sirasgn
                        INNER JOIN saturn.spriden
                            ON  spriden_pidm = sirasgn_pidm
                            AND spriden_change_ind IS NULL
                        INNER JOIN saturn.ssbsect
                            ON  ssbsect_crn = sirasgn_crn
                            AND ssbsect_term_code = sirasgn_term_code
                        INNER JOIN general.gobtpac
                            ON  gobtpac_pidm = spriden_pidm
                WHERE
                    ssbsect_subj_code = 'WRT'
                    AND ssbsect_crse_numb = '150'
    </cfquery>