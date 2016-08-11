<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
       alert("${msg}");
       
       <%if(request.getAttribute("location")!=null)
           {%> 
           location.replace("${location}");
           
           <%}%>
          
       
         
       
       
       
      
</script>
