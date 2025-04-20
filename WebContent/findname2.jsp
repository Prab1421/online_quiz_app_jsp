<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String n = request.getParameter("val");

if (n != null && n.length() > 0) {
    try {
        // Loading MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // MySQL Database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

        // Using PreparedStatement to prevent SQL Injection
        PreparedStatement ps = con.prepareStatement("SELECT q.quizname, q.subject, qq.question, qq.option1, qq.option2, qq.option3, qq.option4 "
                + "FROM quizinfo q "
                + "JOIN quizques qq ON q.quizname = qq.quizname "
                + "WHERE q.subject LIKE ?");
        ps.setString(1, n + "%");  // Parameterized query to avoid SQL Injection

        ResultSet rs = ps.executeQuery();

        out.print("<br>");
        out.print("<table border='3' cellspacing=3 cellpadding=2 id='myTable'>");
        out.print("<tr><td><B>Quizs</B></td><td><B>Subject</B></td><td><B>Question</B></td></tr>");

        // Iterating through the result set
        while (rs.next()) {
            String quizName = rs.getString("quizname");
            String subject = rs.getString("subject");
            String question = rs.getString("question");
            String option1 = rs.getString("option1");
            String option2 = rs.getString("option2");
            String option3 = rs.getString("option3");
            String option4 = rs.getString("option4");

            // Debugging output
            out.print("QuizName: " + quizName + ", Subject: " + subject + ", Question: " + question + "<br>");
            out.print("Option1: " + option1 + ", Option2: " + option2 + ", Option3: " + option3 + ", Option4: " + option4 + "<br>");

            if (question != null && option1 != null && option2 != null && option3 != null && option4 != null) {
                out.print("<tr><td><a href='#' name='" + quizName + "' onclick='javascript:viewAll(this.name)'>Quiz " + quizName + "</a></td>");
                out.print("<td>" + subject + "</td>");
                out.print("<td>" + question + "</td>");
                out.print("<td>" + option1 + "</td>");
                out.print("<td>" + option2 + "</td>");
                out.print("<td>" + option3 + "</td>");
                out.print("<td>" + option4 + "</td></tr>");
            } else {
                out.print("<tr><td colspan='7'><font color='red'>Question or options data is missing for quiz: " + quizName + "</font></td></tr>");
            }
        }

        out.print("</table>");

        // Closing the connections
        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.print("<font style='color:red'>Error occurred while fetching quiz info.</font>");
    }
}
%>
