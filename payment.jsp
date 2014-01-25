<%-- 
    Document   : payment
    Created on : Dec 10, 2010, 7:08:34 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <title>LiBerry Edit Payment Information</title>
        <script type="text/javascript" >
             function validate() {
                var regForm = document.getElementById("editPayment");
                var error1 = document.getElementById("error1");
                error1.style.display = "none";
                
                if(regForm.elements[2].value != 3)
                {
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <div id="editPaymentInfo">
            <form id="editPayment" action="AddPayment" method="post"
            onsubmit="return validate()">
                <h2 class="red">Add/Edit Payment Information</h2>
                <table border="0">
                <input type="radio" name="cardType" value="Visa"> Visa
                <input type="radio" name="cardType" value="Mastercard"> Mastercard
                <input type="radio" name="cardType" value="Discover"> Discover
                <tr><td><label for="cardNum">Card Number:</label></td>
                <td><input type="text" name="cardNum" /></td></tr>
                <tr><td><label for="secCode">Security Code:</label></td>
                <td><input type="text" name="secCode"/></td></tr>
            <tr><td><label for="Month">Expiration Month</label></td>
                <td><select name="Month">
             <option>1</option>
             <option>2</option>
             <option>3</option>
             <option>4</option>
             <option>5</option>
             <option>6</option>
             <option>7</option>
             <option>8</option>
             <option>9</option>
             <option>10</option>
             <option>11</option>
             <option>12</option>
                   </select></td></tr>
             <tr><td><label for="Year">Expiration Year</label></td>
                <td><select name="Year">
             <option>2010</option>
             <option>2011</option>
             <option>2012</option>
             <option>2013</option>
             <option>2014</option>
             <option>2015</option>
             <option>2016</option>
                   </select></td></tr>
             <tr><td><label for="acctType">Account Type: </label></td>
                <td><select name="acctType">
             <option value="1">One Book</option>
             <option value="2">Two Books</option>
             <option value="3">Three Books</option>
                   </select></td></tr>
                </table>
                <input type="submit" value="Submit" />
                <br />
            </form>
        </div>

    </body>
</html>
