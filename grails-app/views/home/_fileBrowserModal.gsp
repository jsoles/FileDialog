<!-- Setup the new modal -->
<g:javascript src="jquery-1.10.2.js"/>
<g:javascript src="jqueryFileTree/jqueryFileTree.js"/>
<g:javascript src="bootstrap.js"/>
<link href="js/jqueryFileTree/jqueryFileTree.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="css/fileTree.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen"/>
<script type="text/javascript">
    $(document).ready(
            function()
            {
                $('#FileTree').fileTree(
                        {
                            root:           '/',
                            script:         'connectors/jqueryFileTree'
                        },
                        function(file)
                        {
                            document.getElementById("txtDialogFileName").value = file;
                        });

                $('#txtDialogFileName').value = "/";
            });
</script>
<div id="fileBrowser" class="modal hide fade in">
    <g:form method="post" controller="FileNameEntry" action="save">
        <div class="modal-header">
            <a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>

            <h3><g:message code="default.fileTree.name"/></h3>
       </div>

        <div class="modal-body">

            <fieldset class="form">

                <div class="controls">
                    <label for="txtDialogFileName" class="control-label">
                        <g:message code="default.fileTree.label"/>
                    </label>

                    <g:textField name="txtDialogFileName" value="${fileNameEntry?.fileName}" autocomplete="false" requred="true"/>

                    <div id="FileTree" class="fileTree">
                        <!-- The FileTree will go here. -->
                    </div>
                </div>
            </fieldset>

        </div>

        <div class="modal-footer">
            <a class="btn" data-dismiss="modal">Close</a>
            <g:actionSubmit
                class="btn btn-success"
                value="${message(code: 'default.fileTree.confirm', default: 'Create')}"/>
        </div>

    </g:form>
</div>
