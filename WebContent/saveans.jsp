<%@ page language="java" import="java.util.*" %>

<%
    // Get selected answer from request
    String selectedAns = request.getParameter("radio");
    String correctAns = (String) session.getAttribute("ans"); // correct answer stored earlier

    Integer count = (Integer) session.getAttribute("count");
    Integer marks = (Integer) session.getAttribute("marks");

    if (count == null) count = 0;
    if (marks == null) marks = 0;

    if (selectedAns != null && selectedAns.equalsIgnoreCase(correctAns)) {
        marks++;
    }

    count++;

    session.setAttribute("marks", marks);
    session.setAttribute("count", count);

    if (count >= 10) {  // quiz over
        response.sendRedirect("result.jsp");
    } else {
        response.sendRedirect("get.jsp"); // go to next question
    }
%>
