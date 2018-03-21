<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>
        <cfOutput>#sb.title#</cfOutput>
    </title>
    <link href="files/css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script type="text/javascript" src="files/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="files/js/controller.js"></script>
    <script type="text/javascript" src="files/js/help.js"></script>
    <link href="files/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="files/js/bootstrap.min.js"></script>
    <script src="files/js/common.js"></script>
</head>

<body style="background-color: #88B3DA;">
    <cf_header>
        <div id="container">
                <cfif isDefined( "session.user.admin")>
                        <div id="site-title">
                            <div id="navbuttons">
                                <ul class="nav nav-pills">
                                    <cfif session.user.admin>
                                        <li><a class="text-white" href="admin-index.htm">Admin</a></li>
                                    </cfif>
                                    <li><a class=tab-pane fade in active href="menu.htm">Menu</a></li>
                                    <li><a class="text-white" href="info-index.htm">User Information</a></li>
                                    <li><a class="text-white" href="paperdraft-index.htm">Draft's</a></li>
                                    <li><a class="text-white" href="finalportfolio-index.htm">Final Portfolio</a></li>
                                    <li><a class="text-white" href="logoff.htm">Logout</a></li>
                                </ul>
                            </div>
                            <h1><cfOutput>#sb.title#</cfOutput></h1>
                        </div>
                        <div id="content">
                            <cfOutput>#sb.content#</cfOutput>
                             <div class="clearfix"></div>
                        </div>
                        <div id="footer">
                            <p>
                                <cfOutput>
                                    &copy;#year(now())# <a href="/writingportfolio">#sb.title#</a>
                                </cfOutput>
                            </p>
                        </div>
                    
                </div>  
                </cfif>

                


</body>

</html>
