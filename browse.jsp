<%-- 
    Document   : browse
    Created on : Nov 14, 2010, 9:23:00 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
    import="
        com.Liberry.servlet.Model.InventoryItem,
        com.Liberry.servlet.Model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <title>LiBerry Book Browse</title>
    </head>
    <body>
        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <h2 class="browseTitle">LiBerry Book Browser</h2>
        
        <div id="browse">
            <%
                String numSearchResults = "";
                String pic = "";
                String title = "";
                String author = "";
                String year = "";
                String publisher = "";
                String description = "";
                String book_id = "";
                String resizeFactor = "";
                final int startSizeConst = 685;
                final int resizeConst = 285;
                final int maxDescSize = 280;

                InventoryItem[] items =
                    (InventoryItem[]) request.getAttribute("allItems");

                request.setAttribute("query", "getAll");

                if (items != null) {
                    numSearchResults = items.length + " books.";

                    // get start and end indexes for items array
                    int start = (Integer) request.getAttribute("startIndex");
                    int end = (Integer) request.getAttribute("endIndex");
                    %> Showing <%= start + 1%>-<%= end %> of <%= numSearchResults %>
                    <%

                    for (int i = start; i < end; i++) {
                        pic = items[i].getImageName();
                        title = items[i].getName();
                        author = items[i].getAuthors();
                        year = Integer.toString(items[i].getYear());
                        publisher = items[i].getPublisher();
                        description = items[i].getDescription();

                        // shorten description text if it's too long
                        if (description.length() > maxDescSize)
                            description = description.substring(0, maxDescSize) + " ...";

                        book_id = Integer.toString(items[i].getItemID());
                        %>
                        <hr>
                        <img src="images/<%= pic %>" style="float: left;
                             padding-right: 10px; padding-top: 10px;"
                             alt="<%= pic %> missing pic" height="20%" width="8%">
                        <p><span class="searchTitles">Title: </span> <%= title %></p>
                        <p><span class="searchTitles">Author(s): </span><%= author %></p>
                        <p><span class="searchTitles">Year: </span><%= year %></p>
                        <p><span class="searchTitles">Publisher: </span><%= publisher %></p>
                        <p><span class="searchTitles">Description: </span><%= description %></p>
                        <a href="GetMoreDetails?bookID=<%= book_id %>">More details</a>
                        <form action="Reserve" name="queueButton" method="post">
                           <input type="hidden" name="book_id" value="<%= book_id %>" />
                           <%
                              String user_id = "";
                              int id = (user == null) ? -1 : user.getUserId();
                              user_id = Integer.toString(id);
                           %>
                           <input type="hidden" name="user_id" value="<%= user_id %>" />
                           <input class="reserveButton" id="button" type="submit" value="Reserve">
                        </form>
                    <%
                    }
                        // resize rounded rect to fit search results
                        resizeFactor = Integer.toString(startSizeConst + ((end - start - 1) * resizeConst));
                        out.println("<hr>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("var viewBox = document.getElementById(\"resultsFrame\");");
                        out.println("viewBox.style.height = \""+ resizeFactor +"px\";");
                        out.println("</script>");

                        //make page navigation links
                        if (items.length > 10) {
                            int numPages = items.length / 10;
                            String query = request.getParameter("query");

                            for (int i = 0, j = 0; i < numPages + 1; i++, j+=10) {
                                out.println("<a href=\"Browse?start="
                                + Integer.toString(j) + "&end="
                                + Integer.toString(j + 10) + "&query="
                                + query + "\"> Pg."
                                + Integer.toString(i + 1) + "</a>&nbsp;");
                            }

                        }

                }
            %>
        </div>
    </body>
</html>
