<%-- 
    Document   : moreDetails
    Created on : Dec 10, 2010, 4:38:33 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.Liberry.servlet.Model.InventoryItem"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liberry</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
    </head>
    <body>
        <%
            InventoryItem item = (InventoryItem) request.getAttribute("book");
            String display = "";

                // Start table with title, authors, publisher, year, edition, etc.
                display = "<br /><table border=1 cellpadding=3px>"
                    + "<tr><td><span class=\"searchTitles\">Title: </span>" + item.getName() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Author(s): </span>" + item.getAuthors() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Publisher: </span>" + item.getPublisher() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Year: </span>" + item.getYear() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Edition: </span>" + item.getEdition() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">ISBN10: </span>" + item.getISBN10() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">ISBN13: </span>" + item.getISBN13() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Pages: </span>" + item.getNumPages() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Genre: </span>" + item.getGenre() + "</td></tr>"
                    + "<tr><td><span class=\"searchTitles\">Description: </span>" + item.getDescription() + "</td></tr>";
        %>
        <div class="moreDetailsText">
            <h1 class="red">Book details</h1>
            <%= display %>
            <p><input type="button" value=" &lt;-- Go back " onclick="history.go(-1);return false;" /></p>

        </div>
    </body>
</html>
