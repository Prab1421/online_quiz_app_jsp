<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>

<%
String islogin = (String) session.getAttribute("islogin");
if (islogin == null) {
    response.sendRedirect("index.jsp"); // Redirect to login page
    return;
}
%>

<div class="content">
    <!-- Your main content goes here -->
    <h1>Welcome to the Quiz Platform</h1>
    <p>Please select a subject to begin your quiz.</p>

    <!-- Example Quiz Section -->
    <form method="post" name="quizform" action="quizResults.jsp">
        <label>Enter the subject: </label>
        <input type="text" name="subject" onkeyup="sendInfo()" />
        <div id="location"></div>
    </form>
</div>

<jsp:include page="footer.html"></jsp:include>

<script>
// JavaScript functions for AJAX-based dynamic content fetching (if needed)
var request;

function sendInfo() {
    var v = document.quizform.subject.value;
    if (v.trim() === "") {
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
