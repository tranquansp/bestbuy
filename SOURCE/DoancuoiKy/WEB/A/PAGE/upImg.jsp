<%-- 
    Document   : uploadImg
    Created on : Nov 3, 2011, 4:24:17 PM
    Author     : FreeX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head><title>Image Upload</title></head>

<body>
  <form action="../../UploadImage.do" method="post" 
   enctype="multipart/form-data" 
   name="productForm" id="productForm">
   <br/>
      Image Details:
      <br/>
  <input type="file" name="file" id="file">
  <input type="hidden" name="slot" value="2">
    <input type="submit" name="Submit" value="Submit">
  </form>
</body>

</html>