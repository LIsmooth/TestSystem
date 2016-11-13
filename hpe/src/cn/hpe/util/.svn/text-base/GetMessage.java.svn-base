package cn.hpe.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.hpe.baseDAO.BaseDAO;
import cn.hpe.po.ClassInfo;
import cn.hpe.po.QuestionLevel;
import cn.hpe.po.QuestionType;
import cn.hpe.po.Sections;
import cn.hpe.po.SubjectInfo;

/**
 * 得到所有课程
 * @author Administrator
 *
 */
public class GetMessage extends BaseDAO{
	/**
	 * 得到所有科目信息
	 * @return
	 * @throws Exception
	 */
	public static List<SubjectInfo> getAllSubject()throws Exception{
		BaseDAO bd = new BaseDAO();
		List<SubjectInfo> ls = new ArrayList<SubjectInfo>();
		Connection conn = bd.getConnection();
		String sql="select * from subjectinfo";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			SubjectInfo si = new SubjectInfo();
			si.setSubjectId(rs.getString("subjectId"));
			si.setSubjectName(rs.getString("subjectName"));
			si.setClassHour(Integer.parseInt(rs.getString("classhour")));
			ls.add(si);
		}
		bd.closeConnection(rs, ps, conn);
		return ls;
	}
	
	/**
	 * 得到所有题目难度等级
	 * @return
	 * @throws Exception
	 */
	public static List<QuestionLevel> getAllLevel()throws Exception{
		BaseDAO bd = new BaseDAO();
		List<QuestionLevel> lql = new ArrayList<QuestionLevel>();
		Connection conn = bd.getConnection();
		String sql="select * from questionlevel";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			QuestionLevel ql = new QuestionLevel();
			ql.setLevelId(rs.getString("levelId"));
			ql.setLevelName(rs.getString("levelName"));
			lql.add(ql);
		}
		bd.closeConnection(rs, ps, conn);
		return lql;
	}
	
	/**
	 * 得到所有章节
	 * @return
	 * @throws Exception
	 */
	public static List<Sections> getAllSection()throws Exception{
		BaseDAO bd = new BaseDAO();
		List<Sections> ls = new ArrayList<Sections>();
		Connection conn = bd.getConnection();
		String sql="select * from sectiontrans";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Sections ss = new Sections();
			ss.setSectionId(Integer.parseInt(rs.getString("sectionid")));
			ss.setSectionName(rs.getString("sectionName"));
			ls.add(ss);
		}
		bd.closeConnection(rs, ps, conn);
		return ls;
	}
	
	/**
	 * 根据课程id获得课程章节号
	 * @param subjectID
	 * @return
	 * @throws Exception
	 */
	public static List<Sections> getSectionBySubjectID(String subjectID) throws Exception{
		
		BaseDAO bd = new BaseDAO();
		List<Sections> ls = new ArrayList<Sections>();
		Connection conn = bd.getConnection();
		String sql="select * from sections where subjectid=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, subjectID);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Sections ss = new Sections();
			ss.setSectionId(Integer.parseInt(rs.getString("sectionid")));
			ss.setSectionName(rs.getString("sectionName"));
			ls.add(ss);
		}
		bd.closeConnection(rs, ps, conn);
		return ls;
	}
	
	/**
	 * 得到所有题型
	 */
	public static List<QuestionType> getAllQuestionType()throws Exception{
		BaseDAO bd = new BaseDAO();
		List<QuestionType> lqt = new ArrayList<QuestionType>();
		Connection conn = bd.getConnection();
		String sql="select * from questiontype";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			QuestionType qt = new QuestionType();
			qt.setTypeId(rs.getInt("typeId"));
			qt.setTypeName(rs.getString("typeName"));
			lqt.add(qt);
		}
		bd.closeConnection(rs, ps, conn);
		return lqt;
	}
	
	/**
	 * 得到所有班级信息
	 * @return
	 * @throws Exception
	 */
	public static List<ClassInfo> getAllClssInfo()throws Exception{
		BaseDAO bd = new BaseDAO();
		List<ClassInfo> lci = new ArrayList<ClassInfo>();
		Connection conn = bd.getConnection();
		String sql="select * from classinfo";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			ClassInfo ci = new ClassInfo();
			ci.setClassId(rs.getString("classId"));
			ci.setClassName(rs.getString("className"));
			lci.add(ci);
		}
		bd.closeConnection(rs, ps, conn);
		return lci;
	}
	
}
