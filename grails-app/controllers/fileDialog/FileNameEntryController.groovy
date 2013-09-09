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
        redirect(action: "index", params: params)
    }

    def confirm()
    {
        def fileNameEntry = new FileNameEntry(params);

        msg = message(
                    code:       "default.index.fileName.message",
                    args:       [fileNameEntry.fileName]
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

        flash.message = msg

        redirect(
                action:     "index",
                params:     params
        )
    }
}