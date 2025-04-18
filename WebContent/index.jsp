<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Login Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  
<div id="main_container">
    <div class="main_content">
        <div id="header">
        </div>
        <div class="top_center_box"></div>
        <div class="center_box">

            <div id="menu_tab">                                     
                <ul class="menu">                                                                               
                     <li><a href="home.jsp" class="nav">Home</a></li>
                     <li class="divider"></li>
                     <li><a href="takequiz.jsp" class="nav">Take Quiz</a></li>
                     <li class="divider"></li>
                     <li><a href="ask.jsp" class="nav">Ask Ques.</a></li>
                     <li class="divider"></li>
                     <li><a href="contact.html" class="nav">Contact</a></li>
                     <li class="divider"></li>
                     <li><a href="makequiz.jsp" class="nav">Make quiz</a></li>
                     <li class="divider"></li>
                     <li><a href="register.jsp" class="nav">Register</a></li>    
                </ul>
            </div> 

            <div class="middle_box">
                <div class="middle_box_text_content">
                    <div class="middle_box_title"></div>
                    <p class="middle_text"></p>
                </div>
            </div>

            <div class="left_content">
                <% 
                    if(request.getAttribute("notlogin_msg") != null){
                        out.print("<font size='2' color='red'>");
                        out.print(request.getAttribute("notlogin_msg"));
                        out.print("</font>");
                    }
                %>
                <% 
                    if(request.getAttribute("Error") != null){
                        out.print("<font size='2' color='red'>");
                        out.print(request.getAttribute("Error"));
                        out.print("</font>");
                    }
                %>

                <div class="calendar_box">
                    <div class="calendar_box_content">
                        <h1>Welcome to my Site</h1>
                        <form method="post" action="loginprocess.jsp">
                            <table>
                                <tr><td style="color:navy;"><b>Login Form</b></td></tr>
                                <tr><td>Category:</td><td>
                                    <select name="category">
                                        <option>Select a Category</option>
                                        <option>Teacher</option>
                                        <option>Student</option>
                                    </select>
                                </td></tr>
                                <tr><td>User Name:</td><td><input type="text" name="username" /></td></tr>
                                <tr><td>Password:</td><td><input type="password" name="userpass" /></td></tr>
                                <tr><td></td><td><input type="submit" value="Sign in"/> <a href="register.jsp">Register</a></td></tr>
                            </table>
                        </form>
                    </div>
                </div>

                <div class="news_left">
                    <h1>Latest News</h1>
                    <div class="news_box">
                        <div class="calendar">23</div>
                        <div class="news_content">
                            <p><span></span>Now learn how to develop Android applications free of cost.</p><br>
                            <a href="http://www.javatpoint.com" class="read_more">Read more</a>                        
                        </div>
                    </div>
                    <br>
                    <div class="news_box">
                        <div class="calendar">23</div>
                        <div class="news_content">
                            <p><span></span>We have the latest projects uploaded on my site.</p>
                            <a href="http://www.cstpoint.com" class="read_more">Read more</a>                        
                        </div>
                    </div>                    
                </div>

            </div> <!-- End of left content -->

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
                        <li><a href="http://www.javatpoint.com">Java Tutorial</a></li>
                        <li><a href="http://www.cstpoint.com">CSE Tutorial</a></li>
                    </ul>
                </div>

                <div class="services">
                    <ul>                                         
                        <li><a href="http://www.javatpoint.com">Java Tutorial</a></li>
                        <li><a href="http://www.cstpoint.com">CSE Tutorial</a></li>
                    </ul>
                </div>  
            </div> <!-- End of right content -->

        </div> <!-- End of center box -->
    </div> <!-- End of main content -->
</div> <!-- End of main container -->

</body>
</html>
