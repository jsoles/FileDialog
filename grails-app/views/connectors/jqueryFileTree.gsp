<%--
  Created by IntelliJ IDEA.
  User: joshua
  Date: 9/5/13
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page
    contentType="text/html;charset=UTF-8"
    import="java.io.File"
    import="java.io.FilenameFilter"
    import="java.util.Arrays"
%>
<%
    dir = params.dir;

    if(dir == null)
        return;

    if (dir.charAt(dir.length()-1) == '\\')
    {
        dir = dir.substring(0, dir.length()-1) + "/";
    }
    else if (dir.charAt(dir.length()-1) != '/')
    {
        dir += "/";
    }

    dir = java.net.URLDecoder.decode(dir, "UTF-8");

    if (new File(dir).exists())
    {
        String[] files = new File(dir).list(
                new FilenameFilter()
                {
                    public boolean accept(File dir, String name)
                    {
                        return name.charAt(0) != '.';
                    }
                });

        Arrays.sort(files, String.CASE_INSENSITIVE_ORDER);
        out.print("<ul class=\"jqueryFileTree\" style=\"display: none;\">");

        // All dirs
        for (String file : files)
        {
            if (new File(dir, file).isDirectory())
            {
                out.print(
                        "<li class=\"directory collapsed\"><a href=\"#\" rel=\"" +
                        dir +
                        file +
                        "/\">" +
                        file +
                        "</a></li>"
                );
            }
        }

        // All files
        for (String file : files)
        {
            if (!new File(dir, file).isDirectory())
            {
                int dotIndex = file.lastIndexOf('.');
                String ext = dotIndex > 0 ? file.substring(dotIndex + 1) : "";

                out.print(
                        "<li class=\"file ext_" +
                        ext +
                        "\"><a href=\"#\" rel=\"" +
                        dir +
                        file +
                        "\">" +
                        file +
                        "</a></li>"
                );
            }
        }

        out.print("</ul>");
    }
%>
