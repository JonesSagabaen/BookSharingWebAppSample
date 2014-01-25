<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.Liberry.servlet.Model.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LiBerry Book Search</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
    </head>
    <body onLoad="document.SearchForm.query.focus()">
        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <form class="serach" action="Search" name="searchForm"
        method="post">
            <h2 class="red">LiBerry Book Search</h2>
            Search: <input type="text" name="query" size="38"/><br />
            <label for="keyword">Keyword:</label>
            <input type="radio" name="searchby" value="keyword" checked="true"/>
            &nbsp;
            <label for="title">Title:</label>
            <input type="radio" name="searchby" value="title"/>
            &nbsp;
            <label for="author">Author: </label>
            <input type="radio" name="searchby" value="author"/>&nbsp;
            <label for="ISBN">ISBN:</label>
            <input type="radio" name="searchby" value="ISBN"/>&nbsp;
            <br /> <input type="submit" value="Submit" />
            <br /><br />
        </form>
        <div id="serachResults">
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
                    (InventoryItem[]) request.getAttribute("items");

                if (request.getAttribute("noResults") != null) {
                    out.println("No results matched your search.");
                }
                else if (items != null) {
                    numSearchResults = items.length + " results.";

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
                        book_id = Integer.toString(items[i].getItemID());

                        // shorten description text if it's too long
                        if (description.length() > maxDescSize)
                            description = description.substring(0, maxDescSize) + " ...";
                        
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
                              //User user = (User)session.getAttribute("user");
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
                            String searchby = request.getParameter("searchby");

                            for (int i = 0, j = 0; i < numPages + 1; i++, j+=10) {
                                out.println("<a href=\"Search?start="
                                + Integer.toString(j) + "&end="
                                + Integer.toString(j + 10) + "&query="
                                + query + "&searchby="
                                + searchby + "\"> Pg."
                                + Integer.toString(i + 1) + "</a>&nbsp;");
                            }

                        }

                }
            %>
       </div>
    </body>
</html>

