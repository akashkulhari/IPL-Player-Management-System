<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>
<%@ include file="db.jsp" %>

<%
String spage = request.getParameter("page");
if(spage == null){
    spage = "1";
}

int pageNo = Integer.parseInt(spage);
int total = 5;

if(pageNo != 1){
    pageNo = pageNo - 1;
    pageNo = pageNo * total + 1;
}

PreparedStatement ps = con.prepareStatement(
"select * from players limit "+(pageNo-1)+","+total);

ResultSet rs = ps.executeQuery();
%>

<html>
<head>
    <title>View Players</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<body>

<!-- ? Navbar -->
<div class="navbar">
    <h2>IPL Manager</h2>
    <div>
        
        <a href="view.jsp?page=1">View Players</a>
    </div>
</div>

<div class="container">

    <h1>Players List</h1>

    <a href="index.jsp" class="add-btn">+ Add Player</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Country</th>
            <th>Team</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
        while(rs.next()){
        %>

        <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>

            <!-- ? Edit -->
            <td>
                <a href="edit.jsp?id=<%=rs.getInt(1)%>">Edit</a>
            </td>

            <!-- ? Delete -->
            <td>
                <a href="delete.jsp?id=<%=rs.getInt(1)%>"
                   onclick="return confirm('Are you sure you want to delete this player?')">
                   Delete
                </a>
            </td>
        </tr>

        <%
        }
        %>

    </table>

    <!-- ? Pagination -->
    <div class="pagination">
        <a href="view.jsp?page=1">1</a>
        <a href="view.jsp?page=2">2</a>
        <a href="view.jsp?page=3">3</a>
    </div>

</div>

</body>
</html>