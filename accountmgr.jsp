<%--
    Document   : accountmgr
    Created on : Nov 14, 2010, 9:24:02 PM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
    import="
        java.util.ArrayList,
        javax.servlet.http.HttpSession,
        com.Liberry.servlet.Model.User,
        com.Liberry.servlet.Model.Queue,
        com.Liberry.servlet.Model.QueueItem,
        com.Liberry.servlet.Model.InventoryItem,
        com.Liberry.servlet.Model.PaymentInfo,
        com.Liberry.DataAccess.UserData" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <title>LiBerry Manage Account</title>
    </head>
    <body>

        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <div id="accountMgr">
            <h2 class="red">LiBerry Account Manager</h2>
        </div>

        <%!
            String generateQueueDisplay(int user_id) {
                String queueDisplay = "";

                // Start table
                queueDisplay += "<table border=1 cellpadding=3px>";

                // For each queue item, create a row
                ArrayList<QueueItem> userQueue = UserData.getUserQueue(user_id).getQueue();
                if (userQueue.size() == 0)
                {
                    queueDisplay += "Your Book queue is currently empty.";
                }
                else {
                    for (QueueItem queueItem : userQueue) {
                        InventoryItem item = queueItem.getItem();
                        if (item == null)
                            break;

                        int recordID = queueItem.getRecordId();
                        queueDisplay += "<tr>" + "<td>" + item.getName() + "</td>";

                        queueDisplay +=
                                "<td><form id=\"remove\" action=\"Unreserve\" " +
                                "method=\"post\"><input type=\"hidden\" " +
                                "name=\"user_id\" value=\"" + user_id + "\"/>" +
                                "<input type=\"hidden\" name=\"book_id\" " +
                                "value=\"" + recordID + "\"/><input " +
                                "type=\"submit\" value=\"Unreserve\"/></form></td>";

                        queueDisplay += "</tr>";
                    }
                }
                
                // End table
                queueDisplay += "</table>";

                return queueDisplay;
            }

            String generatePaymentInfoDisplay(int user_id) {
                String payinfoDisplay = "";

                // Start table
                payinfoDisplay += "<table border=1 cellpadding=3px>";

                PaymentInfo pi = UserData.getUserPaymentInfo(user_id);
                if (pi == null) 
                    return "No payment added yet";
                payinfoDisplay +=
                    "<tr>" +
                        "<td>Card type:</td><td>" + pi.getCardType() + "</td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td>Card number:</td><td>" + pi.getCardNumber() + "</td>" +
                    "</tr>" +
                    "<form id=\"editpayment\" action=\"EditPayment\" "
                            +"method=\"get\"><input type=\"submit\" value=\"Edit Payment Information\"/>"
                            + "</form>";
                
                // End table
                payinfoDisplay += "</table>";

                return payinfoDisplay;
            }


            String generateUserDisplay(int user_id) {
               String userDisplay = "";

               userDisplay += "<table border=1 cellpadding=3px>";

               User u = UserData.getUserDetailsForId(user_id);

               userDisplay +=
                       "<tr>" 
                         
                            +"<tr><td> First Name: </td>"
                            +"<td>" + u.getFirstName() + "</td></tr>"
                            +"<tr><td> Last Name: </td>"
                            +"<td>" + u.getLastName() + "</td></tr>"
                            +"<tr><td> Email: </td>"
                            +"<td>" + u.getEmail() + "</td></tr>"
                            +"<tr><td> Address1: </td>"
                            +"<td>" + u.getAddress1() + "</td></tr>"
                            +"<tr><td> Address2: </td>"
                            +"<td>" + u.getAddress2() + "</td></tr>"
                            +"<tr><td> City: </td>"
                            +"<td>" + u.getCity() + "</td></tr>"
                            +"<tr><td> State: </td>"
                            +"<td>" + u.getState() + "</td></tr>"
                            +"<tr><td> Zip Code: </td>"
                            +"<td>" + u.getZip() + "</td></tr></table>";


               return userDisplay;
               }
        %>
        <%
            // Get user ID.
            int user_id = -1;
            if (user != null) {
                name = user.getFirstName();
                user_id = user.getUserId();
            }
            else
            {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signin.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Generate display for user's information.
            String userDisplay = generateUserDisplay(user_id);

            // Generate display for user's queue info
            String queueDisplay = generateQueueDisplay(user_id);

            String payinfoDisplay = generatePaymentInfoDisplay(user_id);
        %>
        <div id="user">
           <h2><%= name %>'s Information</h2>
           <%= userDisplay %>
        <a href="edituserinfo.jsp">Click to edit your information.</a>
        </div>
        <br>
        <div id="queue">
           <h2><%= name %>'s Queue</h2>
           <%= queueDisplay %>
        </div>
        <div id="payinfo">
           <h3><%= name %>'s Payment Information</h3>
           <%= payinfoDisplay %>
           <br/>
        <a href="payment.jsp">Click to add/edit your payment information.</a>
        </div>
    </body>
</html>
