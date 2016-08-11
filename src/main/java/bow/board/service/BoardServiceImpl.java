package bow.board.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import bow.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	/*Resource annotation 
	 *point to DAO class 
	 *using Repository annotation*/
	
	@Resource(name="boardDAO")
	private BoardDAO sampleDAO;

	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectBoardList(map);
	}

}
