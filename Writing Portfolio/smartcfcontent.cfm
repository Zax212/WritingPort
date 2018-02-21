<!--- Param the tag attributes. --->
<!---
    This is the mime type of the content that we are
    streaming to the browser.
--->
<cfparam
    name="ATTRIBUTES.Type"
    type="string"
    default="application/octet-stream"
    />
<!---
    This it the expanded path of the file that will be
    streamed to the client.
--->
<cfparam
    name="ATTRIBUTES.File"
    type="string"
    />
<!---
    Get a pointer to the response. We will need to this to
    set the header values and finalize the data flush. To get
    this, we will have to go two levels deep - past the text
    output stream, to it's underlying binary stream.
--->
<cfset THISTAG.Response = GetPageContext()
    .GetResponse()
    .GetResponse()
    />
<!---
    Get a pointer to the underlying binary repsonse stream
    of the current ColdFusions.
--->
<cfset THISTAG.BinaryOutputStream = THISTAG.Response.GetOutputStream() />
<!---
    We need to create a byte array that will be used to read
    in the input stream and then transfer the input stream to
    the output stream. Since ColdFusion doesn't have true
    arrays, we need to hack one by grabbing the byte array
    from a ColdFusion string.
    Here, we are using the underlying Java method to grab a
    byte array that is 5,120 bytes long (around 5 megs).
--->
<cfset THISTAG.ByteBuffer = RepeatString( "12345", 1024 )
    .GetBytes()
    />
<!---
    Now, we need to create a file input stream so that we can
    read chunks of the file into memory as we stream it.
--->
<cfset THISTAG.FileInputStream = CreateObject(
    "java",
    "java.io.FileInputStream"
    ).Init(
        JavaCast( "string", ATTRIBUTES.File )
        )
    />
<!---
    Before we start putting stuff in the buffer, let's
    turn off the auto-flushing mechanism so that we have
    full control.
--->
<cfset GetPageContext().SetFlushOutput(
    JavaCast( "boolean", false )
    ) />
<!---
    Reset the buffer to make sure nothing else has built up
    in prior to this tag.
--->
<cfset THISTAG.Response.ResetBuffer() />
<!---
    Set the content type using the mime type that was passed
    in. This will give the browser information as to how to
    deal with the streamed content.
--->
<cfset THISTAG.Response.SetContentType(
    JavaCast( "string", ATTRIBUTES.Type )
    ) />
<!---
    Now that we have all the elements in place, let's start
    reading in the file and moving it to the output buffer.
    We are going to keep doing this while until we hit the
    end of the file.
--->
<cfloop condition="true">

    <!--- Read a chunk of the file into the byte buffer. --->
    <cfset THISTAG.BytesRead = THISTAG.FileInputStream.Read(
        THISTAG.ByteBuffer,
        JavaCast( "int", 0 ),
        JavaCast( "int", ArrayLen( THISTAG.ByteBuffer ) )
        ) />
    <!---
        Check to see if any bytes were read. If not, then we
        will have a -1 to denote that the end of the file has
        been reached.
    --->
    <cfif (THISTAG.BytesRead NEQ -1)>

        <!---
            Write the buffer to the output stream. We want to be
            careful only to write as many bytes as were read in.
        --->
        <cfset THISTAG.BinaryOutputStream.Write(
            THISTAG.ByteBuffer,
            JavaCast( "int", 0 ),
            JavaCast( "int", THISTAG.BytesRead )
            ) />

        <!--- Flush this new content to the client. --->
        <cfset THISTAG.BinaryOutputStream.Flush() />
    <cfelse>
        <!---
            We hit a (-1). We reached the end of the file. This
            is not the cleanest solution, but just break out
            of the loop.
        --->
        <cfbreak />
    </cfif>
</cfloop>
<!---
    ASSERT: At this point, we have fully read in the file,
    moved it to the binary output stream, and then flushed it
    to the client. Now, we just have to peform clean up work.
--->
<!---
    Reset the response. This will clear any remaining information
    in the buffer as well as any header information.
--->
<cfset THISTAG.Response.Reset() />

<!---
    Close the file input stream to make sure we are not locking
    the file from further use.
--->
<cfset THISTAG.FileInputStream.Close() />

<!---
    Close the output stream to make sure no other content is
    getting flushed to the browser.
--->
<cfset THISTAG.BinaryOutputStream.Close() />
<!---
    Exit out of this tag to make sure it doesn't try to execute
    for a second time if someone made it self-closing.
--->
<cfexit method="exittag" />