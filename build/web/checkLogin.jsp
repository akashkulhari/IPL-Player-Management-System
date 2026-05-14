<%
String user = request.getParameter("username");
String pass = request.getParameter("password");

// Simple static login (for project)
if(user.equals("admin") && pass.equals("1234")){

    session.setAttribute("user", user);
    response.sendRedirect("index.jsp");

}else{
%>

<h2 style="color:red; text-align:center;">Invalid Login</h2>
<a href="login.jsp">Try Again</a>

<%
}
%>