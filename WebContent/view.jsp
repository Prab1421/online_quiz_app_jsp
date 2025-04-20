<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quiz Dashboard</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>

<jsp:include page="header.jsp" />

<%
    String islogin = (String) session.getAttribute("islogin");
    if (islogin == null) {
        request.setAttribute("notlogin_msg", "Sorry, Please do Login first");
%>
        <jsp:forward page="index.jsp" />
<%
        return;
    }
%>

<div class="left_content">
    <% 
        if (request.getAttribute("notlogin_msg") != null) {
    %>
        <p style="color: red; font-size: 14px;"><%= request.getAttribute("notlogin_msg") %></p>
    <%
        }
        if (request.getAttribute("Error") != null) {
    %>
        <p style="color: red; font-size: 14px;"><%= request.getAttribute("Error") %></p>
    <%
        }
        if (request.getAttribute("finished") != null) {
    %>
        <p style="color: navy; font-weight: bold;"><%= request.getAttribute("finished") %></p>
    <%
        }
    %>

    <div class="calendar_box2">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
                <b>Assess Yourself by taking quizzes on various subjects</b>
            </marquee>

            <%
                String name = (String) session.getAttribute("quizname");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

                    PreparedStatement ps = con.prepareStatement("SELECT * FROM quizques WHERE quizname = ?");
                    ps.setString(1, name);
                    ResultSet rs = ps.executeQuery();

                    out.println("<table border='1' cellpadding='5' cellspacing='0'>");
                    while (rs.next()) {
                        out.println("<tr><td><b>Question:</b></td><td>" + rs.getString("question") + "</td></tr>");
                        out.println("<tr><td><b>Answer:</b></td><td>" + rs.getString("correct_answer") + "</td></tr>");
                        out.println("<tr><td><b>Description:</b></td><td>" + rs.getString("description") + "</td></tr>");
                        out.println("<tr><td colspan='2'><hr></td></tr>");
                    }
                    out.println("</table>");
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>

    <div class="news_left">
        <h1>Latest News</h1>
        <div class="news_box">
            <div class="calendar">1</div>
            <div class="news_content">
                <p>Now learn how to develop Android applications free of cost</p>
                <a href="https://www.javatpoint.com" class="read_more" target="_blank">read more</a>
            </div>
        </div>
        <br>
        <div class="news_box">
            <div class="calendar">2</div>
            <div class="news_content">
                <p>We have latest projects uploaded on our site</p>
                <a href="https://www.cstpoint.com" class="read_more" target="_blank">read more</a>
            </div>
        </div>
    </div>
</div>

<div class="right_content">
    <h1>Latest Projects</h1>
    <div class="project_box">
        <a href="#"><img src="images/p1.gif" alt="Project 1" class="left_img" border="0" /></a>
        <p>
            <span>Description:</span><br>
            Payment Billing System<br>
            Online Quiz<br>
            Matrimonial
        </p>
    </div>

    <div class="project_box">
        <a href="#"><img src="images/p2.gif" alt="Project 2" class="left_img" border="0" /></a>
        <p>
            <span>Description:</span><br>
            Gmail Account<br>
            Latest Quiz
        </p>
    </div>

    <div>
        <h1>Our Main Services</h1>
    </div>
    <div class="services">
        <ul>
            <li><a href="https://www.javatpoint.com" target="_blank">Java Tutorial</a></li>
            <li><a href="https://www.cstpoint.com" target="_blank">CSE Tutorial</a></li>
        </ul>
    </div>
</div>

<jsp:include page="footer.html" />

</body>
</html>
