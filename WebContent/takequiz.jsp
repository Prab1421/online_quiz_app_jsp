<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<script>
var request;

function sendInfo() {
    var v = document.myform.subject.value;
    if(v.trim() === "") {
        document.getElementById('location').innerHTML = "";
        return;
    }
    
    var url = "findname2.jsp?val=" + encodeURIComponent(v);
    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    try {
        request.onreadystatechange = getInfo;
        request.open("GET", url, true);
        request.send();
    } catch (e) {
        alert("Unable to connect to server");
    }
}

function getInfo() {
    if (request.readyState == 4 && request.status == 200) {
        var val = request.responseText;
        document.getElementById('location').innerHTML = val;
    }
}
</script>
</head>

<jsp:include page="header.jsp"></jsp:include>

<%
String islogin = (String) session.getAttribute("islogin");
if (islogin == null) {
    request.setAttribute("notlogin_msg", "Sorry, Please do Login first");
    response.sendRedirect("index.jsp");
    return;
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
            out.print("<B>");
            out.print(request.getAttribute("finished"));
            out.print("</B>");
            out.print("</font>");
        }
    %>

    <div class="calendar_box2">
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()"><B>Assess Yourself by taking quizzes on various subjects</B></marquee>
            <form method="post" name="myform" action="get1.jsp">
			    Enter the subject: <input type="text" name="subject" onkeyup="sendInfo()" />
			    <input type="submit" value="Enter Quiz">
			    <div id="location"></div>
			</form>
        </div>
    </div>
</div>

<!-- End of left content -->

<div class="right_content">
    <h1>Latest Projects</h1>

    <div class="project_box">
        <a href="#"><img src="images/p1.gif" alt="" title="" class="left_img" border="0"></a>
        <p><span> Description:</span><br> Payment billing System Online Quiz<br> Matrimonial</p>
    </div>

    <div class="project_box">
        <a href="#"><img src="images/p2.gif" alt="" title="" class="left_img" border="0"></a>
        <p><span> Description:</span><br> Gmail Account<br> Latest Quiz</p>
    </div>
    <br>

    <h1>Our main Services</h1>
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

<!-- End of right content -->

<div id="footer">
</div>

</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body>
</html>
