<h2>
    Welcome to GVSU's Writing Portfolio System!
</h2><br>
<div class="panel panel-primary menu">
    <div class="panel-heading">
        GVSU - <strong>Writing Portfolio System</strong>
    </div>
    <div class="panel-body">
        <div class="col-sm-4">
            <div class="list-group">
                <div class="list-group-item list-group-item-success">
                    User Information
                </div>

                <a href="info-index.htm" class="list-group-item">
                <span class="glyphicon glyphicon-user"></span> User Information</a>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="list-group">
                <div class="list-group-item list-group-item-success">
                    Paper's
                </div>
                <a href="paperdraft-index.htm" class="list-group-item">
                <span class="glyphicon glyphicon-pencil"></span> View Draft's
                        </a>
                <a href="paperdraft-submit.htm" class="list-group-item">
                <span class="glyphicon glyphicon-pencil"></span> Submit a Draft</a>
                <a href="finalportfolio-index.htm" class="list-group-item">
                <span class="glyphicon glyphicon-book"></span> Submit a Final Portfolio</a>
            </div>
        </div>

        <cfif session.user.admin>
            <div class="col-sm-4">
                <div class="list-group">
                    <div class="list-group-item list-group-item-success">
                        Admin Control's
                    </div>
                    <a href="admin-draft.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-tower"></span> View all Draft's
                        </a>
                    <a href="admin-index.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-tower"></span> System Settings
                        </a>
                    <a href="admin-gradingGroup.htm" class="list-group-item">
                    <span class="glyphicon glyphicon-tower"></span> View/Modify Grading Groups
                        </a>
                </div>
            </div>
        </cfif>
    </div>
</div>
