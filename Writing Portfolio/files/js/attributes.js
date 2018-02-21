$(document).ready(function() {

    $("#major").off("change").on("change", function(){
        $(".attribute-row").hide();

        if( $(this).val() == "NUR-B%|Nursing - BSN" ||
            $(this).val() == "NURX-B%|Nursing - RN - BSN" ) {
                $("#NURattributeRow").show();

        } else if( $(this).val() == "CS-B%|Computer Science - BA, BS" ||
                   $(this).val() == "INF-B%|Information Systems - BA, BS" ) {
                $("#CSattributeRow").show();

        } else if( $(this).val() == "EGR-B%@MEC|Engineering - Mechanical - BSE" ||
                   $(this).val() == "EGR-B%@EE|Engineering - Electrical - BSE" ||
                   $(this).val() == "EGR-B%@CE|Engineering - Computer - BSE" ||
                   $(this).val() == "EGR-B%@PDM|Engineering - Product Design and Manufacturing - BSE" ||
                   $(this).val() == "EGR-B%@ITD|Engineering - Interdisciplinary - BSE" ) {
                $("#EGattributeRow").show();

        } else if( $(this).val() == "ACC-B%|Accounting - BBA" ||
                   $(this).val() == "BECO-B%|Business Economics - BBA" ||
                   $(this).val() == "ECO-B%|Economics - BA, BS" ||
                   $(this).val() == "FIN-B%|Finance - BBA" ||
                   $(this).val() == "BUS-B%|Business General - BBA" ||
                   $(this).val() == "MGT-B%|Management - BBA" ||
                   $(this).val() == "MKT-B%|Marketing - BBA" ||
                   $(this).val() == "SCM-B%|Supply Chain Management - BBA" ||
                   $(this).val() == "IB-B%|International Business - BBA" ||
                   $(this).val() == "AHSC-B%@ASL|Allied Health Sciences - American Sign Language Interpretation - BS" ||
                   $(this).val() == "AHSC-B%@HIR|Allied Health Sciences - Health Info and Reimbursement-BS" ||
                   $(this).val() == "AHSC-B%@PDS|Allied Health Sciences - Pre-Dosimetry Studies - BS" ||
                   $(this).val() == "AHSC-B%@SLP|Allied Health Sciences - Pre-Health Speech Language Pathology - BS" ||
                   $(this).val() == "AHSC-B%@RSPC|Allied Health Sciences - Respiratory Care-BS (AHSC-RSPC-BS)" ||
                   $(this).val() == "DMS-B%@GEN|Diagnostic Medical Sonography - General - BS" ||
                   $(this).val() == "DMS-B%@ECV|Diagnostic Medical Sonography - Echocardiography & Vascular - BS" ||
                   $(this).val() == "DMS-B%@BRU|Diagnostic Medical Sonography - Breast Ultrasound - BS" ||
                   $(this).val() == "MLS-B%|Medical Laboratory Sciences - BS" ||
                   $(this).val() == "REC-B%|Therapeutic Recreation - BS" ||
                   $(this).val() == "RIS-B%|Radiologic and Imaging Science - BS" ||
                   $(this).val() == "RTR-B%|Radiation Therapy - BS" ||
                   $(this).val() == "EGR-B%@EG|Engineering Historic Non-Declared" ||
                   $(this).val() == "BECO-B%@GEN|Business Economics - General  - BBA" ||
                   $(this).val() == "BECO-B%@RE|Business Economics - Real Estate - BBA" ||
                   $(this).val() == "ECO-B%@ECHN|Economics - Honors Economics - BA, BS" ||
                   $(this).val() == "ENTR-B%|Entrepreneurship - BBA" ||
                   $(this).val() == "GNM-B%|General Management - BBA" ||
                   $(this).val() == "HRM-B%|Human Resources - BBA" ||
                   $(this).val() == "MGT-B%@GNM|Management - General Management - BBA" ||
                   $(this).val() == "MGT-B%@HRM|Management - Human Resources Management - BBA" ||
                   $(this).val() == "MGT-B%@MIS|Management - Management Information Systems - BBA" ||
                   $(this).val() == "MGT-B%@OPM|Management - Operations Management - BBA" ||
                   $(this).val() == "MKT-B%@DLO|Marketing - Distribution and Logistics - BBA" ||
                   $(this).val() == "MKT-B%@SAL|Marketing - Sales - BBA" ||
                   $(this).val() == "HIM-B%|Health Information Management - BS" ||
                   $(this).val() == "LSPS-PRCER%|Paralegal Studies - GVSU Certificate" ) {
                $("#CommonAttributeRow").show();
        }
    });

    $('#majorMinor').on('change', function() {
        if ($(this).val() === "major") {
            $("#major").attr("required",true);
        } else {
            $("#major").attr("required",false);
        }
    });

    $('#majorMinor').on('change', function() {
        if ($(this).val() === "minor") {
            $("#minor").attr("required",true);
        } else {
            $("#minor").attr("required",false);
        }
    });

});