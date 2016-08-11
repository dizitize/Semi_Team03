<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
	/* 리스트 생성테이블 태그 id = listTable */
	/* 페이징 파라그래프 태그 id = pagingP */
    </style>
<title>Bow-tech</title>
<script type="text/javascript" src="javascript/httpRequest.js"></script>
<script>
/* window.addEventListener('popstate', function (e) {
    var state = e.state;
    if (state !== null) {
        alert(state);
    }
}); */
/*$().ready 와 같다  */
/* 	var i = 0;
 window.onload = function(){
	 
	    var currentPage = 1;
	    checkForHash();
	    $(‘#btn1’).add(‘#btn2’).add(‘#btn3’).bind(‘click’, function(e) {
	        currentPage = $(this).val();
	        showPage($(this).val());
	    });
	 
	    $(‘#link’).bind(‘click’, function(e) {
	        document.location.hash = “#” + currentPage;
	    });
	});
	 
	function checkForHash() {
		alert('왔어');
	    if(document.location.hash){
	        var HashLocationName = document.location.hash;
	        HashLocationName = HashLocationName.replace('#','');
	        alert(HashLocationName);
	        document.getElementById('listDiv').html(hashLocationName);
	        
	        
	        
	    } else {
	        $(“#display”).html($(‘#btn1’).val()) 
	    }
	}
	
	function showPage(value) {
	  $(“#display”).html(value) 
	}
		
}
 */

