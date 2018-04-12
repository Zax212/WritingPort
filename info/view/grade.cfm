<h2>
    Grade Portfolio's
</h2>
<div class="col-sm-3">
    <div class="panel panel-primary menu">
        <div class="panel-heading">Account Info</div>
        <div class="panel-body">
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Name
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#session.user.firstname# #session.user.lastname#</cfoutput>
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
            <div class="row pad-bottom">
                <div class="col-xs-4 text-muted nowrap">
                    Current Term
                </div>
                <div class="col-xs-8 text-primary">
                    <cfoutput>#qryterm.term#</cfoutput>
                </div>
            </div><br>
            <form action="info-gradecomplete.htm">
                <button type="submit" class="btn btn-primary ">Grade Completed</button>
            </form>

        </div>
    </div>
    <div class="panel panel-primary menu">
        <div class="panel-heading">
            GVSU - <strong>Third Read Queue and Hung Jury</strong>
        </div>
        <div class="panel-body">
            <div class="col-sm-12">
                <div class="list-group">
                    <div class="list-group-item list-group-item-success">
                        Third Read
                    </div>

                    <cfoutput query="qryThirdRead">
                        <a href="info-assigngrade.htm?author=#qryThirdRead.createdby#&portfolioid=#qryThirdRead.portfolioid#&read=3" class="list-group-item">
                    <span class="glyphicon glyphicon-user"></span> #qryThirdRead.createdby#
                </a>
                    </cfoutput>
                </div><br>
                <div class="list-group">
                    <div class="list-group-item list-group-item-success">
                        Hung Jury
                    </div>

                    <cfoutput query="qryhungjury">
                        <a href="info-assigngrade.htm?author=#qryhungjury.createdby#&portfolioid=#qryhungjury.portfolioid#&read=4" class="list-group-item">
                    <span class="glyphicon glyphicon-user"></span> #qryhungjury.createdby#
                </a>
                    </cfoutput>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-sm-9">
    <div class="panel panel-primary menu">
        <div class="panel-heading">
            GVSU - <strong>Remaining Portfolio's</strong>
        </div>
        <div class="panel-body">
            <div class="col-sm-6">
                <div class="list-group">
                    <div class="list-group-item list-group-item-success">
                        First Read
                    </div>

                    <cfoutput query="qryFirstRead">
                        <a href="info-assigngrade.htm?author=#qryFirstRead.createdby#&portfolioid=#qryFirstRead.portfolioid#&read=1" class="list-group-item">
                    <span class="glyphicon glyphicon-user"></span> #qryFirstRead.createdby#
                </a>
                    </cfoutput>

                </div>
            </div>
            <div class="col-sm-6">
                <div class="list-group">
                    <div class="list-group-item list-group-item-success">
                        Second Read
                    </div>

                    <cfoutput query="qrySecondRead">
                        <a href="info-assigngrade.htm?author=#qrySecondRead.createdby#&portfolioid=#qrySecondRead.portfolioid#&read=2" class="list-group-item">
                    <span class="glyphicon glyphicon-user"></span> #qrySecondRead.createdby#
                </a>
                    </cfoutput>
                </div>
            </div>
        </div>
    </div>
</div>
