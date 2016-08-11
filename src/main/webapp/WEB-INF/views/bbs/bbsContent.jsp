<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="bbsReplyForm.bow" var="replyForm">
  <c:param name="board_idx">${dto.board_idx}</c:param>
  <c:param name="ref">${dto.ref}</c:param>
  <c:param name="lev">${dto.lev}</c:param>
  <c:param name="subject">${dto.subject}</c:param>
  <c:param name="sunbun">${dto.sunbun}</c:param>
  <c:param name="fromWhere">${option_cp}</c:param>
</c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   
<script type="text/javascript" src="javascript/byteCheck.js"></script>	
<script type="text/javascript" src="javascript/httpRequest.js"></script>	
<script type="text/javascript" src="Script_trouble_solver/jsonPlugIn/json2.js" ></script>



  <script>

  
  function check(name,progid){
	  
	  var installed;
	  var msg;
	  
	  if(window.ActiveXObject) 
	  {
			 
      try{
		       var axObj = new ActiveXObject(progid);
			 
			  if(axObj)
			  {
				 installed = true;
			  }else
			  {
				 installed =false;
			  }
				 
		 }catch(e)
		 {
		    installed =false;
		 }
			 
					 if(installed)
					 {
						msg = '설치됨';
					 }else
					 {
					   msg= name+'미설치';
					 }
	  
        return msg;
     }
  }
	 var ex =check('Adobe PDF Link Helper','AcroIEHelperShim.AcroIEHelperShimObj');
   console.log(ex);
  
  /* tagType = input 등등 */
  /* tagName = input 등등 name="tagName" */
   /*    function getTagValue(tagType,tagname){
	       
           tagType==null?alert('noTageType'):tagType=tagType.toUpperCase();	 
          
           var inputs =document.getElementsByTagName(tagType);	  
    	   var targetValue =null;
    	   
                for(var a =0 ; a < inputs.length ; a++)
        	   {
        	      if(inputs[a].name ===tagname)
       	    	  {
        	    	  targetValue =inputs[a].value;
       	    	  }
        	   }
              
             return targetValue;   
      }         
     */
        
/*      function pwdCheck(url)
     {
    	 var board_idx= getTagValue('input', 'board_idx');
    	 var pwd= getTagValue('input', 'password');
    	 var params='password='+pwd+'&board_idx='+board_idx;
    
    	     sendRequest(url, params, check, 'POST');
    	 
    	     function check()
    	     {
    	    	 if(XHR.readyState==4)
    			 {
    			    if(XHR.status==200)
    		    	{
                     var result = XHR.responseText;   
                         result =JSON.parse(result);
                           alert(result.msg);
    		    	}
   	    		 }
    	     }
     }
    	 */
    /*javascript 용 위쪽-------------------------------------------------------------------   */
  
