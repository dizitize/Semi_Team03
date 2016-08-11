package bow.board.controller; 

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bow.board.service.BoardService;
import bow.common.common.CommandMap;

@Controller
public class BoardController {

    Logger log = Logger.getLogger(this.getClass());
	
    @Resource(name="sampleService")
    private BoardService sampleService;    
    
    
	@RequestMapping(value="/sample/openSampleList.bow")
	public ModelAndView openSampleList(Map<String,Object>commandMap) throws Exception
	{ 
		   ModelAndView mv = new ModelAndView("");
	        log.debug("인터셉터 테스트");
	        return mv;
    }
	
	 @RequestMapping(value="/sample/openSampleBoardList.bow")
	    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
	        ModelAndView mv = new ModelAndView("/sample/boardList");
	         
	        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
	        mv.addObject("list", list);
	         
	        return mv;
	    }
	 
	 @RequestMapping(value="/sample/testMapArgumentResolver.bow")
	 public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	     ModelAndView mv = new ModelAndView("");
	      
	     if(commandMap.isEmpty() == false){
	         Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	         Entry<String,Object> entry = null;
	         while(iterator.hasNext()){
	             entry = iterator.next();
	             log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	         }
	     }
	     return mv;
	 }
	
}