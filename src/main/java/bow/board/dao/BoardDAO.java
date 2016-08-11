package bow.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import bow.common.dao.AbstractDAO;


  /*Repository annotation delear that DAO class is*/

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		                                          
                                      /*could be possible two or more different SQL queries have same id value in MAPPER file,*/ 
                                     /* so, using NAMESPACE value, can distinguish what exact SQL_ID is*/
		
		  										   /*sample          <--NAMESPACE
		  										    *selectBoardList <---SQL_ID */
		return (List<Map<String,Object>>)selectList("sample.selectBoardList",map);
	}

	
	
	
}
