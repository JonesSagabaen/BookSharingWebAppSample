<%@page import="com.Liberry.servlet.Model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LiBerry</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
    </head>
    <body onLoad="document.SearchForm.query.focus()">
        <%
            String query = request.getParameter("query");
            String queryType = request.getParameter("searchby");
        %>

        <%@include file="top.jsp"%>

        <%@include file="leftcol.jsp"%>

        <div class="homepage">
            <h2 class="red">Welcome to the LiBerry!</h2>
            <p style="text-align: left;">We are an online book rental service. From the comfort of your
            own home, you can browse, search, reserve, and order your favorite
            books from our expansive online catalog. We have three great monthly
            payment plans listed below.</p>
        </div>

        <div class="paymentPlan1">
            <img class="plan1pic" src="LiBerryLogo.png" alt="pic" height="17%">
            <p class="pictext">One Book: $9.99/month</p>
        </div>

        <div class="paymentPlan2">
            <img class="plan2pic" src="LiBerryLogo.png" alt="pic" height="26%">
            <p class="pictext">Two Books: $14.99/month</p>
        </div>

        <div class="paymentPlan3">
            <img class="plan3pic" src="LiBerryLogo.png" alt="pic" height="35%">
            <p class="pictext">Three Books: $19.99/month</p>
        </div>
    </body>
</html>

