<%@ page import="java.util.*" pageEncoding="UTF-8" %>
<%
    String islogin = (String) session.getAttribute("islogin");
    if (islogin == null) {
        request.setAttribute("notlogin_msg", "Sorry, please log in first.");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
        return;
    }
%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make Quiz</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div id="main_container">
    <div class="main_content">
        <div id="header"></div>

        <div class="top_center_box"></div>

        <div class="center_box">

            <%-- Feedback Messages --%>
            <div style="margin: 10px;">
                <% if (request.getAttribute("notlogin_msg") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("notlogin_msg") %></p>
                <% } %>
                <% if (request.getAttribute("Error") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("Error") %></p>
                <% } %>
                <% 
                    Integer counter = (Integer) request.getAttribute("counter");
                    if (counter != null && counter == 10) {
                        request.setAttribute("finished", "Quiz successfully submitted");
                        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                        rd.forward(request, response);
                        return;
                    }
                %>
            </div>

            <!-- Left Content -->
            <div class="left_content">
                <div class="calendar_box2">
                    <div class="calendar_box_content">
                        <h1>Welcome to My Site</h1>
                        <marquee direction="left" style="color: navy;" onmouseover="this.stop()" onmouseout="this.start()">
                            <b>Assess yourself by taking quizzes on various subjects</b>
                        </marquee>

                        <!-- Question Form -->
                        <form method="post" action="saveques.jsp">
                            <table>
                                <tr>
                                    <td>Question:</td>
                                    <td><textarea name="question" rows="3" cols="40" required></textarea></td>
                                </tr>
                                <tr>
                                    <td>Option 1:</td>
                                    <td><input type="text" name="option1" required></td>
                                </tr>
                                <tr>
                                    <td>Option 2:</td>
                                    <td><input type="text" name="option2" required></td>
                                </tr>
                                <tr>
                                    <td>Option 3:</td>
                                    <td><input type="text" name="option3" required></td>
                                </tr>
                                <tr>
                                    <td>Option 4:</td>
                                    <td><input type="text" name="option4" required></td>
                                </tr>
                                <tr>
                                    <td>Answer:</td>
                                    <td><input type="text" name="answer" required></td>
                                </tr>
                                <tr>
                                    <td>Description:</td>
                                    <td><input type="text" name="description" required></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Next"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>

                <!-- News Section -->
                <div class="news_left">
                    <h1>Latest News</h1>

                    <div class="news_box">
                        <div class="calendar">23</div>
                        <div class="news_content">
                            <p>Now learn how to develop Android applications free of cost.</p>
                            <a href="#" class="read_more">Read more</a>
                        </div>
                    </div>
                    <br>
                    <div class="news_box">
                        <div class="calendar">23</div>
                        <div class="news_content">
                            <p>We have latest projects uploaded on our site.</p>
                            <a href="#" class="read_more">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Left Content -->

            <!-- Right Content -->
            <div class="right_content">
                <h1>Latest Projects</h1>

                <div class="project_box">
                    <a href="#"><img src="images/p1.gif" alt="Project 1" class="left_img" border="0"></a>
                    <p>
                        <span>Description:</span><br>
                        Payment Billing System<br>
                        Online Quiz<br>
                        Matrimonial
                    </p>
                </div>

                <div class="project_box">
                    <a href="#"><img src="images/p2.gif" alt="Project 2" class="left_img" border="0"></a>
                    <p>
                        <span>Description:</span><br>
                        Gmail Account<br>
                        Latest Quiz
                    </p>
                </div>

                <br>
                <h1>Our Main Services</h1>
                <div class="services">
                    <ul>
                        <li><a href="#">Java Tutorial</a></li>
                        <li><a href="#">CSE Tutorial</a></li>
                    </ul>
                </div>
                <div class="services">
                    <ul>
                        <li><a href="#">DBMS Tutorial</a></li>
                        <li><a href="#">Python Tutorial</a></li>
                    </ul>
                </div>
            </div>
            <!-- End Right Content -->

            <div id="footer">
                <!-- Add your footer content here -->
            </div>

        </div> <!-- end center_box -->
    </div> <!-- end main_content -->
</div> <!-- end main_container -->

</body>
</html>
