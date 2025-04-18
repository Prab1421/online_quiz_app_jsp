<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
try {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String question = request.getParameter("question");

    // Load MySQL JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Connect to MySQL (update DB name if needed)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");

    // Insert data into quizq table
    PreparedStatement ps = con.prepareStatement("INSERT INTO QUIZQ (NAME, EMAIL, PHONE, QUESTION) VALUES (?, ?, ?, ?)");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, phone);
    ps.setString(4, question);

    int s = ps.executeUpdate();

    // Close resources
    ps.close();
    con.close();

} catch(Exception e) {
    e.printStackTrace();
}
%>

<jsp:forward page="home.jsp"></jsp:forward>
