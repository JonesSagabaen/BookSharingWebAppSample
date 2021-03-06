<%--
    Document   : edituserinfo
    Created on : Dec 10, 2010, 12:35:57 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <title>LiBerry Edit Account Information</title>
        <script type="text/javascript" >
             function validate() {
                var regForm = document.getElementById("reg");
                var error1 = document.getElementById("error1");
                var error2 = document.getElementById("error2");
                error1.style.display = "none";
                error2.style.display = "none";
                for (var i = 0; i < regForm.length; i++) {
                    if (regForm.elements[i].value == "" &&
                        regForm.elements[i].name != "addr2") {
                        error1.style.display = "inline";
                        return false;
                    }
                }

                var atpos = regForm.email.value.indexOf("@");
                var dotpos = regForm.email.value.lastIndexOf(".");
                if (atpos < 1 || dotpos - atpos < 2) {
                   error2.style.display = "inline";
                   return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <div id="editUserInfo">
            <form id="editUser" action="EditUserInfo" method="post"
            onsubmit="return validate()">
                <h2 class="red">Edit Account Information</h2>
                <table border="0">
                    <tr><td><label for="firstname">First Name:</label></td>
                    <td><input type="text" name="fname" /></td></tr>
                    <tr><td><label for="lastname">Last Name:</label></td>
                    <td><input type="text" name="lname"/></td></tr>
                    <tr><td><label for="passwd">Password: </label></td>
                    <td><input type="password" name="passwd"/></td></tr>
                    <tr><td><label for="email">E-mail:</label></td>
                    <td><input type="text" name="email"/></td></tr>
                    <tr><td><label for="addr1">Address1:</label></td>
                    <td><input type="text" name="addr1"/></td></tr>
                    <tr><td><label for="addr2">Address2:</label></td>
                    <td><input type="text" name="addr2"/></td></tr>
                    <tr><td><label for="city">City: </label></td>
                    <td><input type="text" name="city"/></td></tr>
             <tr><td><label for="state">State</label></td>
                <td><select name="state">
             <option>AK</option>
             <option>AL</option>
             <option>AR</option>
             <option>AZ</option>
             <option>CA</option>
             <option>CO</option>
             <option>CT</option>
             <option>DC</option>
             <option>DE</option>
             <option>FL</option>
             <option>GA</option>
             <option>HI</option>
             <option>IA</option>
             <option>ID</option>
             <option>IL</option>
             <option>IN</option>
             <option>KS</option>
             <option>KY</option>
             <option>LA</option>
             <option>MA</option>
             <option>MD</option>
             <option>ME</option>
             <option>MI</option>
             <option>MN</option>
             <option>MO</option>
             <option>MS</option>
             <option>MT</option>
             <option>NC</option>
             <option>ND</option>
             <option>NE</option>
             <option>NH</option>
             <option>NJ</option>
             <option>NM</option>
             <option>NV</option>
             <option>NY</option>
             <option>OH</option>
             <option>OK</option>
             <option>OR</option>
             <option>PA</option>
             <option>RI</option>
             <option>SC</option>
             <option>SD</option>
             <option>TN</option>
             <option>TX</option>
             <option>UT</option>
             <option>VA</option>
             <option>VT</option>
             <option>WA</option>
             <option>WI</option>
             <option>WV</option>
             <option>WY</option>
                   </select></td></tr>
                    <tr><td><label for="zipcode">Zip</label></td>
                    <td><input type="text" name="zip"/></td></tr>
                </table>
                <input type="submit" value="EditInfo" />
                <br />
            </form>
        </div>

    </body>
</html>