<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="info-grade.htm">Grade Portfolio's</a>
    </li>
</ul><br>
<div class="col-sm-7">
    <div class="panel panel-primary menu">
        <div class="panel-heading">Submit Grade</div>
        <div class="panel-body">
            <div class="form-group">
                <form action="info-gradesubmitted.htm" method="post">
                    <input type="hidden" name="read" value='<cfoutput>#read#</cfoutput>'>
                    <input type="hidden" name="portfolioid" value='<cfoutput>#portfolioid#</cfoutput>'>
                    <input type="hidden" name="termcode" value='<cfoutput>#qryterm.termcode#</cfoutput>'>

                    <div class="form-group">
                        <label>Grade</label>
                        <select class="form-control" name="grade">
                    <option>A</option>
                    <option>B</option>
                    <option>C</option>
                    <option>D</option>
                    <option>E</option>
                    <option>F</option>
            </select>
                    </div>
                    <label>Comment</label>
                    <textarea class="form-control" rows="3" id="comment" name="comment"> </textarea><br>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
<cfif #read# eq 4>
    <div class="col-sm-12">
        <div class="panel panel-primary menu">
            <div class="panel-heading">Previous Grades and Comments</div>
            <div class="panel-body">
                <h4>Grade 1: <cfoutput>#qryhungjury.FIRSTREADGRADE#</cfoutput></h4>
                <textarea class="form-control" readonly rows="3" id="comment" name="comment"><cfoutput>#qryhungjury.FIRSTREADCOMMENTS#</cfoutput> </textarea>
                <h4>Grade 2: <cfoutput>#qryhungjury.SECONDREADGRADE#</cfoutput></h4>
                <textarea class="form-control" readonly rows="3" id="comment" name="comment"><cfoutput>#qryhungjury.SECONDREADCOMMENTS#</cfoutput> </textarea>
                <h4>Grade 3: <cfoutput>#qryhungjury.THIRDREADGRADE#</cfoutput></h4>
                <textarea class="form-control" readonly rows="3" id="comment" name="comment"><cfoutput>#qryhungjury.THIRDREADCOMMENTS#</cfoutput> </textarea>
            </div>
        </div>
    </div>
</cfif>
    </div>
<div class="col-sm-5">
    <div class="panel panel-primary menu">
        <div class="panel-heading">Portfolio Info</div>
        <div class="panel-body">
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Author
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#author#</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Read #
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#read#</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Professor
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>Prof ???</cfoutput>
                </div>
            </div>
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Grading Group
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#qrygradinggroup.groupnum#</cfoutput>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-12">
    <div class="panel panel-primary menu">
        <div class="panel-heading">
            Portfolio
        </div>
        <div class="panel-body">
            <cfoutput query="qryportfolio">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-8 text-left panel-title">#qryportfolio.title#</div>
                            <div class="col-md-5">by: #qryportfolio.createdby#</div>
                        </div>

                    </div>

                    <div class="panel-body">Description:<br> &nbsp #qryportfolio.description#<br><br>

                        <a href="download.htm?FileName=#qryportfolio.FILENAME#&username=#qryportfolio.CREATEDBY#"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-download-alt"></span> Download</button></a>
                    </div>
                </div>
            </cfoutput>
        </div>
    </div>
</div>
