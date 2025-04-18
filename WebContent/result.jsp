<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>
<html>

<jsp:include page="header.jsp"></jsp:include>

<%
    // Check if user is logged in
    String islogin = (String) session.getAttribute("islogin");
    if (islogin == null) {
        request.setAttribute("notlogin_msg", "Sorry, Please do Login first");
        // Redirect to the index page if not logged in
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
    }
%>

<div class="left_content">
    <% 
        // Display message if user is not logged in
        if (request.getAttribute("notlogin_msg") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("notlogin_msg"));
            out.print("</font>");
        }
    %>

    <% 
        // Display error message if any
        if (request.getAttribute("Error") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("Error"));
            out.print("</font>");
        }
    %>

    <% 
        // Display success message if quiz is finished
        if (request.getAttribute("finished") != null) {
            out.print("<font size='2' color='navy'>");
            out.print("<b>");
            out.print(request.getAttribute("finished"));
            out.print("</b>");
            out.print("</font>");
        }
    %>

    <div class="calendar_box">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
                <b>Assess Yourself by taking quizzes on various subjects</b>
            </marquee>
            <form action="view.jsp">
                <p>
                    <font style="color: navy;">
                        <b>Your <%= request.getAttribute("total") %> questions are correct</b>
                    </font><br/>
                    <input type="submit" value="View Description">
                </p>
            </form>
        </div>
    </div>

    <div class="news_left">
        <h1>Latest News</h1>
        <div class="news_box">
            <div class="calendar">1</div>
            <div class="news_content">
                <p><span></span>Now learn how to develop Android applications free of cost</p><br>
                <a href="#" class="read_more">Read more</a>
            </div>
        </div>
        <br>
        <div class="news_box">
            <div class="calendar">2</div>
            <div class="news_content">
                <p><span></span>We have the latest projects uploaded on my site</p>
                <a href="#" class="read_more">Read more</a>
            </div>
        </div>
    </div>
</div>
<!--end of left content-->

<div class="right_content">
    <h1>Latest Projects</h1>

    <div class="project_box">
        <a href="#"><img src="images/p1.gif" alt="" title="" class="left_img" border="0"></a>
        <p>
            <span>Description:</span><br>
            Payment Billing System<br>
            Online Quiz<br>
            Matrimonial
        </p>
    </div>

    <div class="project_box">
        <a href="#"><img src="images/p2.gif" alt="" title="" class="left_img" border="0"></a>
        <p>
            <span>Description:</span><br>
            Gmail Account<br>
            Latest Quiz
        </p>
    </div>
    <br>
    <div>
        <h1>Our Main Services</h1>
    </div>
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
</div><!--end of right content-->

<div id="footer">
    <!-- Footer content goes here -->
</div>

</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body>
</html>
