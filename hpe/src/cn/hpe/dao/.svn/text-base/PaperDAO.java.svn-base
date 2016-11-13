package cn.hpe.dao;

import java.sql.SQLException;
import java.util.List;

import cn.hpe.po.Paper;
import cn.hpe.po.PaperLimit;

/**
 * @试卷管理
 * @author 刘煜迪
 *
 */
public interface PaperDAO {
	
	/**
	 *上传试卷到数据库
	 * @throws Exception 
	 */
	int uploadPaper(Paper paper,String tno,int paperno) throws Exception;

	/**
	 * 
	 * 根据试卷编号获得试卷
	 * @param paperno
	 * @return
	 * @throws Exception 
	 */
	Paper getPaper(int paperno) throws Exception;
	
	/**
	 * 根据PaperLimit获得试卷个数
	 * @param pl
	 * @return
	 * @throws Exception 
	 */
	int getPaperNum(PaperLimit pl) throws Exception;
	
	/**
	 * 根据pl分页获得试卷列表
	 * @param pl
	 * @param startRow
	 * @param endRow
	 * @return
	 * @throws SQLException 
	 * @throws Exception 
	 */
	List<Paper> getPaperList(PaperLimit pl,int startRow,int endRow) throws SQLException, Exception;
	
	/**
	 * 根据paperno删除试卷
	 * @param paperno
	 * @return
	 * @throws Exception
	 */
	int deletePaperByNo(int paperno) throws Exception;
	
	/**
	 * 修改试卷
	 * @param paperno
	 * @return
	 * @throws Exception
	 */
	int editPaper(Paper paper) throws Exception;
	
	/**
	 * 查看试卷是否已经进行过考试
	 * @param paperno
	 * @return
	 * @throws Exception
	 */
	boolean isExamed(int paperno) throws Exception;
}