var StringBuilder = function(){
	   
	   this.buffer = new Array();
  }
  
  StringBuilder.prototype.Append = function(strValue){
	/*   alert('this.buffer : '+this.buffer.length); */
	   this.buffer[this.buffer.length] = strValue;
	   /* alert("Append: "+this.ToString()); */
  }
  
  StringBuilder.prototype.AppendFormat = function(){	 
	   var count = arguments.length;
	  /*  alert('argumentslenngth'+count); */
	   if(count<2)return "";
	   var strValue =arguments[0];
	   for(var i =0 ; i<count ; i++)
	    strValue=strValue.replace("{"+(i-1)+"}",arguments[i]);
	   this.buffer[this.buffer.length] = strValue;	   
  }
  
  StringBuilder.prototype.Insert = function (idx, strValue){
	/*  alert('Insert:'+ this.buffer.splice(idx,0,strValue)); */
	   this.buffer.splice(idx,0,strValue);
	   
  }
  
  StringBuilder.prototype.Replace = function(from,to){
	  /*  alert('Replace'); */
	   for(var i = this.buffer.length-1 ; i >=0 ; i--)
		   /* alert('buffer['+i+']='+buffer[i]);
		   alert( 'this.buffer[i].replace(new RegExp(from,"g"),to) : '+this.buffer[i].replace(new RegExp(from,"g"),to)); */
		   this.buffer[i].replace(new RegExp(from,"g"),to);
  } 
  
  StringBuilder.prototype.ToString =function(){
	   /* alert('ToString : '+this.buffer.join("")); */
	   return this.buffer.join("");	   
  }  
 
 
 
  var jsonDto=null;
   
    function show(command, params, targetId, method){
	   
	   sendRequest(command, params, listCall,method, true);
	   
	   function listCall(){
		   
		   if(XHR.readyState==4)
			 {
			    if(XHR.status==200)
		    	{
		    	   var result =XHR.responseText;
		    	   document.getElementById(targetId).innerHTML=result;
		    	     
		    	}
			 }
	   }
   } 
 
  /*   function changeUrl(title, url, state) {
	    if (typeof (history.pushState) != "undefined") { //브라우저가 지원하는 경우
	        history.pushState(state, title, url);
	    }
	    else {
	        location.href = url; //브라우저가 지원하지 않는 경우 페이지 이동처리
	    }
	}
     */
 
   function bbsAjax(command,params,method )
   {
	   	   
	   command = command||'bbsList.bow';           
	   params  = params ||'cp_s=1';
	   
	  sendRequest(command, params, respText, method);	
	  	    
		   function respText()
		   {  			   
			  	 if(XHR.readyState == 4 )
			  	 {
			  	    if(XHR.status == 200)
			      	{ 
				  	      var result = XHR.responseText;
				  	    	  result = JSON.parse(result);
				  	    	     
				  	       if(command=='bbsList.bow')
				  	       {
				  	    	   bbsList(result);
				  	    	   jsonDto=result;
				  	    	  /*  alert(JSON.stringify(jsonDto)); */
				  	       }
				  	       if(command=='bbsContent.bow')
				  	       {
				  	    	   bbsContent(result);
				  	       }
			  	     }
		  	      } 
		   }
   }
	    
     
     
     
     
     
   
   function content(idx){
	   
	   var dto = jsonDto.listDto[idx];
	   var sb = new StringBuilder();	
	   var arr =['subject','writer','content'];
     /*    alert(JSON.stringify(dto)); */
/* 	   alert(idx);  */
	   sb.Append("<table id='listTable'>");
		 
	      sb.Append("<tr>");
			  sb.Append('<th>글번호</th><td>'+dto.board_idx+'</td>');
			  sb.Append('<td colspan="2" id="subject">'+dto.subject+'</td>');
		  sb.Append("</tr>");	  
		  
		  sb.Append("<tr>");	  
			  sb.Append('<th>글쓴이</th><td id="writer">'+dto.writer+'</td>');
			  sb.Append('<th>작성일</th><td>'+dto.writedate+'</td>');		 
		  sb.Append('</tr>');
		  
		  sb.Append('<tr>');
		      sb.Append('<td colspan="2"><pre id="content">'+dto.content+'<pre></td>');
		  sb.Append('</tr>');
		  
		  sb.Append('<tr>');
		   sb.Append('<td>');

		      sb.Append('<input type="button" value="댓글 작성" id="reWrite" onclick="javascript:commentForm('+idx+');">');
		      sb.Append('<input type="button" value="수정 및 삭제" onclick="contentUpdate('+arr+')">');
		      sb.Append('<input type="button" value="돌아가기"onclick="javascript:bbsAjax(\'bbsList.bow\',\'cp_s='+jsonDto.pageInfo.cp+'\',\'POST\');">');
		      
		  sb.Append('</td>');
		 sb.Append('</tr>');

		 sb.Append('<br><br>');	
		 
		 var result=sb.ToString();
		 
		  var cmt = commentListShow(dto);
		 
		    result=result+cmt;
		   
		   document.getElementById('listTable').innerHTML=result;
   }
   
  function contentUpdate(idz){
	
	/*   for(var a =0 ; a<inputArr.length; a++)
	  {
	     var tmp =document.getElementById(inputArr[a]);

	  } */
	  
  }
   
   
   
   function commentListShow(dto){
		
	   var sb = new StringBuilder();	
	   
	   if(dto.commentDto.length>0)
		 {    
			
		   var cmts = dto.commentDto;
		    
			  sb.Append('<tr>');
			     sb.Append('<td colspan="3" align="center">');         
			       sb.Append('<span>댓글</sapn>');
			     sb.Append('</td>');
			 sb.Append('</tr>');
		 
				 for(var a = 0 ; a < cmts.length; a++)
				 {  
					 sb.Append('<tr>');
					      sb.Append('<th>글번호</th><td>'+cmts[a].comment_board_idx+'</td>');
					      sb.Append('<th>작성자</th><td>'+cmts[a].writer+'</td>');
					      sb.Append('<th>작성시간</th><td>'+cmts[a].writedate+'</td>');
				      sb.Append('</tr>'); 
				      
				      sb.Append('<tr>');
					      sb.Append('<td colspan="2"><pre id="comment_node_content">'+cmts[a].content+'<pre></td>');
					 sb.Append('</tr>');
				 }
				    sb.Append('<tr>');
					    sb.Append('<td>');
					    sb.Append('<input type="button" value="수정 및 삭제" onclick="#">');
					    sb.Append('</td>');
				    sb.Append('</tr>');
		 }
		 else
		 {
			 sb.Append('<tr>');
		     sb.Append('<td colspan="3" align="center">');         
		       sb.Append('<span>덧글 없음</sapn>');
		     sb.Append('</td>');
		 sb.Append('</tr>');
		 }
		
		return sb.ToString();   
   }
	 	 
	

   
   /*  ======================================================================================   */
  
   /*  ======================================================================================   */
   
   function bbsList(result){
	    	  
	  var dtoList =result.listDto;
	  var command =result.command;
	  var pageInfo=result.pageInfo;
	  var cp=pageInfo.cp;
	
	  var motherNode=document.getElementById('listDiv');
	  /* 각 dto에서 필요한 정보를 추출 key */
	  var dtoKey= ["board_idx","subject","writer","writedate"]; 
	  var sb = new StringBuilder();	  
	  
	  
 sb.Append("<table id='listTable'>");
	 
      sb.Append("<tr>");
		  sb.Append("<th>글번호</th>");
		  sb.Append("<th>제목</th>");
		  sb.Append("<th>글쓴이</th>");
		  sb.Append("<th>작성일</th>");		 
	  sb.Append("</tr>");
	  
	 /*  alert(dtoList.length); */
	
        for( var a = 0 ; a < dtoList.length;  a++ )
	    {
            /*dto list 에 들어 있는 dto들 접근  */	
        	var dto=dtoList[a];
        	
          sb.Append("<tr>");
        
	        	   for(var b = 0 ; b < dtoKey.length ; b++)
		    	   {
	        	      /* 각 dto에서 key & value 정보 추출 */
	        	      var key=dtoKey[b];
	        	      var val= dto[key];
	        	    
        	               if(dtoKey[b]==dtoKey[1])
        	        	  {  /*  alert(JSON.stringify(dto)); */
        	        	       
        	        	     if(dto.lev!=0)
        	        	     {
        	        	    	 var temp="";
        	        	    	  for(var c= 0 ; c <=dto.lev; c++)
           	        	          {
                                     temp="&nbsp;&nbsp;&nbsp;";     	        	    	   
           	        	          }        	        	    	  
        	        	    	       val=temp+val;
        	        	     }

        	        	      sb.Append("<td>");			        		 	    	            				    	     		    	   
 		    	              sb.Append("<button onclick='content("+a+")'>"+val+"</button>");
 		    	            /*    sb.Append("<button onclick='alert()'>"+val+"</button>"); */ 
 		    	              sb.Append("</td>");        	        	  
        	        	  }
        	              else
        	              {
        	            	  sb.Append("<td>");			        		 	    	            				    	     		    	   
		    	              sb.Append(val);
		    	              sb.Append("</td>"); 
        	              }	   	        		 
		    	   }
	      sb.Append("</tr>");       	 
	    } 
        sb.Append("<tr>");
            sb.Append('<td colspan="4" align="right">');	
                sb.Append('<input type="button" value="글쓰기" onclick="javascript:bbsWriteform()">')
	        sb.Append('</td>'); 
         sb.Append("</tr>");
  sb.Append("</table>");
		  /* 결과값으로 list view 제작 */
		  /*key =listDto  */
		  
		  /*결과값으로 페이징을 작업  */ 
		  /*key =paringInfo  */
		 /*   alert(result.pageInfo.cp); */ 
		  /*key =pagingUrl  */
		   /* alert(result.command);  */
		    var result=sb.ToString();
		  	var pagingResult=paging(pageInfo);
		  	/* alert(pagingResult); */
		  	 result=result+pagingResult;
		  /* 	result=result+"<tr><td>"+pagingResult+"</td></tr>" */
		  /*  alert(Object.keys(dto)+'   '+Object.keys(firstObj)[2]); */
		  /* 결과값으로 뿌려주기   */
	/* 	var sb = new StringBuilder();
		sb.Append("Helllo~~~ 안영하세요<br>");
		sb.AppendFormat("내이름은{0},나이는{1}<br>","김산순","30");
		sb.AppendFormat("니나이는{0},내나니은{1}","92","19")
		sb.Append("hello 헬호")
		sb.Insert(2,"2번째 줄에 넣으세요<br>");
		sb.Replace("hello","hi");
		 alert(sb.ToString());  */
		
		 /* var stateObj = { url : "bbsList()"  };
	     history.pushState(stateObj, "bbsList()", "bbsAjax(bbsList)");
		  */
		 
	    document.getElementById('listDiv').innerHTML=result;
   }
   
   /*  ======================================================================================   */
  
   function paging(pageInfo){
	  	  
		    var ls =pageInfo.ls;
		    var ps =pageInfo.ps;
		    
		    var cp = pageInfo.cp;
		    var totalCnt =pageInfo.totalCnt;
                
		    var totalP =parseInt(totalCnt%ls!=0?(totalCnt/ls)+1:totalCnt/ls);
		    var userG =parseInt(cp%ps!=0?cp/ps:(cp/ps)-1);
	        var maxG =parseInt(totalP%ps!=0?totalP/ps:(totalP/ps)-1);
	       
	  
	     var sb = new StringBuilder();    
	    
	sb.Append('<p id="pagingP">');
	 
	if(userG!==0 && maxG!=0)
	 {
			 if(userG >=2)
			 {
				  sb.Append('<input type="button" value="&lt;&lt;&nbsp;"');   
			      sb.Append('onclick="javascript:bbsAjax(\'bbsList.bow\',1,\'POST\');">');	
			 } 			
			 
		  sb.Append('<input type="button" value="&lt;&nbsp;"');   
	      sb.Append('onclick="javascript:bbsAjax(\'bbsList.bow\',\'cp_s='+(((userG-1)*ps)+ps)+'\',\'POST\');">');	
	 }
	  
	if(totalP!=0)
	{
	    for(var c = parseInt((userG*ps)+1) ; c <= parseInt((userG*ps)+ps) ; c++  )
	    	{
	    	
		    	    if(c===cp)
		    	    	{
		    	    	   sb.Append('<input type="button" style="color:red;" value="');   
		 			        sb.Append(c);
		 			       sb.Append('"onclick="javascript:bbsAjax(\'bbsList.bow\',\'cp_s='+c+'\',\'POST\');">');		   
		    	    	 
		    	    	}
		    	    else{
		    	    	   sb.Append('<input type="button" value="');   
		 			        sb.Append(c);
		 			       sb.Append('"onclick="javascript:bbsAjax(\'bbsList.bow\',\'cp_s='+c+'\',\'POST\');">');		   
		    	    	 
		    	         }
		    		   
	    	    if(totalP===c)break;
	    	}
	  
		    if(userG!=maxG && totalP>ps)
	    	{
		    	
		       sb.Append('<input type="button" value="&gt;&nbsp;"');   
		       sb.Append('onclick="javascript:bbsAjax(\'bbsList.bow\',\'cp_s='+(((userG+1)*ps)+1)+'\',\'POST\');">');	
			       
			       if(userG <= maxG-1)
				   {					   
					   sb.Append('<input type="button" id="bbsList" value="&gt;&gt;&nbsp;"');   
				       sb.Append('onclick="javascript:bbsAjax(\'bbsList.bow\',\'cp_s='+totalP+'\',\'POST\');">');	
				   }
	    	}
	}
	  sb.Append('</p>');
	  
	 return sb.ToString();
  }
   
  
   /*  ======================================================================================   */
   	   
