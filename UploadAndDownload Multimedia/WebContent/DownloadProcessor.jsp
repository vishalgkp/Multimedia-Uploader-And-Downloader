<%@page import="java.io.InputStream"%>
<%@page import="sis.com.SisDbConnectionUtil"%>
<%@page import="java.sql.*"%>
<%
long id  = Long.parseLong(request.getParameter("id"));


Connection con = SisDbConnectionUtil.getConnection();
String sql="select * from sis_doc where id=?";
PreparedStatement pstmt  =con.prepareStatement(sql);
pstmt.setLong(1, id);
ResultSet rs =pstmt.executeQuery();

if(rs.next()){
	String title  = rs.getString("title");
	String details  = rs.getString("details");
	String fileName  = rs.getString("file_name");
	Timestamp createdTime =  rs.getTimestamp("created");
	InputStream fileDataIS = rs.getBinaryStream("file_data");

	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment; filename=\""+fileName+"\" ");

	
	ServletOutputStream sos=response.getOutputStream();
    byte [] buff  = new byte[1024*1024];
    int length;
    while( (length=fileDataIS.read(buff))!=-1){
    	sos.write(buff,0, length);
    }
    sos.close();
    }

	con.close();
%>