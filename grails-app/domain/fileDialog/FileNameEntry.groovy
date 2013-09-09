package fileDialog

class FileNameEntry
{

    static constraints =
    {
        fileName nullable: false
    }

    String fileName = "/"
    Boolean isDirectory = false
}