function bbsWriteform(){
	   	   
	   var sb = new  StringBuilder();
	   
	   sb.Append('<form id="writeForm">');
	      sb.Append("<tr>");
		      sb.Append("<td>");
		      	sb.Append('작성자<input type="text" name="writer" onkeyup="fnChkByte(this,\'20\')" required>');	
		      sb.Append("</td>");
	      sb.Append("</tr>");
	      
	      sb.Append("<tr>");
		      sb.Append("<td>");
		      	sb.Append('제목<input type="text" name="subject" onkeyup="fnChkByte(this,\'50\')" required>');	
		      sb.Append("</td>");
	      sb.Append("</tr>");	  
	      
	      sb.Append("<tr>");
	      sb.Append("<td>");
	      	sb.Append('<textarea name="content" onkeyup="fnChkByte(this,\'4000\',\'ta\')"></textarea>');
	    	sb.Append('<span id="ta">0</span>/4000');	
	      sb.Append("</td>");
        sb.Append("</tr>");	  
			  
	      sb.Append("<tr>");
	      sb.Append("<td>");
	      	sb.Append('password: <input type="password" name="password" onkeyup="fnChkByte(this,\'10\',null,\'pwd\')" required>');	
	      sb.Append("</td>");
        sb.Append("</tr>");
        
     sb.Append('<input type="button" value="작성" onclick="javascript:write()">');	  
     sb.Append("<form>");	  
	     	     	      
	   var result=sb.ToString();
	   document.getElementById('listTable').innerHTML=result;	   
   }


