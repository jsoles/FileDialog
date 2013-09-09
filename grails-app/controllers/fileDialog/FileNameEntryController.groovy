package fileDialog

class FileNameEntryController
{
    static allowedMethods =
    [
        save:       "POST",
        update:     "POST",
        delete:     "POST"
    ]

    def index()
    {
        redirect(view: "/", params: params)
    }

    def save()
    {
        params.fileName = params.txtDialogFileName

        def fileNameEntry = new FileNameEntry(params);

        def msg = message(
                    code:       "default.index.fileName.message",
                    args:       fileNameEntry.fileName
        ) + "\n"

        if(fileNameEntry.isDirectory)
        {
            msg += message(
                    code:    "default.index.fileName.isDirectory"
            )
        }
        else
        {
            msg += message(
                    code:   "default.index.fileName.isFile"
            )
        }

        flash.message = msg;

        def fileName = fileNameEntry.fileName
        def txtFileName = fileNameEntry.fileName
        def isDirectory = fileNameEntry.isDirectory

        def responseUrl = params.responseUrl +
                "?fileName=${fileName}" +
                "&isDirectory=${isDirectory}"

        redirect(uri: responseUrl)
    }
}