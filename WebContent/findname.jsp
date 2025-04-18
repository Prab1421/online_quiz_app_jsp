<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String n = request.getParameter("val");

if (n != null && n.length() > 0) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

        // Use PreparedStatement to avoid SQL injection
        PreparedStatement ps = con.prepareStatement("SELECT username FROM quizregister WHERE username = ?");
        ps.setString(1, n);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            out.print("<font style='color:red'>Username already exists</font>");
        } else {
            out.print("<font style='color:green'>Username available</font>");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("<font style='color:red'>Error occurred while checking username.</font>");
    }
}
%>