/*    function updateForm(index,option){
	   
	   var mother = document.getElementById("comment_table");
	 
			   var content = index+'_content';
			   var comment_board_idx = index+'_comment_board_idx'; 
			   var password = index+'_password';
			   
			
			   
	   var pwd =document.getElementById(password);
	   var pwdV=pwd.value;
	   
	   var cmt_idx =document.getElementById(comment_board_idx).firstChild.nextSibling;
	   var cmt_idxV=cmt_idx.value;
	   
	   
	   var content = document.getElementById(content);
	   var contentV = content.textContent;
	   
	   var ctt_c =document.createElement("TEXTAREA");
				    ctt_c.setAttribute("name", "content");
				    ctt_c.setAttribute("id", "content");
				    ctt_c.setAttribute("onclick","fnChkByte(this,'2000','t',null)");
                    ctt_c.innerHTML=contentV;  
				    
	    var spn = document.createElement("span");
			        spn.setAttribute("id", "t");
			        spn.setAttribute("value", "0");
	    
		
		content.removeChild(content.firstChild);
		content.appendChild(ctt_c);
		content.appendChild(spn);
	
	   
	   var params="password="+pwd+"&comment_board_idx="+cmt_idx+"&option="+option;
	   
		   
	   sendRequest(url, params, optionCk, 'POST');
	  	 
	   
	     function optionCk()
	     {
	    	 if(XHR.readyState==4)
			 {
			    if(XHR.status==200)
		    	{
                 var result = XHR.responseText;   
                  alert();  
                  result =JSON.parse(result);
                       alert(result.msg);
		    	}
			 }
	     } 
   } 
    	 */
    	 var plugin = navigator.plugins["Contoso.Control"];
    	
    	 if(plugin) {
    	 	// Contoso control is installed and enabled
    	 	console.log(plugin);
    	 } else {
    	   try {
    		   
    	     plugin = new ActiveXObject("Contoso");
    	     console.log(plugin);
    	   } catch(e) {
    	     // Contoso control is not installed or disabled
    	   }
    	 } 

  
  var isIE=window.ActiveXObject?true:false;
    	 
   console.log('Is this browser Internet Explore ? '+isIE);
    	 
  function sendSubmit(value,key,id_key)
  {

	var board_idx =value;
	alert(board_idx);
	var pwd = document.getElementById("passwordV");
	var delOrUpdate =key;
	
	if(value=='' || pwd.value=='')
	{
	  if(isIE)
	  {
  		  alert('값을 입력하세요.');
   	      return;
   	  
	  }else{
		 
			    pwd.value='';
			    pwd.placeholder='값을 입력하세요';
		    	pwd.focus();  
		    	return;
   	        }
	}
	
	var checkCommand="checkPwdNormal.bow";
	
	var deleteCommand ="bbsDeleteNormal.bow";
	var updateCommand ="bbsUpdateFormNormal.bow";
	
	/* var updateCmmentCommand="";
	var deleteCommentCommand=""; */
	
	var params ="password="+pwd.value+"&board_idx="+board_idx;
	    
 	sendRequest(checkCommand, params, getResult, 'POST'); 
	  
 		function getResult()
 		{
		 	 if(XHR.readyState==4)
			 {
			    if(XHR.status==200)
		    	{
		            var ajaxReturn = XHR.responseText; 
		                ajaxReturn =JSON.parse(ajaxReturn); 
		       
		            var result =ajaxReturn.result;   
                    
			              if(result && delOrUpdate=='delete')
			              {
					           	     if(confirm('정말로 삭제 하시겠습니까?'))
					           		 {
					           		   resultSend(deleteCommand,board_idx,pwd.value,'POST');
					           		 }
					           	     else
					           	     {
					           	    	$("#collapse-1").collapse("hide"); 
					           	    	
					           	    	
					           	    		pwd.value='';
						           	    	pwd.placeholder='수정&삭제 비밀번호';
						           	    	pwd.focus();
					           	    	
					           	    	    return;
					           	     }
			              }
			              else if(result && delOrUpdate=='update')
			              {
			            	  resultSend(updateCommand, board_idx, pwd.value,'POST'); 
			              }
			              else
		            	  {
			            	  if(isIE){
			            		  
			            		  alert('비밀번호가 틀립니다.');
			            		   pwd.value='';
			            	   
			            	  }else{
			            		  
			            		  pwd.value='';
				                     pwd.placeholder="비밀번호가 틀립니다.";  
				                     pwd.focus();
			            		  
			            	  }
		            	  }
		    	}
		 	}
 		} 
 	
 	 function resultSend(commandURL ,board_idx, password,method)
     {
 		 alert(board_idx);
 	  var form = document.createElement("FORM");
 	            form.setAttribute("type","hidden");
	 		    form.setAttribute("action",commandURL);
	 	        form.setAttribute("method", method);
 	    
	      var pwd = document.createElement("INPUT");
	            pwd.setAttribute("type", "hidden");
		 	    pwd.setAttribute("name", "password");
		 	    pwd.setAttribute("value", password); 

		 	    form.appendChild(pwd); 
 	    
		 	var inp1 = document.createElement("INPUT");
		 	    inp1.setAttribute("type", "hidden");
		 	    inp1.setAttribute("name", "board_idx");
		 	    inp1.setAttribute("value", board_idx);

 	            form.appendChild(inp1);
 		 
 	    window.document.body.appendChild(form);
 	    
 		form.submit();
 	 }
 	
 	
  } 

 
    
  /*빈 문자열 및 공백 체크 하는 bool test function  */
  /* 파라미터 값으로 체크 할 node를 입력 받는다  값이 아닌 노드 정보를 받는당!!!!
     true는 문제 없음 false 문제 있음 */  
  
     /*valid method get inputTextElement and return boolean value after checking element validation of submit */
    function validNumb(chaNode,num)
    {
	    var length =chaNode.maxLength;
	    
	    /* write information about inputText value into placeholder area  */
	    var lengthPlaceholder ='';
	    /* if num option value is not null, write information of character that korean & english value into placeholder area */
	    if(num!=null)
    	{
	    	if(isIE)
	    	{
      		  
      		  alert('한글 '+parseInt(length/3)+'자 / 영문 '+length+'자 허용');
      	   
      	    }else{
      		  
      		lengthPlaceholder ='한글 '+parseInt(length/3)+'자 / 영문 '+length+'자 허용';
      	  }
	    	
    	}
	    else
    	{
	    	if(isIE)
	    	{
      		  
      		}
	    	else
    		{
	    		lengthPlaceholder ='공백 없는 숫자 '+chaNode.maxLength+'자 허용';
    		}
	    	
    	}
	    /* value */
	    var tst = chaNode.value;
	    /* result variable for testing */
	    var bool =true;
       
	    /* check space area in the value and return boolean value */
    	if(/[\D]/gmi.test(tst))
   		{
    		if(isIE)
	    	{
    			alert('공백 없는 숫자 '+chaNode.maxLength+'자 허용');
    			chaNode.value='';
    			bool=false;
      		}
	    	else
    		{
	    		bool=false;
	    		chaNode.value="";	
	    		chaNode.placeholder=lengthPlaceholder;
    		}
    		
    		
   		}else
   		{
   			bool=true;
   		}	
    	   
    	   return bool;
         }
    

  
    
  </script>
