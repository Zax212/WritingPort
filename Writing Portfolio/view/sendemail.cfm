<div class="jumbotron">
    <h2>Email Sent</h2>

    <hr>

    <p>
        <cfIf sb.isDevelopment>
            <cfOutput>#variables.numsent# emails WOULD have been sent.</cfOutput>
        <cfElse>
            <cfOutput>#variables.numsent# emails have been sent.</cfOutput>
        </cfIf>
    </p>

    <p><a class="btn btn-primary btn-lg" href="menu.htm" role="button">Menu</a></p>
</div>