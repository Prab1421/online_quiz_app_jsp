<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
try {
    String subject = request.getParameter("subject");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_db", "quizuser", "1234");
    
    // Insert into quizinfo table
    PreparedStatement ps = con.prepareStatement("INSERT INTO quizinfo(subject) VALUES(?)");
    ps.setString(1, subject);
    int s = ps.executeUpdate();
    
    // Close resources
    ps.close();
    con.close();
}
catch(Exception e) {
    e.printStackTrace();
}
%>

<jsp:forward page="createquiz1.jsp"></jsp:forward>