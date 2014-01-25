<%-- 
    Document   : signin
    Created on : Nov 23, 2010, 7:57:40 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <title>LiBerry Sign In</title>
        <script type="text/javascript" >
            function validate() {
                var signinForm = document.getElementById("signin");
                if (signinForm.username.value == "" ||
                signinForm.passwd.value == "") {
                    var error = document.getElementById("error1");
                    error.style.display = "inline";
                    return false;
                }
                else return true;
            }
        </script>
    </head>
    <body>
        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <div id="signinPage">
           <%
              String book = request.getParameter("book_id");
           %>
            <form id="signin" action="Login" method="post"
            onsubmit="return validate()">
                <h2 class="red">LiBerry Signin</h2>
                <table border="0">
                    <tr><td><label for="username">Username</label></td>
                    <td><input type="text" name="username" /></td></tr>
                    <tr><td><label for="passwd">Password</label></td>
                    <td><input type="password" name="passwd"/></td></tr>
                </table>
                <input type="hidden" name="book_id" value="<%= book %>" />
                <br />
                <input type="submit" value="Signin" />
                <br />
                <p class="inputerror" id="error1">*Please fill in all fields</p>
                <br />
                <a href="register.jsp">New to LiBerry? Register here</a>
            </form>
                <%
                    if (request.getAttribute("invalidLogin") != null) {
                        out.println("<p class=\"red\">*Invalid Login</p>");
                    }
                 %>
        </div>

    </body>
</html>
