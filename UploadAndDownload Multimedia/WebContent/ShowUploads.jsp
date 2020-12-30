<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="sis.com.SisDbConnectionUtil"%>
<%@page import="java.sql.Connection"%>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Uploads</title>
</head>
<body>
<a href="Home.jsp">Back To Home</a><hr>
<a href="UploadForm.jsp">More  Upload Form</a><br>
<%
  Connection con = SisDbConnectionUtil.getConnection();
String sql="select * from sis_doc";
PreparedStatement pstmt  =con.prepareStatement(sql);
ResultSet rs =pstmt.executeQuery();

while(rs.next()){
	long id  = rs.getLong("id");
	String title  = rs.getString("title");
	String details  = rs.getString("details");
	String fileName  = rs.getString("file_name");
	Timestamp createdTime =  rs.getTimestamp("created");
%>
  <a href="DownloadProcessor.jsp?id=<%=id%>">download</a>
  <%=id%> :<%=title%> :<%=details%> :<%=fileName%> :<%=createdTime%> :  :
  <hr>

<%
}//while end


con.close();


%>

</body>
</html>