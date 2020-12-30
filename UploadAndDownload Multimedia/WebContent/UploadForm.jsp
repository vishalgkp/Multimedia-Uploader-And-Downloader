<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Form</title>
</head>
<body>
<a href="Home.jsp">Back To Home</a>
<hr>

<fieldset style="width:400px;"><legend>Upload Document</legend>

<form action="UploadProcessor.jsp" 
     method="post"
     enctype="multipart/form-data">
 Title:<input type="text" name="doc_title"><br>
 Details:<input type="text" name="doc_details"><br>
 File1<input type="file"  name="file_1"><br>
 <input type="submit" value="Upload">
  
</form>




</fieldset>


</body>
</html>