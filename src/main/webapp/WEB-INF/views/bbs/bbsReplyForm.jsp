<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:url value="bbsReplyForm.bow" var="replyForm">
  <c:param name="board_idx">${dto.board_idx}</c:param>
  <c:param name="ref">${dto.ref}</c:param>
  <c:param name="lev">${dto.lev}</c:param>
  <c:param name="subject">${dto.subject}</c:param>
</c:url> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript" src="javascript/byteCheck.js"></script>	
<script type="text/javascript" src="javascript/httpRequest.js"></script>	
<link rel="stylesheet" href="css/commons.css">
</head>
<script type="text/javascript" src="javascript/byteCheck.js"></script>
<script>

function validWrite(){
	     
	    var isOk=false;
	       
	        
	       var inputArr =document.getElementsByTagName("INPUT");
	       var txtArea =document.getElementsByTagName("TEXTAREA")[0];
	       
	     
	    	   var txtTemp =txtArea.value;
	    	   
	    	  txtTemp=  txtTemp.replace(/^\s*/g,"");
              txtTemp=  txtTemp.replace(/\s*$/g,"");
           
           if(txtTemp=='')
        	  {
        	     txtArea.placeholder="필수 입력사항 입니다.";
        	     txtArea.style.background="#61b0d5";
        	    
        	  }else
   		  {
        		 txtArea.value=txtTemp;
        		 isOk=true;
   		  }
           
 	
	       /* 0=writer 1=subject  2=password */
	        for(var a =0 ; a< 3 ; a++)
     	{
     	     var temp= inputArr[a].value;
     	     
     	           temp=  temp.replace(/^\s*/g,"");
	               temp=  temp.replace(/\s*$/g,"");
	               temp=  temp.replace(/\s+/g," ");
	               
     	     if(temp==''|| temp==null)
    	    	 {
     	    	     inputArr[a].value='';
    	    	     inputArr[a].placeholder='필수 입력 사항 입니다.';
    	    	     inputArr[a].style.background="#61b0d5";
    	    	     isOk=false;
    	    	 }
     	     else
    	    	 {
    	    	   inputArr[a].value=temp;
    	    	 }
     	}
	       
	     if(isOk==true)
	     {
	    	 window.document.replyNormal.submit(); 
	     } 
} 


</script>
<body>
 <div class="container">
  <h1>BOW-TECH_BBS_REP</h1>
   <form action="replyWriteOkNormal.bow" method="POST" name="replyNormal" onsubmit="return false;">
  <table class="table table-bordered" style="width: 1100px;">
			<tr>
			  <td>	
				<span>작성자 : </span><input type="text" name="writer" oninput="fnChkByte(this,'30',null,null)" required  onkeypress="if(event.keyCode==13)validWrite();"></td>
			</tr>
			<tr>
				<td>
				   <span>제&nbsp;&nbsp;&nbsp;목 : </span><input type="text" name="subject" size="70" oninput="fnChkByte(this,'60',null,null)" required  onkeypress="if(event.keyCode==13)validWrite();">
				</td>
			</tr>
			<tr>
				<td><textarea class="txtarea-content" style="width: 100%; height: 700px;"name="content"oninput="fnChkByte(document.getElementsByTagName('textarea')[0],4000,'t')" required></textarea>
			<tr>
				<td><span id="t">0</span>/4000</td>
			</tr>
			<tr>
				<td><span>비밀번호: </span><input type="password" name="password" oninput="fnChkByte(this,'10',null,'num')" required  onkeypress="if(event.keyCode==13)validWrite();"></td>
			</tr>
			<tr>
	       <td>
	           <input type="hidden" name="sunbun" value="${dto.sunbun}">
	           <input type="hidden" name="ref" value="${dto.ref}">
	           <input type="hidden" name="lev" value="${dto.lev}">
	           <input type="hidden" name="board_idx" value="${dto.board_idx}">
	           <input type="button" value="댓글 달기" onclick="validWrite();">
	           <input type="button" value="뒤로" onclick="history.go(-1)">
	       </td>
	    </tr>
  </table>  
</form>
</div>
</body>
</html>