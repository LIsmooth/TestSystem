prompt PL/SQL Developer import file
prompt Created on 2016��10��8�� by Lismooth
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

prompt Creating STUDENT...
create table STUDENT
(
  sno     VARCHAR2(20) not null,
  sname   VARCHAR2(20),
  major   VARCHAR2(50),
  classid VARCHAR2(5),
  sphone  VARCHAR2(11),
  spwd    VARCHAR2(16),
  sidcard VARCHAR2(18),
  sex     VARCHAR2(2),
  spare   VARCHAR2(50)
)
;
alter table STUDENT
  add constraint PK_STUDENT_SNO primary key (SNO);
alter table STUDENT
  add constraint FK_STUDENT_CLASSID foreign key (CLASSID)
  references CLASSINFO (CLASSID);

prompt Creating ANSWER...
create table ANSWER
(
  paperno  NUMBER(5),
  "sno"    VARCHAR2(20),
  qno      NUMBER(4),
  "answer" VARCHAR2(500),
  "spare"  VARCHAR2(20)
)
;
alter table ANSWER
  add constraint FK_ANSWER_PAPERNO foreign key (PAPERNO)
  references PAPERINFO (PAPERNO);
alter table ANSWER
  add constraint FK_ANSWER_SNO foreign key (sno)
  references STUDENT (SNO);

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
  examno    NUMBER(10) not null,
  typeid    CHAR(2),
  subjetid  VARCHAR2(10),
  paperno   NUMBER(5),
  examtime  DATE,
  totaltime NUMBER(4),
  charged   NUMBER(1),
  examname  VARCHAR2(50)
)
;
alter table EXAMMANAGE
  add constraint PK_EXAMMANAGER_EXAMNO primary key (EXAMNO);
alter table EXAMMANAGE
  add constraint FK_EXAM_PAPERNO foreign key (PAPERNO)
  references PAPERINFO (PAPERNO);
alter table EXAMMANAGE
  add constraint FK_EXAM_SUBJECTID foreign key (SUBJETID)
  references SUBJECTINFO (SUBJECTID);
alter table EXAMMANAGE
  add constraint YS_EXAMMANAGE_TYPE
  check (TYPEid in ('A','B'));

prompt Creating EXAMCLASS...
create table EXAMCLASS
(
  examno  NUMBER(10),
  classid VARCHAR2(5)
)
;
alter table EXAMCLASS
  add constraint FK_EXAMCLASS_CLASSID foreign key (CLASSID)
  references CLASSINFO (CLASSID);
alter table EXAMCLASS
  add constraint FK_EXAMCLASS_EXAMNO foreign key (EXAMNO)
  references EXAMMANAGE (EXAMNO);

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
  is '���Ծ��е����';
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

prompt Creating SCOREMANAGE...
create table SCOREMANAGE
(
  "examno"  NUMBER(10),
  "sno"     VARCHAR2(20),
  "ptscore" NUMBER(3),
  "etscore" NUMBER(3),
  "score"   NUMBER(3),
  "spare"   VARCHAR2(20)
)
;
alter table SCOREMANAGE
  add constraint FK_SCORE_EXAMNO foreign key (examno)
  references EXAMMANAGE (EXAMNO);
