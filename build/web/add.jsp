<%@ include file="db.jsp" %>

<%
String name = request.getParameter("name");
String role = request.getParameter("role");
String country = request.getParameter("country");
String team = request.getParameter("team");

PreparedStatement ps = con.prepareStatement(
"insert into players(name,role,country,team) values (?,?,?,?)");

ps.setString(1,name);
ps.setString(2,role);
ps.setString(3,country);
ps.setString(4,team);

int status = ps.executeUpdate();
%>

<html>
<head>
    <title>Success</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <h1>Result</h1>

    <%
    if(status > 0){
    %>
        <h2 style="color:green; text-align:center;">
            ? Player added successfully!
        </h2>
    <%
    } else {
    %>
        <h2 style="color:red; text-align:center;">
            ? Failed to add player
        </h2>
    <%
    }
    %>

    <div style="text-align:center; margin-top:20px;">
        <a href="index.jsp" class="add-btn">Add Another Player</a>
        <a href="view.jsp?page=1" class="add-btn">View Players</a>
    </div>

</div>

</body>
</html>