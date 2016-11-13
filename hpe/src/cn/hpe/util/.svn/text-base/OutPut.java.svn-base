package cn.hpe.util;

import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import cn.hpe.po.ClassInfo;
import cn.hpe.po.ClassScore;
import cn.hpe.po.SubjectInfo;



/**
 * 导出数据到csv文件
 */
public class OutPut  {
    
       
    /**
     * 把数据按一定的格式写到csv文件中
     * @param stus     数据集合
     * @param fileName  csv文件完整路径
     */
    public OutPut(){
    	
    }
    public static boolean writeData2CSV(List<ClassScore> lcs,String fileName,List<ClassInfo> lci,List<SubjectInfo> ls) {
        FileWriter fw = null;
        try {
            fw = new FileWriter(fileName);
            String className="";
            String subjectName="";
            //输出标题头
            //注意列之间用","间隔,写完一行需要回车换行"rn"
            String title = "学号,名字,班级,课程,平时成绩,期末成绩,总成绩 \n";
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
                //注意列之间用","间隔,写完一行需要回车换行"rn"
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