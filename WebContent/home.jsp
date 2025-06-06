<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>

<jsp:include page="header.jsp"></jsp:include>

<%
    String islogin = (String) session.getAttribute("islogin");
    if (islogin == null) {
        request.setAttribute("notlogin_msg", "Sorry, Please do Login first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>

<div class="left_content">
    <% 
        if (request.getAttribute("notlogin_msg") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("notlogin_msg"));
            out.print("</font>");
        }
    %>

    <% 
        if (request.getAttribute("Error") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("Error"));
            out.print("</font>");
        }
    %>

    <% 
        if (request.getAttribute("finished") != null) {
            out.print("<font size='2' color='navy'>");
            out.print("<b>");
            out.print(request.getAttribute("finished"));
            out.print("</b>");
            out.print("</font>");
        }
    %>

    <% 
        if (request.getAttribute("category") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("category"));
            out.print("</font>");
        }
    %>

    <div class="calendar_box">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="this.stop();" onmouseout="this.start();">
                <b>Assess Yourself by taking quizzes on various subjects</b>
            </marquee>
            <p>
                <font style="color: navy;">
                    Now Teachers and Students can work together online. Tutors are most welcome to my site. They can create quizzes simply by clicking the "Make Quiz" link. Students can appear in quizzes based on various subjects.
                </font>
            </p>
        </div>
    </div>

    <div class="news_left">
        <h1>Latest News</h1>
        <div class="news_box">
            <div class="calendar">1</div>
            <div class="news_content">
                <p><span></span> Now learn how to develop Android applications free of cost.</p><br>
                <a href="#" class="read_more">Read More</a>
            </div>
        </div>
        <br>
        <div class="news_box">
            <div class="calendar">2</div>
            <div class="news_content">
                <p><span></span> We have the latest projects uploaded on my site.</p>
                <a href="#" class="read_more">Read More</a>
            </div>
        </div>
    </div>
</div>
<!-- End of left content -->

<div class="right_content">
    <h1>Latest Projects</h1>

    <div class="project_box">
        <a href="#"><img src="images/p1.gif" alt="Project 1" title="Project 1" class="left_img" border="0"></a>
        <p>
            <span>Description:</span><br>
            Payment Billing System<br>
            Online Quiz<br>
            Matrimonial
        </p>
    </div>

    <div class="project_box">
        <a href="#"><img src="images/p2.gif" alt="Project 2" title="Project 2" class="left_img" border="0"></a>
        <p>
            <span>Description:</span><br>
            Gmail Account<br>
            Latest Quiz
        </p>
    </div>
    <br>

    <div>
        <h1><br>Our Main Services</h1>
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
</div><!-- End of right content -->

<div id="footer">
    <p>PrabhatSingh</p>
</div>

</body>
</html>
