/*
    Search Functionality
    NOTE: You MUST include JQuery for this functionality to work
*/

$(document).ready(function() {
    // Search College
    $("#division").off("change").on("change", function(){
        getColleges( $(this).val(), $("#college") );
        getDivisionUnits( $(this).val(), $("#unit") );
    });

    // Search Unit
    $("#college").off("change").on("change", function(){
        getCollegeUnits( $(this).val(), $("#unit") );
    }); 
});

function getColleges( divisionId, collegeSelect ) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "getColleges",
            divisionId: divisionId
        },
        beforeSend: function() {
        },
        success: function( results ) {
            $(collegeSelect).empty();
            $(collegeSelect).append($("<option></option>").attr("value","").text("-"));
            $.each(results.DATA, function(key, value) {
                $(collegeSelect).append($("<option></option>").attr("value",value[0]).text(value[1]));
            });
        }
    });
}

function getDivisionUnits( divisionId, unitSelect ) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "getDivisionUnits",
            divisionId: divisionId
        },
        beforeSend: function() {
        },
        success: function( results ) {
            $(unitSelect).empty();
            $(unitSelect).append($("<option></option>").attr("value","").text("-"));
            $.each(results.DATA, function(key, value) {
                $(unitSelect).append($("<option></option>").attr("value",value[0]).text(value[1]));
            });
        }
    });
}

function getCollegeUnits( collegeId, unitSelect ) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "getCollegeUnits",
            collegeId: collegeId
        },
        beforeSend: function() {
        },
        success: function( results ) {
            $(unitSelect).empty();
            $(unitSelect).append($("<option></option>").attr("value","").text("-"));
            $.each(results.DATA, function(key, value) {
                $(unitSelect).append($("<option></option>").attr("value",value[0]).text(value[1]));
            });
        }
    });
}

function searchCollege(str,str2) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "searchCollege",
            find: str,
            filter: str2
        },
        // todo add loading div/animation
        beforeSend: function() {
            $("#loading").show();
        },
        success: function( results ) {
            $("#user_ajax_results").empty();
            $("#user_ajax_results").html( "<label>College:</label><select id='ajax_result' name='ajax_result'><option value='none'>-</option><option  value='" + results.DATA[0][0] + "'>" +results.DATA[0][1] + "</option></select><br><input type='hidden' id='ajax_class' name='ajax_class' value='College'/>");
            $("#loading").hide();
        }
    });
}

function searchDivision(str) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "searchDivision",
            find: str
        },
        // todo add loading div/animation
        beforeSend: function() {
            $("#loading").show();
        },
        success: function( results ) {
            $("#user_ajax_results").empty();
            $("#user_ajax_results").html( "<label>Division:</label><select id='ajax_result' name='ajax_result'><option value='none'>-</option><option value='" + results.DATA[0][0] + "'>" +results.DATA[0][1] + "</option></select><br><input type='hidden' id='ajax_class' name='ajax_class' value='Division'/>");
            $("#loading").hide();
        }
    });
}

function searchUnit(str,str2) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "searchUnit",
            find: str,
            filter: str2
        },
        // todo add loading div/animation
        beforeSend: function() {
            $("#loading").show();
        },
        success: function( results ) {
            $("#user_ajax_results").empty();
            $("#user_ajax_results").html( "<label>Unit:</label><select id='ajax_result' name='ajax_result'><option value='none'>-</option><option value='" + results.DATA[0][0] + "'>" +results.DATA[0][1] + "</option></select><br><input type='hidden' id='ajax_class' name='ajax_class' value='Unit'/>");
            $("#loading").hide();
        }
    });
}

// search for strategic plan
function searchSP(str) {
    var request = $.ajax({
        url: "files/cfc/functions.cfc",
        dataType: "json",
        data: {
            method: "searchSP",
            find: str
        },
        // todo add loading div/animation
        beforeSend: function() {
            $("#loading").show();
        },
        success: function( results ) {
            $("#sp_result").empty();
            $("#sp_result").html("<div class='offset1 span7'> <h2>" + results.DATA[0][6] + "<br>Strategic Plan</h2><h3>Mission:</h3>" + decodeURI(results.DATA[0][7]) + "<br><br><h3>Vision:</h3>" + decodeURI(results.DATA[0][8]) + "<br><br><h3>Values:</h3>" + decodeURI(results.DATA[0][9]).replace('\r\n','<br><br>').replace('\n','<br><br>') + '<br><br></div>');
            var lag_goal ='';
            $.each(results.DATA,function(){
                if (lag_goal == this[4]){
                    
                }
                else {
                    $("#sp_result").append("<br><div id='goal" + String(this[3]).split('.')[0] + "' class='well span7 offset1'><h2>Goal " + decodeURI(this[4]) + "</h2><h3>" + decodeURI(this[0])+ "</h3><hr>");      
                    if (this[1])
                    {
                        $("#goal"+String(decodeURI(this[3])).split('.')[0]+'').append("<h4>Objective " + decodeURI(this[3]) + "</h4><p>" + decodeURI(this[1]) + "</p>");
                       if(this[2]){
                        $("#goal"+String(decodeURI(this[3])).split('.')[0]+'').append("<ul><h4>Sub Objective " + decodeURI(this[5]) + "</h4><p>" + decodeURI(this[2]) + "</p><ul>");
                       }
                       $("#goal"+String(decodeURI(this[3])).split('.')[0]+'').append("</div>");
                    }
                    
                    
                }
                lag_goal = decodeURI(this[4]);

            });
            
            $("#loading").hide();
        }
    });
}

var load = 100;
var delay = (function(){
    var timer = 0;
    return function( callback, ms ) {
        clearTimeout( timer );
        timer = setTimeout( callback, ms );
    };
})();

