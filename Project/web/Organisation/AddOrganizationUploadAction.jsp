<%-- 
    Document   : AddOrganizationUploadAction
    Created on : 9 Mar, 2021, 10:35:12 PM
    Author     : HP
--%>


<%@page import="java.sql.ResultSet"%>

 <jsp:useBean class="DBConnection.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Organization Package Action</title>
    </head>
    <body>
        <%
           
        File savedFile=null;
        FileItem f_item=null;
       
       

String field_name="";

String fn="",pf="",Organizationdetails="",OrganizationImages="";

String file_name="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
       
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
         
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
               
                k++;
        }
       else
       {
 
 
           //f_item=(FileItem)itr.next();
           
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           //to upload product image 
           if(field_name.equals("txtfile"))//write the name of image here it is img_product
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\Web\\Assets\\PackageDetails\\";
            Random r=new Random();//to generate random number
             int r_num=r.nextInt(1111)+999;//values between this are generated
             
             fn="Details_"+r_num+ext;//generating random number for images  so this name and format of imagewidth                   
            //creating a file object
             savedFile=new File(file_path+fn);//fn contains name of file 
            try
            {
                //writing the file object
                f_item.write(savedFile);    //writing to server means the folder          
               
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           
         
           
       }
           
           }
    //String str1="insert into tbl_wantedlist ()";
        String eid="";
   eid=session.getAttribute("eid").toString();
        String str1="insert into tbl_packages(packagecat_id,packages_name,packages_details,packages_rate,packages_remark,eventorg_id)values('"+value[0]+"','"+value[1]+"','"+fn+"','"+value[2]+"','"+value[3]+"','"+eid+"')";

  out.println(str1);
   
    boolean status=con.executeCommand(str1);
   
    if(status==true)
    {
      %>
      <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='AddOrganizationPackages.jsp'},100);
        </script>
     <%
    }
     }  


     

        %>
    </body>
</html>
