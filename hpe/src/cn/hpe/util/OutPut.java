package cn.hpe.util;

import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import cn.hpe.po.ClassInfo;
import cn.hpe.po.ClassScore;
import cn.hpe.po.SubjectInfo;



/**
 * �������ݵ�csv�ļ�
 */
public class OutPut  {
    
       
    /**
     * �����ݰ�һ���ĸ�ʽд��csv�ļ���
     * @param stus     ���ݼ���
     * @param fileName  csv�ļ�����·��
     */
    public OutPut(){
    	
    }
    public static boolean writeData2CSV(List<ClassScore> lcs,String fileName,List<ClassInfo> lci,List<SubjectInfo> ls) {
        FileWriter fw = null;
        try {
            fw = new FileWriter(fileName);
            String className="";
            String subjectName="";
            //�������ͷ
            //ע����֮����","���,д��һ����Ҫ�س�����"rn"
            String title = "ѧ��,����,�༶,�γ�,ƽʱ�ɼ�,��ĩ�ɼ�,�ܳɼ� \n";
            fw.write(title);
            for(int i = 0;i<lci.size();i++){
            	if(lcs.get(0).getClassId().equals(lci.get(i).getClassId())){
            		className=lci.get(i).getClassName();
            		break;
            	}
            }
            for(int i = 0;i<ls.size();i++){
            	if(lcs.get(0).getSubjectId().equals(ls.get(i).getSubjectId())){
            		subjectName=ls.get(i).getSubjectName();
            		break;
            	}
            }
            String content = null;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0;i<lcs.size();i++) {
            	ClassScore cs = lcs.get(i);
                //ע����֮����","���,д��һ����Ҫ�س�����"rn"
                content =cs.getSno()+","+cs.getSname()+","+className+","+subjectName+","+cs.getPtScore()+","+cs.getEtScore()+","+cs.getScore()+"\n";
                fw.write(content);
            }
            return true;
        }catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }finally {
            try {
                if(fw!=null) {
                    fw.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}