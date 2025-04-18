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
        PreparedStatement ps = con.prepareStatement("SELECT * FROM quizinfo WHERE subject LIKE ?");
        ps.setString(1, n + "%");  // Parameterized query to avoid SQL Injection

        ResultSet rs = ps.executeQuery();

        out.print("<br>");
        out.print("<table border='3' cellspacing=3 cellpadding=2 id='myTable'>");
        out.print("<tr><td><B>Quizs</B></td><td><B>Subject</B></td></tr>");

        // Iterating through the result set
        while (rs.next()) {
            out.print("<tr><td><a href='#' name='" + rs.getString("quizname") + "' onclick='javascript:viewAll(this.name)'>Quiz " + rs.getString("quizname") + "</a></td>");
            out.print("<td>" + rs.getString("subject") + "</td>");
            out.print("</tr>");
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
