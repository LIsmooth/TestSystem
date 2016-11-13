package cn.hpe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import cn.hpe.dao.PaperDAOImp;
import cn.hpe.dao.QuestionDAOImp;
import cn.hpe.po.EssayQuestion;
import cn.hpe.po.MultiQuestion;
import cn.hpe.po.Paper;
import cn.hpe.po.QuestionLimit;
/**
 * @�Ծ����
 * @author ���ϵ�
 *
 */
public class PaperService {

	/**
	 * �����Ծ�
	 * 
	 * @param ql
	 * @param perNum
	 * @return
	 * @throws Exception
	 */
	public Paper generatePaper(QuestionLimit ql, int[] perNum) throws Exception {

		Paper paper = new Paper();

		String temp=ql.getLimit();
		
		ql.setQuestion_type("1");	
		paper.setMultiList(this.generateMulti(ql, perNum[0]));
		//System.out.println("ps/msize="+paper.getMultiList().size());
		
		List<EssayQuestion> essayList;
		ql.setLimit(temp);
		ql.setQuestion_type("3");
		essayList = this.generateEssay(ql, perNum[1]);

		ql.setLimit(temp);
		ql.setQuestion_type("4");
		essayList.addAll(this.generateEssay(ql, perNum[2]));

		paper.setSubjectId(ql.getSubject_id());

		paper.setEssayList(essayList);

		paper.setStartSection(ql.getBegin_section());

		paper.setEndSection(ql.getEnd_section());

		paper.setPaperDegree(Integer.parseInt(ql.getLevel_type()));
		//System.out.println(paper);
		paper=setMarks(paper,getQuestionMark(perNum));
		
		
		return paper;

	}

	/**
	 * �������ѡ����
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<MultiQuestion> generateMulti(QuestionLimit ql, int num)
			throws Exception {
		QuestionDAOImp qdi = new QuestionDAOImp();

		int totalNum = qdi.getCountQuestionBySubjectid(ql);

		int[] questionNo = getRandomArray(totalNum, num);

		List<MultiQuestion> multiList = new ArrayList<MultiQuestion>();

		multiList = (List<MultiQuestion>) qdi.getQuestionByNum(ql, questionNo);

		return multiList;

	}

	/**
	 * ��������ʴ���
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<EssayQuestion> generateEssay(QuestionLimit ql, int num)
			throws Exception {

		QuestionDAOImp qdi = new QuestionDAOImp();

		int totalNum = qdi.getCountQuestionBySubjectid(ql);
		
		int[] questionNo = getRandomArray(totalNum, num);

		List<EssayQuestion> multiList = new ArrayList<>();

		multiList = (List<EssayQuestion>) qdi.getQuestionByNum(ql, questionNo);

		return multiList;

	}

	/**
	 * ������Ŀ������÷���
	 * 
	 * @param perNum
	 * @return
	 */
	public int[] getQuestionMark(int[] perNum) {

		int total = 0;

		for (int no : perNum) {
			total += no;
		}

		int mark[] = new int[perNum.length + 1];

		int marks[] = new int[total];
		//ѡ�������
		if (perNum[0] > 0 && perNum[0] < 17) {
			mark[0] = 3;
		} else if (perNum[0] <= 25) {
			mark[0] = 2;
		} else if(perNum[0]<=100){
			mark[0] = 1;
		}else{
			marks[0]=0;//ѡ����̫��
		}
		int remainMark = 100 - mark[0] * perNum[0];
		//�ʴ������
		if (perNum[1] >= 0 && perNum[1] <= 3) {
			mark[1] = 10;
		} else if (perNum[1] <= 5) {
			mark[1] = 7;
		} else if(perNum[1]<=10){
			mark[1] = 5;
		} else{
			marks[1]=0;//��Ŀ�����޷��Զ�����
		}

		 remainMark=100 - mark[0] * perNum[0]- mark[1] * perNum[1];
		//��������
		if(perNum[2]!=0){
			
			if (remainMark / perNum[2] < 1) {
				mark[2] = 0;
			} else {
				mark[2] = remainMark / perNum[2];
				mark[3] = remainMark - perNum[2] * mark[2];
			}
			
		}
		else{		
			mark[2]=0;
			mark[3]=remainMark;
			
		}
		//perNum[2]==0
		
		int flag = 0;
		for (; flag < perNum[0]; ++flag) {
			marks[flag] = mark[0];
		}
		for (; flag < perNum[0] + perNum[1]; ++flag) {
			marks[flag] = mark[1];
		}
		for (; flag < perNum[0] + perNum[1] + perNum[2]; ++flag) {
			marks[flag] = mark[2];
		}
		marks[total - 1] += mark[3];
		return marks;

	}

	/**
	 * ������źͷ���
	 */
	public Paper setMarks(Paper paper, int[] marks) {

		if (marks[0] == -1)
			return null;
		int i = 0;

		for (MultiQuestion mq : paper.getMultiList()) {
			mq.setQuestionmark(marks[i]);
			mq.setInpaperno(i+1);
			++i;
		}
		for (EssayQuestion eq : paper.getEssayList()) {			
			eq.setQuestionmark(marks[i]);
			eq.setInpaperno(i+1);
			++i;
		}
		return paper;
	}

	public Paper setQid(Paper paper){
		int i = 1;
		for (MultiQuestion mq : paper.getMultiList()) {
			mq.setInpaperno(i);
			++i;
		}
		for (EssayQuestion eq : paper.getEssayList()) {			
			eq.setInpaperno(i);
			++i;
		}
		return paper;
	}
	
	/**
	 * �ж��������Ƿ��Ѵ���
	 * 
	 * @param qNo
	 * @param no
	 * @return
	 */
	private boolean isExist(int[] qNo, int no) {
		for (int a : qNo) {
			if (a == no) {
				return true;
			}
		}
		return false;
	}

	/**
	 * ���ɷ�Χ�������
	 * 
	 */
	public int[] getRandomArray(int totalNum, int num) {

		if (totalNum < num) // ����в�û����ô����
			return null;

		int[] questionNo = new int[num];
		int temp;

		Random random = new Random();

		for (int a = 0; a < num; ++a) {
			temp = random.nextInt(totalNum) + 1;
			if (isExist(questionNo, temp))
				a--;
			else
				questionNo[a] = temp;
		}
		return questionNo;
	}

	/**
	 * �����Ƿ���п���isExamed����
	 * @param paper
	 * @return
	 * @throws Exception
	 */
	public List<Paper> setIsExamed(List<Paper> paper) throws Exception{
		
		PaperDAOImp pdi=new PaperDAOImp();
		for(Paper p:paper){
			p.setIsExamed(pdi.isExamed(p.getPaperno())?1:0);
		}
		return paper;
	}
	
}
