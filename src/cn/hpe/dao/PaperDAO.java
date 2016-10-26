package cn.hpe.dao;

import java.sql.SQLException;
import java.util.List;

import cn.hpe.po.Paper;
import cn.hpe.po.PaperLimit;

public interface PaperDAO {
	
	/**
	 *�ϴ��Ծ����ݿ�
	 * @throws Exception 
	 */
	int uploadPaper(Paper paper,String tno) throws Exception;

	/**
	 * 
	 * �����Ծ��Ż���Ծ�
	 * @param paperno
	 * @return
	 * @throws Exception 
	 */
	Paper getPaper(String paperno) throws Exception;
	
	/**
	 * ����PaperLimit����Ծ����
	 * @param pl
	 * @return
	 * @throws Exception 
	 */
	int getPaperNum(PaperLimit pl) throws Exception;
	
	/**
	 * ����pl��ҳ����Ծ��б�
	 * @param pl
	 * @param startRow
	 * @param endRow
	 * @return
	 * @throws SQLException 
	 * @throws Exception 
	 */
	List<Paper> getPaperList(PaperLimit pl,int startRow,int endRow) throws SQLException, Exception;
}