function commentForm(idx){
	
	   var dto = jsonDto.listDto[idx];
	   var sb = new  StringBuilder(); 
	   
	     sb.Append('<form id="commentForm" action="bbsComment.bow" method="POST">');
	      sb.Append("<tr>");
		      sb.Append("<td>");
		      	sb.Append('작성자<input type="text" name="writer" onkeyup="fnChkByte(this,\'20\')" required>');	
		      sb.Append("</td>");
	      sb.Append("</tr>");
	      
	      sb.Append("<tr>");
		      sb.Append("<td>");
		      	sb.Append('제목<input type="text" name="subject" readonly value="'+'->RE:'+dto.subject+'">');	
		      sb.Append("</td>");
	      sb.Append("</tr>");	  
	      
	      sb.Append("<tr>");
	      sb.Append("<td>");
	      	sb.Append('<textarea name="content" onkeyup="fnChkByte(this,\'4000\',\'ta\')" required></textarea>');
	      	sb.Append('<span id="ta">0</span>/4000');	
	      sb.Append("</td>");
        sb.Append("</tr>");	  
			  
	      sb.Append("<tr>");
	      sb.Append("<td>");
	      	sb.Append('password:<input type="password" name="password" onkeyup="fnChkByte(this,\'10\',null,\'pwd\')" required>');	
	      sb.Append("</td>");
        sb.Append("</tr>");
        
     sb.Append('<input type="button" value="작성" onclick="commentWrite(\'commentForm\');">');	  
    
     sb.Append('<input type="hidden" name="cp" value="'+jsonDto.pageInfo.cp+'">')
     sb.Append('<input type="hidden" name="ref" value="'+dto.ref+'">');
     sb.Append('<input type="hidden" name="lev" value="'+dto.lev+'">');
     sb.Append('<input type="hidden" name="sunbun" value="'+dto.sunbun+'"></input>')
     sb.Append("<form>");	   
	     	     	      
     
	     var result=sb.ToString(); 
	     
	    
	     
	    document.getElementById('listTable').innerHTML=result;	 
}

