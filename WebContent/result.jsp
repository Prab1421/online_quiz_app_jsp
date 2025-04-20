<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>
<%
    // Check if user is logged in
    String islogin = (String) session.getAttribute("islogin");
    if (islogin == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Quiz Result</title>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="left_content">
    <%-- Display messages if any --%>
    <%
        String notLoginMsg = (String) request.getAttribute("notlogin_msg");
        String errorMsg = (String) request.getAttribute("Error");
        String finishedMsg = (String) request.getAttribute("finished");

        if (notLoginMsg != null) {
            out.print("<font size='2' color='red'>" + notLoginMsg + "</font><br/>");
        }
        if (errorMsg != null) {
            out.print("<font size='2' color='red'>" + errorMsg + "</font><br/>");
        }
        if (finishedMsg != null) {
            out.print("<font size='2' color='navy'><b>" + finishedMsg + "</b></font><br/>");
        }
    %>

    <div class="calendar_box">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
                <b>Assess Yourself by taking quizzes on various subjects</b>
            </marquee>

            <%
                Integer total = (Integer) session.getAttribute("total");
                if (total != null) {
            %>
                <form action="view.jsp">
                    <p>
                        <font style="color: navy;">
                            <b>You got <%= total %> question<%= total == 1 ? "" : "s" %> correct!</b>
                        </font><br/>
                        
                    </p>
                </form>
            <%
                } else {
            %>
                <p><font color="red"><b>Quiz results not available!</b></font></p>
            <%
                }
            %>
        </div>
    </div>

    <div class="news_left">
        <h1>Latest News</h1>
        <div class="news_box">
            <div class="calendar">1</div>
            <div class="news_content">
                <p>Now learn how to develop Android applications free of cost</p><br>
                <a href="#" class="read_more">Read more</a>
            </div>
        </div>
        <br>
        <div class="news_box">
            <div class="calendar">2</div>
            <div class="news_content">
                <p>We have the latest projects uploaded on my site</p>
                <a href="#" class="read_more">Read more</a>
            </div>
        </div>
    </div>
</div>

<div class="right_content">
    <h1>Latest Projects</h1>

    <div class="project_box">
        <a href="#"><img src="images/p1.gif" alt="" class="left_img" border="0" /></a>
        <p>
            <span>Description:</span><br>
            Payment Billing System<br>
            Online Quiz<br>
            Matrimonial
        </p>
    </div>

    <div class="project_box">
        <a href="#"><img src="images/p2.gif" alt="" class="left_img" border="0" /></a>
        <p>
            <span>Description:</span><br>
            Gmail Account<br>
            Latest Quiz
        </p>
    </div>

    <h1>Our Main Services</h1>
    <div class="services">
        <ul>
            <li><a href="#">Java Tutorial</a></li>
            <li><a href="#">CSE Tutorial</a></li>
        </ul>
    </div>
    <div class="services">
        <ul>
            <li><a href="#">Java Tutorial</a></li>
            <li><a href="#">CSE Tutorial</a></li>
        </ul>
    </div>
</div>

<div id="footer">
    <!-- Footer content goes here -->
</div>

</body>
</html>
