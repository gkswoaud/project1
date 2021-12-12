<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="shopdb.*" %>


<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import = "org.apache.commons.fileupload.FileItem" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link href="css/front.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">


	
		<style>
		

form div.dynamiclabel{ 
  display: block;
  margin: 30px;
  font: 16px;
  position: relative;
}


form div.dynamiclabel1{ 
  display: block;
  margin: 30px;
  font: 16px;
  position: relative;
}


form div.dynamiclabel input[type="text"], form div.dynamiclabel textarea{
  width: 220px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel1 input[type="text"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel input[type="password"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel input[type="button"], form div.dynamiclabel textarea{
  width: 100px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}


form div.dynamiclabel input[type="submit"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}
form div.dynamiclabel input[type="reset"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel textarea{
  height: 200px;
}

form div.dynamiclabel1 textarea{
  height: 200px;
}


}
</style>
	


</head>


<script language=JavaScript >

function go(){
	window.location.href="index.jsp";}
</script>



<body>


<div id="jb-container">
<div id="jb-header">
<jsp:include page="header.jsp"/>


</div>
<div id="jb-top">
<jsp:include page="top.jsp"/>
</div>

<div id="jb-content">

 
<%
	BookEntity entity = new BookEntity();

	//업로드된 파일이 저장되는 폴더
	String strSaveDir = getServletContext().getRealPath("img/book");
	File saveDir = new File(strSaveDir);
    //업로드파일 저장 폴더 생성 
    if ( !saveDir.exists() ) saveDir.mkdir();
	out.println("업로드되는 파일이 저장될 폴더 : <br>" + saveDir.getPath() + "<p>");
	
	//업로드에 필요한 임시 폴더
	String strTempDir = getServletContext().getRealPath("temp");
	File tempDir = new File(strTempDir);
	if ( !tempDir.exists() ) tempDir.mkdir();
	out.println("업로드를 위한 임시 폴더 : <br>" + tempDir.getPath() + "<br><hr>");
	
    if (ServletFileUpload.isMultipartContent(request)) {  

		// 업로드된 파일을 임시저장하기 위한 팩토리 생성
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024*100);
        factory.setRepository(tempDir);

        // 파일을 업로드하기 위한 핸들러 생성
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 전송할 수 있는 최대 사이즈 
        upload.setSizeMax(1024*1024*10);
         
        // request를 분석해 각 항목으로 처리 
        List<FileItem> items = upload.parseRequest(request);

        for ( FileItem item : items ) {  
	        //일반 인자와 파일업로드 인자를 구분하여 처리 
            if (item.isFormField()) {
                // 파일 이외의 파라미터 내용 출력
                String name = item.getFieldName();
                String value = item.getString("UTF-8");
                out.println(item.getFieldName() + " : " + item.getString("UTF-8") + "<p><hr>");
                
                if(name.equals("isbn")){
					entity.setIsbn(value);
				}else if(name.equals("title")){
					entity.setTitle(value);
				} else if(name.equals("author")){
					entity.setAuthor(value);
				} else if(name.equals("publisher")){
					entity.setPublisher(value);
				} else if(name.equals("price")){
					entity.setPrice(Integer.parseInt(value));
				} else if(name.equals("category")){
					entity.setCategory(value);
				} else if(name.equals("remaining")){
					entity.setRemaining(Integer.parseInt(value));
				}  else if(name.equals("description")){
					entity.setDescription(value);
				}                		
               
            } else {
                // 업로드한 파일이 존재하는 경우
                if ( item.getSize() > 0) {	
                	//파일 이름만 추출하여 fileName에 저장
                    String fileName = new File( item.getName() ).getName();               	           
                    
                    try {
                        File uploadedFile = new File(saveDir, fileName);
                    	//같은 이름이 이미 있으면 현재 시간정보를 뒤에 붙인 파일 이름으로 저장   
                        if ( uploadedFile.exists() ) {
                        	java.util.Date now = new java.util.Date();
                        	
                        	int sp = fileName.lastIndexOf('.');
                        	String fileName1 = "";
                        	String extension = "";
                        	if(sp > 0){
                        		 fileName1 = fileName.substring(0, sp);
                        		 extension = fileName.substring(sp+1);                        	
                        	}                   		
                       
                        	String newFileName = fileName1 + "-" + now.getTime() + "." + extension;
                        	uploadedFile = new File(saveDir, newFileName);
                            out.println("이름이 같은 파일이 이미 있어 다음 파일 이름으로 수정하였습니다. <br>");
                            out.println("이전 파일 이름 : " + fileName + ", ");
                            out.println("수정 파일 이름 : " + newFileName + "<p>");
                        }
                    	                   	
                        //업로드 파일 저장
                        item.write(uploadedFile);
                        out.println("업로드 폴더 위치 : " + saveDir.getPath() + "<br>");
                        out.println("업로드 파일 이름 : " + uploadedFile.getName() + "<p><hr>");

                        entity.setImg(uploadedFile.getName());
        				                                                        
                    } catch(IOException e) {
                        
                        out.println(e.toString());
                    }
                }
            }  
        }
    }

	ControlDAO bookDAO = new ControlDAO();
	bookDAO.insertBook(entity);
%>


	out.println("<script>alert('정상적으로 등록되었습니다.');go();</script>");
 
</div>

<div id="jb-footer">

<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>
