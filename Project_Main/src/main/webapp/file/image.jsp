<%@ page import="java.io.*, jakarta.servlet.*" %>
<%
    String fileName = request.getParameter("fileName");
    String uploadPath = "C:/uploads";
    String[] extensions = {".jpg", ".png", ".gif"};
    File imageFile = null;

    for (String ext : extensions) {
        if (fileName.contains(ext)) {
        	try
        	{
        		imageFile = new File(uploadPath, fileName);
        	}
        	catch(Exception ex)
        	{
        		imageFile = new File(uploadPath, "default-icon.png");
        	}
            response.setContentType("image/" + ext.substring(1));
            break;
        }
    }

    if (imageFile != null) {
        FileInputStream fis = new FileInputStream(imageFile);
        byte[] buffer = new byte[(int) imageFile.length()];
        fis.read(buffer);
        fis.close();
        response.getOutputStream().write(buffer);
    } else {
        response.sendRedirect("c:\\uploads\\default-icon.png");
    }
%>
