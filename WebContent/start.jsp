<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<script>
var request;
function get1(){
    window.location='get1.jsp';
}

function get(){
    var v=document.querySelector('input[name="radio"]:checked') ? document.querySelector('input[name="radio"]:checked').value : null;
    if (v) {
        window.location="get.jsp?ans=" + v;
    } else {
        alert("Please select an option!");
    }
}

function sendInfo() {
    var v = document.myform.subject.value;
    var url = "findname2.jsp?val=" + v;
    if(window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if(window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    try {
        request.onreadystatechange = getInfo;
        request.open("GET", url, true);
        request.send();
    } catch(e) {
        alert("Unable to connect to server");
    }
}

function getInfo() {
    if(request.readyState == 4) {
        var val = request.responseText;
        document.getElementById('location').innerHTML = val;
    }
}

function viewAll(name) {
    var v = name;
    var url = "findname3.jsp?val=" + v;
    if(window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if(window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    try {
        request.onreadystatechange = viewInfo;
        request.open("GET", url, true);
        request.send();
    } catch(e) {
        alert("Unable to connect to server");
    }
}

function viewInfo() {
    if(request.readyState == 4) {
        var val = request.responseText;
        document.getElementById('location').innerHTML = val;
    }
}
</script>
</head>

<jsp:include page="header.jsp"></jsp:include>

<%
    String islogin = (String) session.getAttribute("islogin");
    if(islogin == null) {
        request.setAttribute("notlogin_msg", "Sorry, please do Login first");
        // Redirect to login page if not logged in
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
    %>
    <% 
        if(request.getAttribute("Error") != null) {
            out.print("<font size='2' color='red'>");
            out.print(request.getAttribute("Error"));
            out.print("</font>");
        }
    %>
    <% 
        if(request.getAttribute("finished") != null) {
            out.print("<font size='2' color='navy'>");
            out.print("<b>");
            out.print(request.getAttribute("finished"));
            out.print("</b>");
            out.print("</font>");
        }
    %>

    <div class="calendar_box2">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()">
                <b>Assess Yourself by taking quizzes on various subjects</b>
            </marquee>
            <form method="post" action="get1.jsp">
                <table>
                    <tr>
                        <td>
                            <%
                                String question = (String) session.getAttribute("question");
                                String option1 = (String) session.getAttribute("option1");
                                String option2 = (String) session.getAttribute("option2");
                                String option3 = (String) session.getAttribute("option3");
                                String option4 = (String) session.getAttribute("option4");
                                out.print(question);
                            %>
                            <%
                                if(request.getParameter("radio") != null) {
                                    String ans = request.getParameter("radio");
                                    session.setAttribute("ans", ans);
                                }
                            %>
                        </td>
                    </tr>
                    <tr><td><input type="radio" name="radio" value="<%=option1%>" /><%=option1%></td></tr>    
                    <tr><td><input type="radio" name="radio" value="<%=option2%>"/><%=option2%></td></tr>    
                    <tr><td><input type="radio" name="radio" value="<%=option3%>"/><%=option3%></td></tr>    
                    <tr><td><input type="radio" name="radio" value="<%=option4%>"/><%=option4%></td></tr>            

                    <tr><td></td><td><input type="submit" value="Next" /></td></tr>
                </table>
            </form>
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

</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body>
</html>
