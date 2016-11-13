prompt PL/SQL Developer import file
prompt Created on 2016年11月3日 by Lismooth
set feedback off
set define off
prompt Creating TEACHER...
create table TEACHER
(
  tno     VARCHAR2(20) not null,
  tname   VARCHAR2(20),
  major   VARCHAR2(20),
  sex     VARCHAR2(2),
  tphone  VARCHAR2(11),
  tpwd    VARCHAR2(20),
  tidcard VARCHAR2(18),
  spare   VARCHAR2(20)
)
;
alter table TEACHER
  add constraint PK_TEACHER_TNO primary key (TNO);

prompt Creating PAPERINFO...
create table PAPERINFO
(
  paperno       NUMBER(5) not null,
  subjectid     NUMBER(2),
  questionlevel NUMBER(1),
  startsection  NUMBER(2),
  endsection    NUMBER(2),
  generatedate  DATE default sysdate,
  tno           VARCHAR2(20) not null,
  papername     VARCHAR2(50),
  remark        VARCHAR2(100)
)
;
alter table PAPERINFO
  add constraint PK_PAPERINFO_PAPERNO primary key (PAPERNO);
alter table PAPERINFO
  add constraint FK_PAPERINFO_TNO foreign key (TNO)
  references TEACHER (TNO);

prompt Creating ANSWER...
create table ANSWER
(
  paperno   NUMBER(5),
  sno       VARCHAR2(20),
  qid       NUMBER(4),
  answer    VARCHAR2(4000),
  spare     VARCHAR2(20),
  typeid    NUMBER,
  ischarged NUMBER(1),
  tmark     NUMBER(2)
)
;
alter table ANSWER
  add constraint FK_ANSWER_PAPERNO foreign key (PAPERNO)
  references PAPERINFO (PAPERNO);

prompt Creating CLASSINFO...
create table CLASSINFO
(
  classid   VARCHAR2(5) not null,
  classname VARCHAR2(20),
  spare     VARCHAR2(20)
)
;
alter table CLASSINFO
  add constraint PK_CLASSINFO_CLASSID primary key (CLASSID);

prompt Creating QUESTIONTYPE...
create table QUESTIONTYPE
(
  typeid   NUMBER(1) not null,
  typename VARCHAR2(20)
)
;
alter table QUESTIONTYPE
  add constraint PK_QTYPE_TYPEID primary key (TYPEID);

prompt Creating SUBJECTINFO...
create table SUBJECTINFO
(
  subjectid   VARCHAR2(10) not null,
  subjectname VARCHAR2(15),
  classhour   NUMBER,
  spare       VARCHAR2(50)
)
;
alter table SUBJECTINFO
  add constraint PK_SUBJECTINFO_SUBJECTID primary key (SUBJECTID);

prompt Creating ESSAYQUESTION...
create table ESSAYQUESTION
(
  subjectid     VARCHAR2(10),
  questionno    NUMBER(4) not null,
  question      VARCHAR2(500),
  rightanswer   VARCHAR2(2000),
  questionlevel NUMBER(1),
  sectionid     NUMBER(2),
  isessay       NUMBER(1),
  questionmark  NUMBER(2)
)
;
alter table ESSAYQUESTION
  add constraint PK_ESSAY_QUESTIONNO primary key (QUESTIONNO);
alter table ESSAYQUESTION
  add constraint FK_ESSAYQ_ISESSAY foreign key (ISESSAY)
  references QUESTIONTYPE (TYPEID);
alter table ESSAYQUESTION
  add constraint FK_ESSAY_SUBJECTID foreign key (SUBJECTID)
  references SUBJECTINFO (SUBJECTID);

prompt Creating EXAMMANAGE...
create table EXAMMANAGE
(
  examno     NUMBER(10) not null,
  typeid     CHAR(2),
  subjectid  VARCHAR2(10),
  paperno    NUMBER(5),
  examtime   DATE,
  totaltime  NUMBER(4),
  charged    NUMBER(1),
  examname   VARCHAR2(50),
  classids   VARCHAR2(100),
  examstatus NUMBER(1)
)
;
alter table EXAMMANAGE
  add constraint PK_EXAMMANAGER_EXAMNO primary key (EXAMNO);