alter table SCOREMANAGE
  add constraint FK_SCORE_SNO foreign key (sno)
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
values ('0', '������', 'java', '��', null, null, null, null);
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('1', '����', 'html', null, null, null, null, null);
commit;
prompt 2 records loaded
prompt Loading PAPERINFO...
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (40, 1, 0, 1, 9, to_date('07-10-2016 21:29:02', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (20, 1, 1, 1, 9, to_date('06-10-2016 19:56:17', 'dd-mm-yyyy hh24:mi:ss'), '0', '���׶ο���', 'û��');
commit;
prompt 2 records loaded
prompt Loading CLASSINFO...
prompt Table is empty
prompt Loading STUDENT...
prompt Table is empty
prompt Loading ANSWER...
prompt Table is empty
prompt Loading QUESTIONTYPE...
insert into QUESTIONTYPE (typeid, typename)
values (1, '��ѡ��');
insert into QUESTIONTYPE (typeid, typename)
values (2, '��ѡ��');
insert into QUESTIONTYPE (typeid, typename)
values (3, '�ʴ���');
insert into QUESTIONTYPE (typeid, typename)
values (4, '�����');
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
values ('4', 'ǰ��', 64, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('5', 'ps', 64, null);
commit;
prompt 6 records loaded
prompt Loading ESSAYQUESTION...
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 0, '�����������?', '��װ: ����˽�û����ṩ���еķ�������˽�����ԣ�����һЩ�Ƿ���ֵ' || chr(10) || '  ��̬: �������ָ���������ã���̬��Ҫ�����̳л�ӿ�ʵ����' || chr(10) || '  Person p=new Student(); ' || chr(10) || '  Person p2=new Teacher();' || chr(10) || '  Person p3=new Works();   ' || chr(10) || '  public void sayHi(Person p)' || chr(10) || '  {' || chr(10) || '        p.hello();' || chr(10) || '  } ' || chr(10) || '�̳У�һ����ͨ��extends�ؼ���ʵ�ּ̳У�javaֻ֧�ֵ��̳С������޷�' || chr(10) || '      �̳и���˽������' || chr(10) || '����:' || chr(10) || '  1 ������abstract����' || chr(10) || '  2 ���һ��������abstract�����������һ����һ��������' || chr(10) || '  3 ���������������ʵ������' || chr(10) || '  4 �����಻��ʵ����', 2, 3, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 1, 'IO���ַ������ֽ���(Ĭд)', ' //�ֽ���(д)' || chr(10) || '   OutputStream os=new FileOutputStream("d:\\io\\tt.txt");' || chr(10) || '   os.write("����".getBytes());' || chr(10) || '   os.close();' || chr(10) || '  //�ֽ���(��)  ' || chr(10) || '  InputStream is=new FileInputStream("d:\\io\\tt.txt");' || chr(10) || '   byte [] bs=new byte[1024];' || chr(10) || '   is.read(bs);' || chr(10) || '   String msg=new String(bs);' || chr(10) || '   String d=new String(msg.getBytes("iso-8859-1"),"gbk");' || chr(10) || '' || chr(10) || '  //�ַ���(д)' || chr(10) || '  FileWriter fw=new FileWriter("d:\\io\\ss.txt");' || chr(10) || '  fw.write("����");' || chr(10) || '  fw.clsoe();' || chr(10) || '' || chr(10) || '  //�ַ���������' || chr(10) || '  FileReader fr=new FileReader("d:\\ss.txt");' || chr(10) || '  ' || chr(10) || '  char[] ch=new char[1024];' || chr(10) || '' || chr(10) || '  fr.read(ch);' || chr(10) || '' || chr(10) || '  for(char c:ch)' || chr(10) || '  {' || chr(10) || '     System.out.print(c);' || chr(10) || '  }', 3, 8, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 2, 'JDBC�������ݿⲽ��', 'try{' || chr(10) || '  Class.forName("oracle.jdbc.driver.OracleDriver");' || chr(10) || '  String url="jdbc:oracle:thin:@localhost:1521:orcl";' || chr(10) || '  Connection conn=DriverManager.getConnection    (url,"scott","123"):' || chr(10) || '  String sql="insert into Users values(?,?,?)";' || chr(10) || '  PreparedStatement ps=conn.prepareStatement(sql);' || chr(10) || '  ps.setObject(1,"1");' || chr(10) || '  ps.setObject(2,"����");' || chr(10) || '  ps.setObject(3,21);' || chr(10) || '  int r=ps.executeUpdate();' || chr(10) || '  if(r>0)' || chr(10) || '  {' || chr(10) || '     System.out.println("����ɹ�");' || chr(10) || '  }else' || chr(10) || '  {' || chr(10) || '    System.out.println("����ʧ��");  ' || chr(10) || '  }' || chr(10) || '  ps.close();' || chr(10) || '  conn.close();' || chr(10) || '}catch(Exception ex)' || chr(10) || '{' || chr(10) || '  ex.printStackTrace(); ' || chr(10) || '}' || chr(10) || '', 3, 9, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 3, '==��equals����', '==�Ƚ��ڴ��ַ�Ƿ����' || chr(10) || '' || chr(10) || '  equals�����Ƿ����', 1, 8, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 4, '��̬������ʵ������', '1����̬������static���� ʵ������д������ڲ�' || chr(10) || '' || chr(10) || '  2����̬��������ʱ�ã�����.��̬������  ʵ��������������.������', 2, 1, 3, 10);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 7, '��ӡ99�˷���', 'public static void Test1()' || chr(10) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("1.��ӡ�žų˷���:");' || chr(10) || '' || chr(9) || '' || chr(9) || 'for (int i = 1; i < 10; i++)' || chr(10) || '' || chr(9) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'for (int j = 1; j <= i; j++)' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'int a = j * i;' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.print(j + "*" + i + "=" + a + " ");' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '}' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '' || chr(9) || '}' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '}', 2, 1, 4, 20);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 6, '����һ�������ж�������������ż��', 'public static void Test2()' || chr(10) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("2.����һ�������ж�������������ż��:");' || chr(10) || '' || chr(9) || '' || chr(9) || 'Scanner er = new Scanner(System.in);' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("��������һ��������");' || chr(10) || '' || chr(9) || '' || chr(9) || 'int a = er.nextInt();' || chr(10) || '' || chr(9) || '' || chr(9) || 'if (a % 2 == 0)' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.println("�������" + a + "��һ��ż��");' || chr(10) || '' || chr(9) || '' || chr(9) || 'else' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.println("�������" + a + "��һ������");' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '}', 1, 1, 4, 20);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 5, '���1��100֮���ż��', 'public static void Test3()' || chr(10) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println("3.���1��100֮���ż��");' || chr(10) || '' || chr(9) || '' || chr(9) || 'for (int a = 1; a <= 100; a++)' || chr(10) || '' || chr(9) || '' || chr(9) || '{' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'if (a % 2 == 0)' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'System.out.print("1��100֮���ż��: " + a + ";  ");' || chr(10) || '' || chr(9) || '' || chr(9) || '}' || chr(10) || '' || chr(9) || '' || chr(9) || 'System.out.println();' || chr(10) || '' || chr(9) || '}', 1, 1, 4, 20);
commit;
prompt 8 records loaded
prompt Loading EXAMMANAGE...
prompt Table is empty
prompt Loading EXAMCLASS...
prompt Table is empty
prompt Loading MULTIQUESTIONS...
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (20, '1', 4, '�����๹�췽����ʹ��super()��ʽ���ø���Ĺ��췽����super()����д�����๹�췽���ĵ�һ�У�������벻ͨ��', 'super()��this()��һ��Ҫ���ڹ��췽���ڵ�һ��', 'this()��super()����ͬʱ������һ�����캯����' || chr(9) || '', 'this()��super()������static������ʹ�ã�����static������static����', 'A', 1, null, '��ʹ��super��this�ؼ���ʱ������������ȷ����()', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (1, '1', 7, 'ArrayList myList = new Object()', 'List myList = new Vector()', 'ArrayList myList = new List()', 'List myList = new List()', 'B', 2, null, '������ArrayList���һ��ʵ��������̳���List�ӿڣ������ĸ���������ȷ��:()', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (2, '1', 1, 'javac', 'java', 'jdb', 'javah', 'A', 1, null, '���ڽ�javaԴ�����ļ�������ֽ���ı������� (     )', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (3, '1', 1, 'start()', 'init()', 'paint()', 'main()', 'D', 1, null, 'JavaӦ�ó������ڷ����ǣ�     ��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (4, '1', 1, 'BigMeaninglessName ', '_whatavariable', '#myvar ', '$dollar', 'C', 2, null, '����ѡ����java�����ڲ��Ϸ��ı�ʶ�����ǣ�     ��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (5, '1', 1, 'short', 'long', 'int ', 'byte', 'D', 2, null, '�����������������У���Ҫ�ڴ�ռ����ٵ��� (      )��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (6, '1', 1, '0', '1', '2', '3', 'B', 2, null, '���д����ִ�к���������ǣ��� ������' || chr(10) || 'int x=3; ' || chr(10) || 'int y=10; ' || chr(10) || 'System.out.println(y%x); ', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (7, '1', 1, 'x[24]Ϊ0', 'x[24]δ����', 'x[25]Ϊ0 ', 'x[0]Ϊ��', 'A', 2, null, 'ִ�������int[ ] x = new int[25]��������ѡ��˵����ȷ���ǣ�     ��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (8, '1', 3, 'private', 'protected', 'default', 'public', 'C', 3, null, '����ĳ�Աδ�÷���Ȩ�����η�ʱ��Java��Ϊ�˳�Ա�ķ���Ȩ��Ϊ��      ��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (9, '1', 3, 'public x x1= new y( );', 'x x1=x( );' || chr(9) || '', 'x x1=new x( );' || chr(9) || '', 'int x x1;', 'C', 1, null, '�� x,y ��Ϊ�Ѷ����������������������x1���������ȷ���ǣ���������', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (10, '1', 1, 'double', 'char ', 'byte', 'short', 'A', 1, null, '��switch��expression������У�expression���������Ͳ����ǣ�     ��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (11, '1', 3, 'import sos.*;', 'package sos.*; ', 'sos import; ', 'sos package; ', 'A', 2, null, 'Ϊ��ʹ��sos�ڵ�ǰ�����пɼ�������ʹ�õ�����ǣ�     ��', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (12, '1', 1, 'int t1[][]={{1,2},{3,4},{5,6}}; ', 'int t2[][]={1,2,3,4,5,6}; ', 'int t3[3][2]={1,2,3,4,5,6}; ', 'int t4[][]; t4={1,2,3,4,5,6}; ', 'A', 1, null, '���������ʼ����ʽ��ȷ���ǣ�     ����', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (13, '1', 1, '35', '25', '20', '5', 'B', 1, null, '�����������ִ�к�x ��ֵ�ǣ�     ���� ' || chr(10) || 'int a=3, b=4, x=5; ' || chr(10) || 'if( ++a==b ) x=++a*x; ', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (14, '1', 1, '5k', '7k', '52k', '3k', 'B', 2, null, '�����г���ִ��ʱ�����������ǣ�      ����' || chr(10) || 'int x = 5;' || chr(10) || 'int y = 2;' || chr(10) || 'System.out.println(x+ y + "k");', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (15, '1', 6, 'final �������ࡢ���ԡ�����', 'abstract�������ࡢ���ԡ�����', '������󷽷����з����ķ������͡����ơ������б�ͷ�����', '��final���εı������ڳ����пɶ����������ֵ���и���', 'A', 1, null, '����˵����ȷ���ǣ�      ����', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (16, '1', 3, 'start', 'stop', 'yield', 'run', 'D', 3, null, 'Runnable�ӿ��еĳ��󷽷��ǣ�     ����', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (17, '1', 3, 'java.applet', 'java.awt ', 'java.util', 'java.lang ', 'D', 1, null, '��Java�У���Java�������Զ����룬�������ڳ�������import����İ��ǣ�       ����', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (18, '1', 3, 'java.lang.Object', 'java.lang.Class', 'java.applet.Applet', 'java.awt.Frame', 'A', 2, null, '��Java�У�������ĸ����ǣ�     ����', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (19, '1', 5, '���ص�', '���ص�', '�̵߳�', '���ܼ̳�', 'B', 2, null, 'Java���Ե����ļ̳й�ϵ�ǣ�     ����', 1, 2);
commit;
prompt 20 records loaded
prompt Loading PAPERMANAGE...
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 20, 2, 1);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 1, 2, 2);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 2, 2, 3);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 3, 2, 4);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 4, 2, 5);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 5, 2, 6);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 6, 2, 7);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 7, 2, 8);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 8, 2, 9);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 9, 2, 10);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 10, 2, 11);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 11, 2, 12);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 12, 2, 13);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 13, 2, 14);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 14, 2, 15);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 15, 2, 16);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 16, 2, 17);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 17, 2, 18);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 18, 2, 19);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 1, 19, 2, 20);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 3, 0, 10, 21);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 3, 4, 10, 22);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 4, 7, 20, 23);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (40, 4, 5, 20, 24);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 20, 2, 1);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 1, 2, 2);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 2, 2, 3);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 3, 2, 4);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 4, 2, 5);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 5, 2, 6);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 6, 2, 7);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 7, 2, 8);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 8, 2, 9);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 9, 2, 10);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 10, 2, 11);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 11, 2, 12);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 12, 2, 13);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 13, 2, 14);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 14, 2, 15);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 15, 2, 16);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 16, 2, 17);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 17, 2, 18);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 18, 2, 19);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 1, 19, 2, 20);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 3, 0, 10, 21);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 3, 3, 10, 22);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 4, 7, 20, 23);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (20, 4, 5, 20, 24);
commit;
prompt 48 records loaded
prompt Loading QUESTIONLEVEL...
prompt Table is empty
prompt Loading SCOREMANAGE...
prompt Table is empty
prompt Loading SECTIONS...
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 1, 'java����');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 2, 'java���Ի���');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 3, '�������');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 4, '�̳�');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 5, '����');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 6, '�ӿ�');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 7, '����');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 8, 'io��');
insert into SECTIONS (subjectid, sectionid, sectionname)
values ('1', 9, 'jdbc');
commit;
prompt 9 records loaded
prompt Loading SECTIONTRANS...
prompt Table is empty
set feedback on
set define on
prompt Done.
