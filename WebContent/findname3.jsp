<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String n = request.getParameter("val");

// Check if 'n' is not null and has a valid length
if (n != null && n.length() > 0) {
    // Set session attribute
    session.setAttribute("quizname", n);

    // Display quiz description
    out.print("<font style='color:navy'><b>Quiz " + n + " contains 10 questions.<br>Each question is worth 1 point.</b><br></font>");

    // Display button to start the quiz
    out.print("<form method='post' action='startQuiz.jsp'>");
    out.print("<input type='submit' value='Start Quiz' />");
    out.print("</form>");
}
%>
