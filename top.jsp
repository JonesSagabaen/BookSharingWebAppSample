<%-- 
    Document   : top
    Created on : Dec 5, 2010, 12:31:39 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.Liberry.servlet.Model.User"%>
        <iframe src="titlebar.svg" id="titleFrame" width="95%" height="26%"
        frameborder="0"></iframe>
        <iframe class="leftcol" src="leftcol.svg" width="17%" height="80%"
        frameborder="0"></iframe>
        <iframe class="rightcol" id="resultsFrame" src="rightcol.svg" width="75%" height="80%"
        frameborder="0">
        </iframe>
        <div class="titletext">
            <img class="titlePic" src="LiBerryLogo.png" alt="LiBerry Logo" width="31%">
            <h1>LiBerry</h1>
            <p class="red">- Online Book Rental Service -</p>
            <%
               User user = (User)session.getAttribute("user");
               String name = "guest";
               if (user != null)
                  name = user.getFirstName();
            %>
            <p class="welcome">Welcome, <%= name %></p>
        </div>
        <script type="text/javascript">
            // javascript hax for fixing Firefox iframe height issue
            var titleFrame = document.getElementById("titleFrame");
            titleFrame.style.height = "26%";
        </script>