function commentWrite(commentForm,cp){

	var formz =document.getElementsByTagName("FORM");   
	var motherNumb =commentForm.length;

	alert(motherNumb);
	 
	  for(var a = 0 ; a < formz.length ; a++){
		  
		   
		  alert("temp: "+formz.length);
		  
	  }

	
	var childrenz =commentForm.children;
	
	
	
	for(var a = 0 ; a < childrenz; a++)
		{
		   var childTag =childrenz[a].tagName;
		    alert(childTag);
		}
	
		
	alert(commentForm);
	alert(commentForm.length);
	/* var inputs=window.document.commentForm.getElementsByTagName("INPUT");
	 var contentText =document.getElementsByTagName("TEXTAREA")[0]; */
	
	 /* alert(inputs.length); */
	 
}




function fnChkByte(obj, maxByte, writeByte, option){
	
	var str = obj.value;
    alert('str: '+str);
	var str_len = str.length;
	alert('str_len: '+str_len);
	
	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";
    writeByte = writeByte||null;
    option=option||null;
	for(var i=0; i<str_len; i++)
	{
		one_char = str.charAt(i);
		
			if(escape(one_char).length > 4)
			{
			    rbyte += 2;                                         //한글2Byte
			}else
			{
			    rbyte++;                                            //영문 등 나머지 1Byte
			}
	
		if(rbyte <= maxByte)
		{
		    rlen = i+1;                                          //return할 문자열 갯수
     	}
	}

	if(rbyte > maxByte){
	
		if(option!=null)
		{ 
			    alert(maxByte+"자를 초과 입력할 수 없습니다.");
			    str2 = str.substr(0,rlen);                                  //문자열 자르기
			    obj.value = str2;
			    fnChkByte(obj, maxByte,writeByte, option);
		}else
		{
			    alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
			    str2 = str.substr(0,rlen);                                  //문자열 자르기
			    obj.value = str2;
			    fnChkByte(obj, maxByte,writeByte, option);
		}
	
	}else{
			if(writeByte!=null)
			{
		       document.getElementById(writeByte).innerText = rbyte;
			}
	}
	}


</script>
</head> 
<body>
<script>
function al(){
	  alert(JSON.stringify(jsonDto));
	}
var chr = 'http://test.com/folder1/folder2/default.html?mode=write&value=&*테스트';

document.writeln("original = " + chr + '<br />');
document.writeln("escape() = <font color='red'>" + escape(chr) + "</font><br />");
document.writeln("encodeURI() = <font color='blue'>" + encodeURI(chr) + "</font><br />");
document.writeln("encodeURIComponent() = <font color='orange'>" + encodeURIComponent(chr) + "</font><br />");

</script>
 <input type="button" onclick="location.href='bbsListNormal.bow?cp=1'" value="일반 게시판가기">
  <input type="button" value="javascript구성 퍼포먼스~ 게시판보기" id="bbsList" onclick="javascript:bbsAjax('bbsList.bow',null,'POST');">
<!--  <input type="button" value="validation 게시판" onclick="javascript:show('bbsList.bow', null, 'commonDiv', 'POST');"> -->
<!-- <script>
   now = new Date();
   var y = now.getFullYear();
   var m = now.getMonth()+1;
   var d = now.getDate();
  
   alert(y+'년'+m+'월'+d+'일');
</script>
 -->

<input type="button" onclick="javascript:al()" value="jsonDto 확인">
<div id ="listDiv"></div>
<div id="commonDiv"></div>
</body>
</html>