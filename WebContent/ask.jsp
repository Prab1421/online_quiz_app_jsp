<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Contact Us</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<div id="main_container">
  <div class="main_content">

    <div id="header"></div>

    <div class="top_center_box"></div>

    <div class="center_box">
      <!-- Navigation Menu -->
      <div id="menu_tab">
        <ul class="menu">
          <li><a href="home.jsp" class="nav">Home</a></li>
          <li class="divider"></li>
          <li><a href="takequiz.jsp" class="nav">Take Quiz</a></li>
          <li class="divider"></li>
          <li><a href="ask.jsp" class="nav">Ask Ques.</a></li>
          <li class="divider"></li>
          <li><a href="makequiz.jsp" class="nav">Make Quiz</a></li>
          <li class="divider"></li>
          <li><a href="contact.jsp" class="nav">Contact</a></li>
          <li class="divider"></li>
          <li><a href="register.jsp" class="nav">Register</a></li>
        </ul>
      </div>

      <!-- Main Content -->
      <div class="middle_box">
        <div class="middle_box_text_content">
          <div class="middle_box_title"></div>
        </div>
      </div>

      <!-- Left Content -->
      <div class="left_content">
        <!-- Contact Info -->
        <div class="calendar_box">
          <div class="calendar_box_content">
            <h1>Contact Us</h1>
            <img src="images/contact_icon.gif" alt="Contact Icon" title="Contact Icon">
            <p class="contact_info">
              <span class="orange">Address:</span> H-109, Shakarpur<br>
              <span class="orange">Telephone:</span> 0123456789<br>
              <span class="orange">Email:</span> 
              <a href="mailto:info@company.com">info@company.com</a><br>
            </p>
          </div>
        </div>

        <!-- Ask Question Form -->
        <div id="contact_form">
          <h1>Ask Question</h1>
          <form action="askq.jsp" method="post">
            <div class="form_row">
              <label>Name:</label>
              <input name="name" class="contact_input" type="text" required>
            </div>

            <div class="form_row">
              <label>Email:</label>
              <input name="email" class="contact_input" type="email" required>
            </div>

            <div class="form_row">
              <label>Phone:</label>
              <input name="phone" class="contact_input" type="tel" pattern="[0-9]{10}" required>
            </div>

            <div class="form_row">
              <label>Question:</label>
              <textarea name="question" class="contact_textarea" required></textarea>
            </div>

            <input type="submit" class="read_more" value="Send">
          </form>
        </div>
      </div>

      <!-- Right Content -->
      <div class="right_content">
        <h1>Our Clients</h1>

        <div class="project_box">
          <a href="#"><img src="images/clients_icon.gif" alt="Client" title="Client" class="left_img" border="0"></a>
          <p><a href="https://www.javatpoint.com" target="_blank">javatpoint.com</a></p>
        </div>

        <div class="project_box">
          <a href="#"><img src="images/clients_icon.gif" alt="Client" title="Client" class="left_img" border="0"></a>
          <p><a href="https://www.cstpoint.com" target="_blank">cstpoint.com</a></p>
        </div>
      </div>

      <!-- Footer -->
      <div id="footer">
        <!-- You can add footer content here -->
      </div>

    </div> <!-- end of center_box -->

  </div> <!-- end of main_content -->
</div> <!-- end of main_container -->
</body>
</html>
