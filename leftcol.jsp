<%-- 
    Document   : leftcol
    Created on : Dec 5, 2010, 12:34:02 AM
--%>

        <%@page import="com.Liberry.servlet.Model.User"%>
        <div class="leftcol">
            <a href="index.jsp"><p class="red">Home</p></a>
            <%
               String logPage = "signin.jsp";
               String logMsg = "Sign in";
               //User user = (User)session.getAttribute("user");
               if (session.getAttribute("user") != null)
               {
                  logPage = "Logout";
                  logMsg = "Log out";
               }
            %>
            <a href="<%= logPage %>"><p class="red"><%= logMsg %></p></a>
            <a href="accountmgr.jsp"><p class="red">Manage Account</p></a>
            <a href="register.jsp"><p class="red">Register</p></a>
            <a href="Browse?query=getAll&start=0&end=10">
                <p class="red">Browse Books</p></a>
            <a href="search.jsp"><p class="red">Search for Books</p></a>
        </div>