/**
 * Created with IntelliJ IDEA.
 * User: joshua
 * Date: 9/9/13
 * Time: 4:42 PM
 * To change this template use File | Settings | File Templates.
 */

/////////////////////////////////////////////////////////////////////////////
// Gets the GET parameter requested from the URL, and decodes it,
// storing it as a hash table where parameter names are keys and values are,
// well, self explanatory.
// If the optional "qs" parameter is left undefined, then it defaults to
// document.location.search, which is the list of GET parameters.
//////////////////////////////////////////////////////////////////////////////

function getQueryParams(qs)
{
    if(typeof(qs) === "undefined")
    {
        qs = document.location.search;
    }

    qs = qs.split("+").join(" ");

    var params = {}, tokens,
        re = /[?&]?([^=]+)=([^&]*)/g;

    while (tokens = re.exec(qs)) {
        params[decodeURIComponent(tokens[1])]
            = decodeURIComponent(tokens[2]);
    }

    return params;
}