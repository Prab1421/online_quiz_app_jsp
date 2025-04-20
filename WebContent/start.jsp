<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Start Quiz</title>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<%
    String islogin = (String) session.getAttribute("islogin");
    if(islogin == null) {
        request.setAttribute("notlogin_msg", "Sorry, please do Login first");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<div class="left_content">
    <% 
        if(request.getAttribute("notlogin_msg") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("notlogin_msg"));
            out.print("</font>");
        }

        if(request.getAttribute("Error") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("Error"));
            out.print("</font>");
        }

        if(request.getAttribute("finished") != null) {
            out.print("<font size='2' color='navy'><b>");
            out.print(request.getAttribute("finished"));
            out.print("</b></font>");
        }

        String question = (String) session.getAttribute("question");
        String option1 = (String) session.getAttribute("option1");
        String option2 = (String) session.getAttribute("option2");
        String option3 = (String) session.getAttribute("option3");
        String option4 = (String) session.getAttribute("option4");
    %>

    <div class="calendar_box2">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
                <b>Assess Yourself by taking quizzes on various subjects</b>
            </marquee>

            <% if (question != null) { %>
            <form method="post" action="get.jsp">
                <table>
                    <tr><td><b><%= question %></b></td></tr>
                    <tr><td><input type="radio" name="ans" value="<%= option1 %>" required /> <%= option1 %></td></tr>
                    <tr><td><input type="radio" name="ans" value="<%= option2 %>" /> <%= option2 %></td></tr>
                    <tr><td><input type="radio" name="ans" value="<%= option3 %>" /> <%= option3 %></td></tr>
                    <tr><td><input type="radio" name="ans" value="<%= option4 %>" /> <%= option4 %></td></tr>
                    <tr><td><input type="submit" value="Next" /></td></tr>
                </table>
            </form>
            <% } else { %>
                <p><b>Quiz finished or no questions to show.</b></p>
            <% } %>

        </div>
    </div>

    <div class="news_left">
        <h1>Latest News</h1>
        <div class="news_box">
            <div class="calendar">1</div>
            <div class="news_content">
                <p>Now learn how to develop android applications free of cost</p><br>
                <a href="#" class="read_more">read more</a>                        
            </div>
        </div>
        <br>
        <div class="news_box">
            <div class="calendar">2</div>
            <div class="news_content">
                <p>We have the latest projects uploaded on my site</p>
                <a href="#" class="read_more">read more</a>                        
            </div>
        </div>
    </div>
</div>

<div class="right_content">
    <h1>Latest Projects</h1>
    <div class="project_box">
        <a href="#"><img src="images/p1.gif" alt="" title="" class="left_img" border="0"></a>
        <p><span>Description:</span><br>Payment billing System<br>Online Quiz<br>Matrimonial</p>
    </div>

    <div class="project_box">
        <a href="#"><img src="images/p2.gif" alt="" title="" class="left_img" border="0"></a>
        <p><span>Description:</span><br>Gmail Account<br>Latest Quiz</p>
    </div>
    <br>
    <h1>Our Main Services</h1>
    <div class="services">
        <ul>                                        
            <li><a href="#">Java tutorial</a></li>
            <li><a href="#">CSE tutorial</a></li>
        </ul>
    </div>
    <div class="services">
        <ul>                                        
            <li><a href="#">Java tutorial</a></li>
            <li><a href="#">CSE tutorial</a></li>
        </ul>
    </div>  
</div>

<div id="footer"></div>

</body>
</html>
