<%--
  Created by IntelliJ IDEA.
  User: joshua
  Date: 9/4/13
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page
        contentType="text/html;charset=UTF-8"
        import="fileDialog.FileNameEntry"
%>
<html>
<head>
    <title><g:message code="default.index.title"/></title>
</head>
<body>

    <g:render template="fileBrowserModal"/>

    <h1>
        <g:message code="default.index.title"/>
    </h1>
    <p>
        <g:message code="default.index.welcome"/>
    </p>
    <h2>
        <g:message code="default.index.fileTree.name"/>
    </h2>

    <g:form method="post" class="form-horizontal">

        <div class="control-Group">
            <label for="FileName" class="control-label">
                <g:message code="default.index.file.name"/>
            </label>
            <div class="controls">
                <g:textArea name="FileName" value="" class="span6" rows="10"/>
            </div>

        </div>

        <a href="#fileBrowser" role="button" class="btn btn-success btn-small" data-toggle="modal">
            <i class="icon-download"><g:message code="default.fileTree.name"/></i>
        </a>

    </g:form>
</body>
</html>