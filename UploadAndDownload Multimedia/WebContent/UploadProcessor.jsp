<%@page import="java.sql.PreparedStatement"%>
<%@page import="sis.com.SisDbConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="Home.jsp">Back To Home</a><hr>
<a href="UploadForm.jsp">More  Upload Form</a>
<%
// for check is multipart ServletFileUpload.isMultipartContent(request)

ServletFileUpload sfuHelper =new ServletFileUpload(new DiskFileItemFactory());
List<FileItem> itemList=  sfuHelper.parseRequest(request);

FileItem item1  = itemList.get(0);//title
FileItem item2  = itemList.get(1);//details
FileItem item3  = itemList.get(2);//file

//get data from user
String title = item1.getString();//getFieldName= doc_title
String details = item2.getString();//getFieldName= doc_details
//doc all data
long fileSize  = item3.getSize();
String fileName  = item3.getName();
InputStream fileDataIS = item3.getInputStream();
//insert data into db
//prit msg
%>

<%
  Connection con = SisDbConnectionUtil.getConnection();
String sql="insert into sis_doc(id,title,details,file_name,file_data)"
           +" values(sis_doc_seq.nextval,?,?,?,?)";
PreparedStatement pstmt  =con.prepareStatement(sql);
pstmt.setString(1,title );
pstmt.setString(2,details );
pstmt.setString(3,fileName );
pstmt.setBinaryStream(4,fileDataIS ,(int)fileSize);
int r =pstmt.executeUpdate();
con.close();


%>
<br>
<center>
<fieldset style="width:400px;">
Result UPLOADED?  <h3 style="color:green"> <%=(r==1)?"Success":"Failed" %></h3>
</fieldset>
</center>
</body>
</html>