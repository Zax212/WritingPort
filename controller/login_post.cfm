<cfIf NOT isDefined("session.user.role")>
    <cfQuery datasource ="DS_APPCFWRTPORTFOLIO" name="qryCheckUser">
        SELECT
            role
            ,gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_LAST') AS lastname
            ,gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_FIRST') AS firstname
            ,spriden_id AS gnumber
        FROM
            gvsuowner.wp_users
                INNER JOIN general.gobtpac
                    ON UPPER(gobtpac_ldap_user) = UPPER(ldap)
                INNER JOIN saturn.spriden
                    ON spriden_pidm = gobtpac_pidm
        WHERE
            UPPER(ldap) = <cfQueryParam value="#uCase(session.user.id)#" />
            AND isDeleted <> '1'
            AND spriden_change_ind IS NULL
    </cfQuery>
       
    <cfIf qryCheckUser.recordCount EQ 1>
        <!--- User Exists in the User Table --->
        <cfSet session.user.role = qryCheckUser.role />
        <cfSet session.user.firstname = qryCheckUser.firstname />
        <cfSet session.user.lastname = qryCheckUser.lastname />
        <cfSet session.user.gnumber = qryCheckUser.gnumber />

        <cfSet sb.useRedirect = "menu.htm" />

    <cfElse>
        <!--- Check Banner to see if the user is a student or faculty currently in the WRT150 class --->
        <cfQuery datasource ="DS_APPCFWRTPORTFOLIO" name="qryClass">
            SELECT
                *
            FROM (
                SELECT
                    gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_LAST') AS lastname
                    ,gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_FIRST') AS firstname
                    ,spriden_id AS gnumber
                    ,UPPER(gobtpac_ldap_user) AS ldap
                    ,ssbsect_subj_code||ssbsect_crse_numb||'-'||ssbsect_seq_numb AS course
                    ,'FACULTY' AS role
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
                    sirasgn_term_code = (
                        SELECT MIN(stvterm_code)
                        FROM saturn.stvterm
                        WHERE TRUNC(stvterm_end_date) >= TRUNC(SYSDATE)
                    )
                    AND ssbsect_subj_code = 'WRT'
                    AND ssbsect_crse_numb = '150'
                UNION ALL
                SELECT
                    gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_LAST') AS lastname
                    ,gokname.f_get_name(p_pidm => spriden_pidm, p_usage => 'GVNAME_FIRST') AS firstname
                    ,spriden_id AS gnumber
                    ,UPPER(gobtpac_external_user) AS ldap
                    ,ssbsect_subj_code||ssbsect_crse_numb||'-'||ssbsect_seq_numb AS course
                    ,'STUDENT' AS role
                FROM
                    saturn.sfrstcr
                        INNER JOIN saturn.spriden
                            ON  spriden_pidm = sfrstcr_pidm
                            AND spriden_change_ind IS NULL
                        INNER JOIN saturn.ssbsect
                            ON  ssbsect_crn = sfrstcr_crn
                            AND ssbsect_term_code = sfrstcr_term_code
                        INNER JOIN general.gobtpac
                            ON  gobtpac_pidm = spriden_pidm
                WHERE
                    sfrstcr_term_code = (
                        SELECT MIN(stvterm_code)
                        FROM saturn.stvterm
                        WHERE TRUNC(stvterm_end_date) >= TRUNC(SYSDATE)
                    )
                    AND ssbsect_subj_code = 'WRT'
                    AND ssbsect_crse_numb = '150'
            )
            WHERE
                UPPER(ldap) = <cfQueryParam value="#uCase(session.user.id)#" />
        </cfQuery>

        <cfIf qryClass.recordCount GT 0>
            <!--- User is in the class. Setup Session Variables --->
            <cfSet session.user.role = qryClass.role />
            <cfSet session.user.firstname = qryClass.firstName />
            <cfSet session.user.lastname = qryClass.lastName />
            <cfSet session.user.gnumber = qryClass.gnumber />
            <cfLoop query="qryClass">
                <cfSet session.user.classes = listAppend(session.user.classes, qryClass.course ) />
            </cfLoop>
            <cfSet sb.useRedirect = "menu.htm" />
        <cfElse>
            <!--- Redirect user to noaccess if not allowed in --->
            <cfSet sb.useRedirect = "noaccess.htm" />
        </cfIf>
    </cfIf>

<cfElse>
    <!--- Already Logged on --->
    <cfSet sb.useRedirect = "menu.htm" /> 
</cfIf>