alter table EXAMMANAGE
  add constraint FK_EXAM_PAPERNO foreign key (PAPERNO)
  references PAPERINFO (PAPERNO);
alter table EXAMMANAGE
  add constraint FK_EXAM_SUBJECTID foreign key (SUBJECTID)
  references SUBJECTINFO (SUBJECTID);
alter table EXAMMANAGE
  add constraint YS_EXAMMANAGE_TYPE
  check (TYPEid in ('A','B'));

prompt Creating MULTIQUESTIONS...
create table MULTIQUESTIONS
(
  questionno    NUMBER(4) not null,
  subjectid     VARCHAR2(10),
  sectionid     NUMBER(2),
  questiona     VARCHAR2(500),
  questionb     VARCHAR2(500),
  questionc     VARCHAR2(500),
  questiond     VARCHAR2(500),
  rightanswer   VARCHAR2(4),
  questionlevel NUMBER(1),
  spare         VARCHAR2(20),
  question      VARCHAR2(500),
  ismultiple    NUMBER(1),
  questionmark  NUMBER(3)
)
;
alter table MULTIQUESTIONS
  add constraint PK_MULTI_QUESTIONNO primary key (QUESTIONNO);
alter table MULTIQUESTIONS
  add constraint FK_MULTI_ISMULTI foreign key (ISMULTIPLE)
  references QUESTIONTYPE (TYPEID);
alter table MULTIQUESTIONS
  add constraint FK_MULTI_SUBJECTID foreign key (SUBJECTID)
  references SUBJECTINFO (SUBJECTID);

prompt Creating PAPERMANAGE...
create table PAPERMANAGE
(
  paperno      NUMBER(5) not null,
  typeid       NUMBER(1),
  questionno   NUMBER(4) not null,
  questionmark NUMBER(2),
  qid          NUMBER(3)
)
;
comment on column PAPERMANAGE.qid
  is '在试卷中的题号';
alter table PAPERMANAGE
  add constraint FK_PAPERMANAGE_PNO foreign key (PAPERNO)
  references PAPERINFO (PAPERNO);
alter table PAPERMANAGE
  add constraint FK_PAPERMANAGE_TYPEID foreign key (TYPEID)
  references QUESTIONTYPE (TYPEID);

prompt Creating QUESTIONLEVEL...
create table QUESTIONLEVEL
(
  levelid   CHAR(1) not null,
  levelname VARCHAR2(10)
)
;
alter table QUESTIONLEVEL
  add constraint PK_QUESTIONLEVEL primary key (LEVELID);

prompt Creating STUDENT...
create table STUDENT
(
  sno        VARCHAR2(20) not null,
  sname      VARCHAR2(20),
  major      VARCHAR2(50),
  classid    VARCHAR2(5),
  sphone     VARCHAR2(11),
  spwd       VARCHAR2(16),
  sidcard    VARCHAR2(18),
  sex        VARCHAR2(2),
  spare      VARCHAR2(50),
  slogintime NUMBER
)
;
alter table STUDENT
  add constraint PK_STUDENT_SNO primary key (SNO);
alter table STUDENT
  add constraint FK_STUDENT_CLASSID foreign key (CLASSID)
  references CLASSINFO (CLASSID);

prompt Creating SCOREMANAGE...
create table SCOREMANAGE
(
  examno  NUMBER(10),
  sno     VARCHAR2(20),
  ptscore NUMBER(3),
  etscore NUMBER(3),
  score   NUMBER(3),
  spare   VARCHAR2(20)
)
;
alter table SCOREMANAGE
  add constraint FK_SCORE_SNO foreign key (SNO)
  references STUDENT (SNO);

