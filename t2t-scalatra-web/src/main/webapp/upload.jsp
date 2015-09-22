<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/27
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>upload</title>
</head>
<body>
<form action="FileUploadServlet/upload" method="post" enctype="multipart/form-data">
    <p>File to upload:
        <input type="file" name="file"/>
    </p>

    <p>
        <input type="submit" value="Upload"/>
    </p>
</form>
<p>
    Upload a file using the above form. After you hit "Upload"
    the file will be uploaded and your browser will start
    downloading it.
</p>

<p>
    The maximum file size accepted is 3 MB.
</p>
</body>
</html>