<title>Insert title here</title>
</head>
<body>  
   <div class="container">
  <h1>BOW-TECH_BBS_CONTENT</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
	        	<td colspan="2"><span>조회수 : ${dto.readnum}</span></td>   
			</tr>
			<tr>
				<td><span>작성자 : ${dto.writer}</span></td>
				<td>작성일 :  ${dto.datechar}</td>		
			</tr>
			<tr>
			 <td colspan="2"><span>제&nbsp;&nbsp;&nbsp;목 : </span>${dto.subject}</td>
			</tr>
			<tr>
				<td colspan="3" class="col-md-2"><pre style="word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;">${dto.content}</pre></td>
			</tr>
	    </thead>
	   
	    <tbody>	
			<tr>
			   <td colspan="3">
			         <c:choose>
					     <c:when test="${dto.password==1}">
					                <c:choose>
						                 <c:when test="${option_cp!=null&&option!=null&&option_cp!=null}">
							                 <input type="button" onclick="location.href='boardSrcNormal.bow?cp=${option_cp}&option=${option}&option_value=${option_value}&board_idx_animate=${dto.board_idx}'" value="검색 목록가기">   
							             </c:when>
							             <c:otherwise> 
								             <input type="button" onclick="location.href='bbsListNormal.bow?cp=${cp}&board_idx_animate=${dto.board_idx}'" value="목록가기">
								         </c:otherwise> 
						            </c:choose>
						    <input type="button" name="reply" value="댓글 작성" onclick="location.href='${replyForm}'">
						  
						    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#collapse-1">수정 및 삭제</button>
				<form onsubmit="return false;">     
							  <div id="collapse-1" class="collapse" align="left" >
							    
							      <input type="password" name="password"  id="passwordV" placeholder="수정&삭제 비밀번호" oninput="validNumb(this)" required="required" maxlength="10">
							      <input type="button" name="updateForm"  value="수정" onclick="sendSubmit(${dto.board_idx},'update','passwordV');">
						          <input type="button" name="del_content" value="삭제" onclick="sendSubmit(${dto.board_idx},'delete','passwordV');">
						       
							  </div>
			    </form>  
					     </c:when>
					     <c:otherwise>	 
						        <c:choose>
						             <c:when test="${option_cp!=null&&option!=null&&option_cp!=null}">
						                 <input type="button" onclick="location.href='boardSrcNormal.bow?cp=${option_cp}&option=${option}&option_value=${option_value}&board_idx_animate=${dto.board_idx}'" value="검색 목록가기">   
						             </c:when>
						             <c:otherwise>
						                <input type="button" onclick="location.href='bbsListNormal.bow?cp=${cp}&board_idx_animate=${dto.board_idx}'" value="목록가기"> 
						             </c:otherwise>
						        </c:choose> 
					    </c:otherwise>
				</c:choose> 
             <%--    <input type="hidden" name="cp" value="${cp}">
				<input type="hidden" name="writer" value="${dto.writer}">
				<input type="hidden" name="board_idx" value="${dto.board_idx}">
				<input type="hidden" name="content" value=" ${dto.content}">
				<input type="hidden" name="subject" value="${dto.subject}">
				<input type="hidden" name="ref" value="${dto.ref}">
				<input type="hidden" name="sundbun" value="${dto.sunbun}"> 
 --%>            </td>
		  </tr>
	  </tbody>
	  