prompt Creating SECTIONS...
create table SECTIONS
(
  subjectid   VARCHAR2(10) not null,
  sectionid   NUMBER(2) not null,
  sectionname VARCHAR2(100)
)
;
alter table SECTIONS
  add constraint PK_SECTIONS_SECTIONID primary key (SECTIONID, SUBJECTID);
alter table SECTIONS
  add constraint FK_SECTIONS_SUBJECTID foreign key (SUBJECTID)
  references SUBJECTINFO (SUBJECTID);

prompt Creating SECTIONTRANS...
create table SECTIONTRANS
(
  sectionid   NUMBER(2) not null,
  sectionname VARCHAR2(20)
)
;

prompt Loading TEACHER...
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('0', '不紧张', 'java', '男', null, '123', null, null);
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('1', '俭银', 'html', null, null, '123', null, null);
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('111', '庞少虎', null, null, null, '1234', null, null);
commit;
prompt 3 records loaded
prompt Loading PAPERINFO...
prompt Table is empty
prompt Loading ANSWER...
prompt Table is empty
prompt Loading CLASSINFO...
insert into CLASSINFO (classid, classname, spare)
values ('4', '安卓-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('5', '安卓-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('6', '安卓-3', null);
insert into CLASSINFO (classid, classname, spare)
values ('7', '前端-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('8', '前端-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('9', '前端-3', null);
insert into CLASSINFO (classid, classname, spare)
values ('0', 'JAVA-S', null);
insert into CLASSINFO (classid, classname, spare)
values ('1', 'JAVA-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('2', 'JAVA-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('3', 'JAVA-3', null);
insert into CLASSINFO (classid, classname, spare)
values ('10', '测试-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('11', '测试-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('12', '测试-3', null);
commit;
prompt 13 records loaded
prompt Loading QUESTIONTYPE...
insert into QUESTIONTYPE (typeid, typename)
values (1, '单选题');
insert into QUESTIONTYPE (typeid, typename)
values (2, '多选题');
insert into QUESTIONTYPE (typeid, typename)
values (3, '问答题');
insert into QUESTIONTYPE (typeid, typename)
values (4, '编程题');
commit;
prompt 4 records loaded
prompt Loading SUBJECTINFO...
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('6', 'HTML', 32, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('1', 'Java', 64, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('2', 'Oracle', 32, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('3', 'JSP', 64, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('4', '前端', 64, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('5', 'ps', 64, null);
commit;
prompt 6 records loaded
prompt Loading ESSAYQUESTION...
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 0, '面向对象特征?', '封装: 属性私用化，提供公有的方法访问私用属性，避免一些非法赋值' || chr(10) || '  多态: 父类对象指向子类引用，多态须要建立继承或接口实现类' || chr(10) || '  Person p=new Student(); ' || chr(10) || '  Person p2=new Teacher();' || chr(10) || '  Person p3=new Works();   ' || chr(10) || '  public void sayHi(Person p)' || chr(10) || '  {' || chr(10) || '        p.hello();' || chr(10) || '  } ' || chr(10) || '继承：一个类通过extends关键字实现继承，java只支持单继承。子类无法' || chr(10) || '      继承父类私用属性' || chr(10) || '抽象:' || chr(10) || '  1 抽象类abstract修饰' || chr(10) || '  2 如果一个方法是abstract方法，这个类一定是一个抽象类' || chr(10) || '  3 抽象类里面可以有实例方法' || chr(10) || '  4 抽象类不能实例化', 2, 3, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 1, 'IO流字符流、字节流(默写)', ' //字节流(写)' || chr(10) || '   OutputStream os=new FileOutputStream("d:\\io\\tt.txt");' || chr(10) || '   os.write("张三".getBytes());' || chr(10) || '   os.close();' || chr(10) || '  //字节流(读)  ' || chr(10) || '  InputStream is=new FileInputStream("d:\\io\\tt.txt");' || chr(10) || '   byte [] bs=new byte[1024];' || chr(10) || '   is.read(bs);' || chr(10) || '   String msg=new String(bs);' || chr(10) || '   String d=new String(msg.getBytes("iso-8859-1"),"gbk");' || chr(10) || '' || chr(10) || '  //字符流(写)' || chr(10) || '  FileWriter fw=new FileWriter("d:\\io\\ss.txt");' || chr(10) || '  fw.write("张三");' || chr(10) || '  fw.clsoe();' || chr(10) || '' || chr(10) || '  //字符流（读）' || chr(10) || '  FileReader fr=new FileReader("d:\\ss.txt");' || chr(10) || '  ' || chr(10) || '  char[] ch=new char[1024];' || chr(10) || '' || chr(10) || '  fr.read(ch);' || chr(10) || '' || chr(10) || '  for(char c:ch)' || chr(10) || '  {' || chr(10) || '     System.out.print(c);' || chr(10) || '  }', 3, 8, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 2, 'JDBC操作数据库步骤', 'try{' || chr(10) || '  Class.forName("oracle.jdbc.driver.OracleDriver");' || chr(10) || '  String url="jdbc:oracle:thin:@localhost:1521:orcl";' || chr(10) || '  Connection conn=DriverManager.getConnection    (url,"scott","123"):' || chr(10) || '  String sql="insert into Users values(?,?,?)";' || chr(10) || '  PreparedStatement ps=conn.prepareStatement(sql);' || chr(10) || '  ps.setObject(1,"1");' || chr(10) || '  ps.setObject(2,"张三");' || chr(10) || '  ps.setObject(3,21);' || chr(10) || '  int r=ps.executeUpdate();' || chr(10) || '  if(r>0)' || chr(10) || '  {' || chr(10) || '     System.out.println("保存成功");' || chr(10) || '  }else' || chr(10) || '  {' || chr(10) || '    System.out.println("保存失败");  ' || chr(10) || '  }' || chr(10) || '  ps.close();' || chr(10) || '  conn.close();' || chr(10) || '}catch(Exception ex)' || chr(10) || '{' || chr(10) || '  ex.printStackTrace(); ' || chr(10) || '}' || chr(10) || '', 3, 9, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 3, '==、equals区别', '==比较内存地址是否相等' || chr(10) || '' || chr(10) || '  equals内容是否相等', 1, 8, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 4, '静态变量和实例变量', '1、静态变量用static修饰 实例变量写在类的内部' || chr(10) || '' || chr(10) || '  2、静态变量调用时用：类名.静态变量名  实例变量：对象名.属性名', 2, 1, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 7, '打印99乘法表', 'public static void Test1()' || chr(10) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("1.打印九九乘法表:");' || chr(10) || '' || chr(9) || '' || chr(9) || 'for (int i = 1; i < 10; i++)' || chr(10) || '' || chr(9) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'for (int j = 1; j <= i; j++)' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'int a = j * i;' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.print(j + "*" + i + "=" + a + " ");' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '}' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '' || chr(9) || '}' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '}', 2, 1, 4, 20);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 6, '输入一个数字判断他是奇数还是偶数', 'public static void Test2()' || chr(10) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("2.输入一个数字判断他是奇数还是偶数:");' || chr(10) || '' || chr(9) || '' || chr(9) || 'Scanner er = new Scanner(System.in);' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("请您输入一个整数：");' || chr(10) || '' || chr(9) || '' || chr(9) || 'int a = er.nextInt();' || chr(10) || '' || chr(9) || '' || chr(9) || 'if (a % 2 == 0)' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.println("您输入的" + a + "是一个偶数");' || chr(10) || '' || chr(9) || '' || chr(9) || 'else' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.println("您输入的" + a + "是一个奇数");' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '}', 1, 1, 4, 20);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 5, '求解1到100之间的偶数', 'public static void Test3()' || chr(10) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("3.求解1到100之间的偶数");' || chr(10) || '' || chr(9) || '' || chr(9) || 'for (int a = 1; a <= 100; a++)' || chr(10) || '' || chr(9) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'if (a % 2 == 0)' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.print("1到100之间的偶数: " + a + ";  ");' || chr(10) || '' || chr(9) || '' || chr(9) || '}' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '}', 1, 1, 4, 20);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('6', 28, '随机生成两个小数给变量x.y，然后显示这两个数中的最大值。', '提示：语句“var x=Math.random();”可为变量生成一个随机小数：另外，使用条件运算符‘''?:"', 2, 2, 4, 15);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('6', 29, '如果某年的年份值是4的倍数并且不是100的倍数，或者该年份值是400的倍数，那么这一年就是闰年。请编制一个页面，该页面显示当天是否处于闰年。', '提示：使用以下语句，可使变量year的值就是当天所属的年份值。' || chr(13) || '' || chr(10) || 'var today = new Date();   //获取当天日期' || chr(13) || '' || chr(10) || 'var year = today.getFullYear();   //获取当天年份', 3, 3, 4, 20);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 8, '数据库编程题', '学生表:Student(Sno,Sname,Sage,Ssex) ' || chr(13) || '' || chr(10) || '对应字段Sno:学号、Sname:学生姓名、Sage:学生年龄、Ssex:学生性别', 2, 1, 3, 10);
commit;
prompt 11 records loaded
prompt Loading EXAMMANAGE...
prompt Table is empty
prompt Loading MULTIQUESTIONS...
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (42, '6', 1, '80', '0X65', '095  ', '0115', 'B', 1, null, '以下哪个常量值最大？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (43, '6', 3, 'var default', 'var my_bouse', 'var my dog', 'var 2cats', 'B', 1, null, '下面四个变量声明语句中，哪一个变量的命名是正确的？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (2, '1', 1, 'javac', 'java', 'jdb', 'javah', 'A', 1, null, '用于将java源代码文件编译成字节码的编译器是 (     )', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (3, '1', 1, 'start()', 'init()', 'paint()', 'main()', 'D', 1, null, 'Java应用程序的入口方法是（     ）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (4, '1', 1, 'BigMeaninglessName ', '_whatavariable', '#myvar ', '$dollar', 'C', 2, null, '下列选项在java中属于不合法的标识符的是（     ）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (5, '1', 1, 'short', 'long', 'int ', 'byte', 'D', 2, null, '下列整型数据类型中，需要内存空间最少的是 (      )。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (6, '1', 1, '0', '1', '2', '3', 'B', 2, null, '下列代码段执行后的输出结果是（　 　）。' || chr(10) || 'int x=3; ' || chr(10) || 'int y=10; ' || chr(10) || 'System.out.println(y%x); ', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (7, '1', 1, 'x[24]为0', 'x[24]未定义', 'x[25]为0 ', 'x[0]为空', 'A', 2, null, '执行完代码int[ ] x = new int[25]；后，下列选项说明正确的是（     ）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (8, '1', 3, 'private', 'protected', 'default', 'public', 'C', 3, null, '当类的成员未用访问权限修饰符时，Java认为此成员的访问权限为（      ）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (9, '1', 3, 'public x x1= new y( );', 'x x1=x( );' || chr(9) || '', 'x x1=new x( );' || chr(9) || '', 'int x x1;', 'C', 1, null, '设 x,y 均为已定义的类名，下列声明对象x1的语句中正确的是（　　　）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (10, '1', 8, 'double', 'char ', 'byte', 'short', 'A', 1, null, '在switch（expression）语句中，expression的数据类型不能是（     ）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (11, '1', 3, 'import sos.*;', 'package sos.*; ', 'sos import; ', 'sos package; ', 'A', 2, null, '为了使包sos在当前程序中可见，可以使用的语句是（     ）', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (12, '1', 1, 'int t1[][]={{1,2},{3,4},{5,6}}; ', 'int t2[][]={1,2,3,4,5,6}; ', 'int t3[3][2]={1,2,3,4,5,6}; ', 'int t4[][]; t4={1,2,3,4,5,6}; ', 'A', 1, null, '下列数组初始化形式正确的是（     ）。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (13, '1', 1, '35', '25', '20', '5', 'B', 1, null, '下列语句序列执行后，x 的值是（     ）。 ' || chr(10) || 'int a=3, b=4, x=5; ' || chr(10) || 'if( ++a==b ) x=++a*x; ', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (14, '1', 1, '5k', '7k', '52k', '3k', 'B', 2, null, '当下列程序执行时，其输出结果是（      ）。' || chr(10) || 'int x = 5;' || chr(10) || 'int y = 2;' || chr(10) || 'System.out.println(x+ y + "k");', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (15, '1', 6, 'final 可修饰类、属性、方法', 'abstract可修饰类、属性、方法', '定义抽象方法需有方法的返回类型、名称、参数列表和方法体', '用final修饰的变量，在程序中可对这个变量的值进行更改', 'A', 1, null, '下列说法正确的是（      ）。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (16, '1', 3, 'start', 'stop', 'yield', 'run', 'D', 3, null, 'Runnable接口中的抽象方法是（     ）。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (17, '1', 3, 'java.applet', 'java.awt ', 'java.util', 'java.lang ', 'D', 1, null, '在Java中，由Java编译器自动导入，而无需在程序中用import导入的包是（       ）。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (18, '1', 3, 'java.lang.Object', 'java.lang.Class', 'java.applet.Applet', 'java.awt.Frame', 'A', 2, null, '在Java中，所有类的根类是（     ）。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (19, '1', 5, '多重的', '单重的', '线程的', '不能继承', 'B', 2, null, 'Java语言的类间的继承关系是（     ）。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (21, '1', 3, '抽象类不能被继承', '一个类可以实现多个接口', '抽象类不能final修饰', '接口里的方法都是抽象方法', 'ACD', 1, null, '抽象类是接口的区别', 2, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (45, '6', 2, 'var mytext = "Here is some text!" ', 'var mytext = ''Here is some text!''', ' var mytext = ''Here is some text!"', 'var mytext = "Here is\nsome text!"', 'C', 1, null, '下面哪一个字符串变量定义语句是不正确的？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (44, '6', 3, 'var PageNumber=240 ', 'pagenumber=240', 'var pageNumber=240', 'var int named pageNumber=240', 'C', 2, null, '下面哪一个语句定义了一个名为pageNumber的变量并将它的值赋为240?', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (46, '6', 1, 'document.write（"John said ,''''Hi!"")', 'document.write（"John said ,''''Hi!"'')', 'document.write（"John said ,''''Hi!")', 'document.write（"John said ,\''''Hi!\"")', 'D', 2, null, '下面四个JavaScript语句中，哪一个是合法的？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (47, '6', 2, '=', '==', '&&', '$#', 'D', 1, null, '下面哪一个不是JavaScript运算符？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (48, '6', 2, '2', '3', '4', '5', 'C', 1, null, '表达式123%7的计算结果是', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (49, '6', 2, '"abc" ', '0', '"123abc123"', 'NaN', 'D', 3, null, '表达式"123abe"-"123"的计算结果是＿', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (50, '6', 2, '给一个变量赋新值', '给一个变量赋予一个新名', '执行比较运算', '没有任何用处', 'A', 3, null, '赋值运算符的作用是什么？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (51, '6', 2, '执行数学计算 ', ' 处理二进制位，目前还不重要', '比较两个值或表达式，返回真或假  ', '只比较数字，不比较字符串', 'C', 3, null, '比较运算符的作用是什么？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (52, '6', 1, '(3===3）&&(5<l) ', ' !(17<=20)', '(3!=3) || (7<2)', '(1===1) || (3<2)', 'D', 3, null, '下面的哪一个表达式将返回真?', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (53, '6', 1, '!(3<=l)  ', '(4>=4) && (5<=2)', '("a"=="a" ) && ("c"!="d") ', ' (2<3) || (3<2)', 'B', 2, null, '下面的哪一个表达式将返回假？', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (54, '6', 1, '+', '&&', '==', '*=', 'B', 3, null, '下列各种运算符中，_____优先级最高。', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (55, '2', 6, 'fdb', 'sdf', 'sdf', 'sfd', 'A', 1, null, '你别入侵了', 2, 10);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (56, '6', 1, 'sfg', 'sfgs', 'fsg', 'sfgfs', 'A', 1, null, 'asfadfds', 1, 23);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (58, '6', 1, '你被入侵了', '你被入侵了', '你被入侵了', '你被入侵了', 'A', 1, null, '你被入侵了', 1, 1);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (24, '1', 1, '线程对象必须实现Runnable接口', '启动一个线程直接调用线程对象的run()方法', 'Java提供对多线程同步提供语言级的支持', '一个线程可以包含多个进程', 'C', 2, null, '关于线程设计，下列描述正确的是', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (25, '1', 4, '一个类中不能有同名的方法', '子类中不能有和父类中同名的方法', '子类中可以有和父类中同名且参数相同的方法', '多态性就是方法的名字可以一样，但返回的类型必须不一样', 'B', 2, null, '下面关于多态性的说法，正确的是', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (59, '6', 1, '你被入侵了', '你被入侵了', '你被入侵了', '你被入侵了', 'A', 1, null, '你被入侵了', 1, 1);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (57, '6', 1, 'sfg', 'sfg', 'gf', 'sfg', 'A', 1, null, 'egesg', 1, 4);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (60, '6', 1, '你被入侵了', '你被入侵了', '你被入侵了', '你被入侵了', 'A', 1, null, '你被入侵了', 1, 1);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (61, '6', 1, '你被入侵了', '你被入侵了', '你被入侵了', '你被入侵了', 'A', 1, null, '你被入侵了', 1, 1);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (62, '6', 1, '你被入侵了', '你被入侵了', '你被入侵了', '你被入侵了', 'A', 1, null, '你被入侵了', 1, 1);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (63, '6', 1, '你被入侵了', '你被入侵了', '你被入侵了', '你被入侵了', 'A', 1, null, '你被入侵了', 1, 1);
commit;
prompt 43 records loaded
prompt Loading PAPERMANAGE...
prompt Table is empty
prompt Loading QUESTIONLEVEL...
insert into QUESTIONLEVEL (levelid, levelname)
values ('1', '容易');
insert into QUESTIONLEVEL (levelid, levelname)
values ('2', '中等');
insert into QUESTIONLEVEL (levelid, levelname)
values ('3', '困难');
commit;
prompt 3 records loaded
prompt Loading STUDENT...
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010102', 'java一班二号', 'JAVA', '1', '11122223333', '123', '123456789123456789', '男', null, 1477638367836);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010103', 'java一班三号', 'JAVA', '1', '11122223333', '123', '123456789123456789', '男', null, 1478058473374);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010201', 'java二班一号', 'JAVA', '2', '11122223333', '123', '123456789123456789', '男', null, 1478058477951);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010202', 'java二班二号', 'JAVA', '2', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010203', 'java二班三号', 'JAVA', '2', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010301', 'java三班一号', 'JAVA', '3', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010302', 'java三班二号', 'JAVA', '3', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010303', 'java三班三号', 'JAVA', '3', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020101', '安卓一班一号', '安卓', '4', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020102', '安卓一班二号', '安卓', '4', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020103', '安卓一班三号', '安卓', '4', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020201', '安卓二班一号', '安卓', '5', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020202', '安卓二班二号', '安卓', '5', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020203', '安卓二班三号', '安卓', '5', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020301', '安卓三班一号', '安卓', '6', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020302', '安卓三班二号', '安卓', '6', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('020303', '安卓三班三号', '安卓', '6', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030101', '前端一班一号', '前端', '7', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030102', '前端一班二号', '前端', '7', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030103', '前端一班三号', '前端', '7', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030201', '前端二班一号', '前端', '8', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030202', '前端二班二号', '前端', '8', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030203', '前端二班三号', '前端', '8', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030301', '前端三班一号', '前端', '9', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030302', '前端三班二号', '前端', '9', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('030303', '前端三班三号', '前端', '9', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010101', 'java一班一号', 'JAVA', '1', '11122223333', '123', '123456789123456789', '男', null, 1478144453757);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040101', '测试一班一号', '测试', '10', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040102', '测试一班二号', '测试', '10', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040103', '测试一班三号', '测试', '10', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040201', '测试二班一号', '测试', '11', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040202', '测试二班二号', '测试', '11', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040203', '测试二班三号', '测试', '11', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040301', '测试三班一号', '测试', '12', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040302', '测试三班二号', '测试', '12', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('040303', '测试三班三号', '测试', '12', '11122223333', '123', '123456789123456789', '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010104', 'java一班四号', 'JAVA', '1', null, '123', null, '男', null, 1477626150392);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010204', 'java二班四号', 'JAVA', '2', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010304', 'java三班四号', 'JAVA', '3', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010105', 'java一班五号', 'JAVA', '1', null, '123', null, '男', null, 1477626125670);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010205', 'java二班五号', 'JAVA', '2', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010305', 'java三班五号', 'JAVA', '3', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010106', 'java一班六号', 'JAVA', '1', null, '123', null, '男', null, 1477626211796);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010206', 'java二班六号', 'JAVA', '2', null, '123', null, '男', null, 1477626204708);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010306', 'java三班六号', 'JAVA', '3', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010107', 'java一班七号', 'JAVA', '1', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010207', 'java二班七号', 'JAVA', '2', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010307', 'java三班七号', 'JAVA', '3', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010001', 'javaS班一号', 'JAVA', '0', null, '123', null, '男', null, 1477626397611);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010002', 'javaS班二号', 'JAVA', '0', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010003', 'javaS班三号', 'JAVA', '0', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010004', 'javaS班四号', 'JAVA', '0', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010005', 'javaS班五号', 'JAVA', '0', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010006', 'javaS班六号', 'JAVA', '0', null, '123', null, '男', null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare, slogintime)
values ('010007', 'javaS班七号', 'JAVA', '0', null, '123', null, '男', null, null);
commit;
prompt 55 records loaded
prompt Loading SCOREMANAGE...
prompt Table is empty
prompt Loading SECTIONS...
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 1, 'java基础');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 2, 'java语言基础');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 3, '面向对象');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 4, '继承');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 5, '抽象');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 6, '接口');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 7, '集合');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 8, 'io流');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 9, 'jdbc');
commit;
prompt 9 records loaded
prompt Loading SECTIONTRANS...
insert into SECTIONTRANS (sectionid, sectionname)
values (1, '第一章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第二章');
insert into SECTIONTRANS (sectionid, sectionname)
values (3, '第三章');
insert into SECTIONTRANS (sectionid, sectionname)
values (4, '第四章');
insert into SECTIONTRANS (sectionid, sectionname)
values (5, '第五章');
insert into SECTIONTRANS (sectionid, sectionname)
values (6, '第六章');
insert into SECTIONTRANS (sectionid, sectionname)
values (7, '第七章');
insert into SECTIONTRANS (sectionid, sectionname)
values (8, '第八章');
insert into SECTIONTRANS (sectionid, sectionname)
values (9, '第九章');
insert into SECTIONTRANS (sectionid, sectionname)
values (10, '第十章');
insert into SECTIONTRANS (sectionid, sectionname)
values (11, '第十一章');
insert into SECTIONTRANS (sectionid, sectionname)
values (12, '第十二章');
insert into SECTIONTRANS (sectionid, sectionname)
values (13, '第十三章');
insert into SECTIONTRANS (sectionid, sectionname)
values (14, '第十四章');
insert into SECTIONTRANS (sectionid, sectionname)
values (15, '第十五章');
commit;
prompt 15 records loaded
set feedback on
set define on
prompt Done.
