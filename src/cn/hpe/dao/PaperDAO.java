package cn.hpe.dao;

import java.sql.SQLException;
import java.util.List;

import cn.hpe.po.Paper;
import cn.hpe.po.PaperLimit;

public interface PaperDAO {
	
	/**
	 *上传试卷到数据库
	 * @throws Exception 
	 */
	int uploadPaper(Paper paper,String tno) throws Exception;

	/**
	 * 
	 * 根据试卷编号获得试卷
	 * @param paperno
	 * @return
	 * @throws Exception 
	 */
	Paper getPaper(String paperno) throws Exception;
	
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
}