<%--  	     
     <tfoot>
			<tr>
	        	<td id="${i.index}_comment_board_idx" colspan="2" align="center"><span style="font-size: 20px;">덧글 영역</span></td>
            </tr>
       <c:choose>
           <c:when test="${comments!=null}">
                <c:forEach var="cmt" items="${comments}" varStatus="i">
				    <tr>
				        <td colspan="2" id="${i.index}_content">
				            <div style="display: inline-block;"> <span >&nbsp;No. ${cmt.list_idx}&nbsp;&nbsp;&nbsp;<b>${cmt.writer}</b></span> 
				            <label>Password:</label>
				            <input type="password" id="${i.index}_password">
							<input type="button" value="수정" onclick="updateForm('${cmt.comment_board_idx}','update','${i.index}_password')">
							<input type="button" value="삭제" onclick="updateForm('${cmt.comment_board_idx}','delete','${i.index}_password')"></div>
					    <pre style=" word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;">${cmt.content}</pre>			
				       </td>
					</tr>
                </c:forEach>  
                <c:if test="${dto.password==1}">
                   <tr>
                      <td colspan="2">
                        <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#comment-collapse">코멘트 남기기</button>
                       </td>
                    </tr>
                </c:if>
             </c:when>
	         <c:when test="${comments==null&&dto.password==1}">
				    <tr>
				  	    <td colspan="2">덧글없음</td>
				    </tr>
				    <tr>
                      <td>
                        <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#comment-collapse">코멘트 남기기</button>
                       </td>
                    </tr>
	         </c:when>
	   </c:choose>
	  </tfoot>     --%>     
  </table>
 
        <%--  <div id="comment-collapse" class="collapse" align="left">
		   <c:choose>
			    <c:when test="${dto.password==1}">
				    <form action="bbsCommentWriteNormal.bow" method="post" name="comment_area">
				      <div class="container">
					       <div>
						      <span>작성자:</span><input type="text" class="input-writer" name="writer" oninput="fnChkByte(this,30,null,null)" required>
						   </div>
						   <div>
						      <textarea name="content" style="width: 600px;" oninput="fnChkByte(this,'2000','t',null)" required></textarea>
						      <br><span id="t">0</span>/2000
						   </div>    
						   <div>
						       <span>비밀번호</span>
						       <input type="password" name="password" oninput="fnChkByte(this,'10',null,'num')" required="required">
				                <input type="submit" value="덧글입력">
						   </div>  
						<input type="hidden" name="board_idx" value="${dto.board_idx}">
					 </div>	
				    </form>
		      </c:when>
		     
		  </c:choose>
		  </div>  --%>
  </div>
</body>
</html>