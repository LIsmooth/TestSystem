prompt PL/SQL Developer import file
prompt Created on 2016年10月9日 by CK
set feedback off
set define off
prompt Creating ANSWER...
create table ANSWER
(
  paperno NUMBER(5),
  sno     VARCHAR2(20),
  qno     NUMBER(4),
  answer  VARCHAR2(500),
  spare   VARCHAR2(20),
  typeid  NUMBER
)
tablespace HOPE_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLASSINFO...
create table CLASSINFO
(
  classid   VARCHAR2(5) not null,
  classname VARCHAR2(20),
  spare     VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLASSINFO
  add constraint PK_CLASSINFO_CLASSID primary key (CLASSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating QUESTIONTYPE...
create table QUESTIONTYPE
(
  typeid   NUMBER(1) not null,
  typename VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUESTIONTYPE
  add constraint PK_QTYPE_TYPEID primary key (TYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SUBJECTINFO...
create table SUBJECTINFO
(
  subjectid   VARCHAR2(10) not null,
  subjectname VARCHAR2(15),
  classhour   NUMBER,
  spare       VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUBJECTINFO
  add constraint PK_SUBJECTINFO_SUBJECTID primary key (SUBJECTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ESSAYQUESTION
  add constraint PK_ESSAY_QUESTIONNO primary key (QUESTIONNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ESSAYQUESTION
  add constraint FK_ESSAYQ_ISESSAY foreign key (ISESSAY)
  references QUESTIONTYPE (TYPEID);
alter table ESSAYQUESTION
  add constraint FK_ESSAY_SUBJECTID foreign key (SUBJECTID)
  references SUBJECTINFO (SUBJECTID);

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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEACHER
  add constraint PK_TEACHER_TNO primary key (TNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAPERINFO
  add constraint PK_PAPERINFO_PAPERNO primary key (PAPERNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAPERINFO
  add constraint FK_PAPERINFO_TNO foreign key (TNO)
  references TEACHER (TNO);

prompt Creating EXAMMANAGE...
create table EXAMMANAGE
(
  examno    NUMBER(10) not null,
  typeid    CHAR(2),
  subjectid VARCHAR2(10),
  paperno   NUMBER(5),
  examtime  DATE,
  totaltime NUMBER(4),
  charged   NUMBER(1),
  examname  VARCHAR2(50),
  classids  VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EXAMMANAGE
  add constraint PK_EXAMMANAGER_EXAMNO primary key (EXAMNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MULTIQUESTIONS
  add constraint PK_MULTI_QUESTIONNO primary key (QUESTIONNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table QUESTIONLEVEL
  add constraint PK_QUESTIONLEVEL primary key (LEVELID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT
  add constraint PK_STUDENT_SNO primary key (SNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SECTIONS
  add constraint PK_SECTIONS_SECTIONID primary key (SECTIONID, SUBJECTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SECTIONS
  add constraint FK_SECTIONS_SUBJECTID foreign key (SUBJECTID)
  references SUBJECTINFO (SUBJECTID);

prompt Creating SECTIONTRANS...
create table SECTIONTRANS
(
  sectionid   NUMBER(2) not null,
  sectionname VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Loading ANSWER...
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 7, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 5, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 17, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 18, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 12, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 0, '   1111111' || chr(9) || '' || chr(9) || '' || chr(9) || '    ' || chr(13) || '' || chr(10) || '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '', null, 3);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 7, '   22222222' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 6, '   ' || chr(9) || '3333333333' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '123', 5, '   ' || chr(9) || '44444444444' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 7, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 5, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 17, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 18, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 12, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 0, '  444444 ' || chr(9) || '' || chr(9) || '' || chr(9) || '    ' || chr(13) || '' || chr(10) || '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '', null, 3);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 7, '   ' || chr(9) || '33333' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 6, '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '  2222222  ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (46, '10010', 5, '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '111111111    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 1, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 7, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 4, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 18, 'B', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 13, 'C', null, 1);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 2, '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '    ' || chr(13) || '' || chr(10) || '11111   ' || chr(9) || '' || chr(9) || '' || chr(9) || '', null, 3);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 7, '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '222222222    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 6, '   ' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '3333333    ', null, 4);
insert into ANSWER (paperno, sno, qno, answer, spare, typeid)
values (47, '10010', 5, '   ' || chr(9) || '444444444' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '   ' || chr(9) || '    ', null, 4);
commit;
prompt 27 records loaded
prompt Loading CLASSINFO...
insert into CLASSINFO (classid, classname, spare)
values ('0', 'JAVA-S', null);
insert into CLASSINFO (classid, classname, spare)
values ('1', 'JAVA-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('2', 'JAVA-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('3', 'JAVA-3', null);
commit;
prompt 4 records loaded
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
values ('2', 15, '123', '123', 2, 1, 3, 5);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('2', 50, '1', null, 1, 1, 3, 25);
insert into ESSAYQUESTION (subjectid, questionno, question, rightanswer, questionlevel, sectionid, isessay, questionmark)
values ('1', 8, 'java语言的优点？', '跨平台', 1, 1, 4, 12);
commit;
prompt 11 records loaded
prompt Loading TEACHER...
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('0', '不紧张', 'java', '男', null, '123', null, null);
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('1', '俭银', 'html', null, null, '123', null, null);
insert into TEACHER (tno, tname, major, sex, tphone, tpwd, tidcard, spare)
values ('111', '庞少虎', null, null, null, '222', null, null);
commit;
prompt 3 records loaded
prompt Loading PAPERINFO...
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (44, 1, 0, 1, 9, to_date('09-10-2016 18:57:10', 'dd-mm-yyyy hh24:mi:ss'), '1', 'chenjianyin', 'hehe');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (45, 1, 0, 1, 9, to_date('09-10-2016 19:08:47', 'dd-mm-yyyy hh24:mi:ss'), '1', 'liuyudi', 'hahaha');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (9, 1, 0, 0, 0, to_date('09-10-2016 09:30:11', 'dd-mm-yyyy hh24:mi:ss'), '111', '考试试题', null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (51, 1, 1, 1, 9, to_date('08-10-2016 14:55:45', 'dd-mm-yyyy hh24:mi:ss'), '0', '二阶段考试', '没有');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (2, 2, 1, 1, 5, to_date('08-10-2016', 'dd-mm-yyyy'), '111', '第一阶段HTML考试', '0');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (8, 1, 0, 0, 0, to_date('09-10-2016 09:24:01', 'dd-mm-yyyy hh24:mi:ss'), '111', '考试试题', null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (1, 1, 1, 1, 5, to_date('08-10-2016', 'dd-mm-yyyy'), '111', '第一阶段JAVA考试', '0');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (42, 1, 0, 1, 9, to_date('09-10-2016 18:51:42', 'dd-mm-yyyy hh24:mi:ss'), '1', 'chen', 'java考试');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (46, 1, 0, 1, 9, to_date('09-10-2016 19:24:03', 'dd-mm-yyyy hh24:mi:ss'), '1', 'guohao', 'heihei');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (39, 1, 0, 1, 9, to_date('07-10-2016 21:26:17', 'dd-mm-yyyy hh24:mi:ss'), '0', 'test', 'heng');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (38, 1, 0, 1, 9, to_date('07-10-2016 19:46:11', 'dd-mm-yyyy hh24:mi:ss'), '0', '商务英语', 'hehe');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (41, 1, 0, 1, 9, to_date('08-10-2016 15:45:13', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (33, 1, 0, 1, 9, to_date('07-10-2016 14:53:58', 'dd-mm-yyyy hh24:mi:ss'), '0', '商务英语', 'hehe');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (34, 1, 0, 1, 9, to_date('07-10-2016 14:56:25', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (35, 1, 0, 1, 9, to_date('07-10-2016 15:13:21', 'dd-mm-yyyy hh24:mi:ss'), '0', 'javaExam', 'haha');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (36, 1, 0, 1, 9, to_date('07-10-2016 18:56:49', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (37, 1, 0, 1, 9, to_date('07-10-2016 19:36:03', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (40, 1, 0, 1, 9, to_date('08-10-2016 11:22:01', 'dd-mm-yyyy hh24:mi:ss'), '0', 'chen', 'jianyin');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (0, 1, 2, 1, 9, to_date('29-09-2016 10:02:04', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (20, 1, 0, 1, 9, to_date('06-10-2016 19:56:17', 'dd-mm-yyyy hh24:mi:ss'), '1', 'javaTest', null);
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (47, 1, 0, 1, 9, to_date('09-10-2016 20:21:01', 'dd-mm-yyyy hh24:mi:ss'), '1', 'changxinzhi', 'heihei');
commit;
prompt 21 records loaded
prompt Loading EXAMMANAGE...
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (6, 'A ', '1', 44, to_date('12-10-2016 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), 100, 0, 'chenjianyin', '0,1');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (7, 'A ', '1', 45, to_date('18-10-2016 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), 88, 0, 'liuyudi', '0,1,');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (1, 'A ', '1', 51, to_date('08-10-2016', 'dd-mm-yyyy'), 88, null, 'java', null);
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (2, 'A ', '2', 2, to_date('09-10-2016 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), 60, 0, '第一阶段HTML考试', '0,1,2');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (8, 'A ', '1', 46, to_date('12-10-2016 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), 66, 0, 'guohao', '0,1,');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (5, 'A ', '1', 39, to_date('10-10-2016 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), 90, 0, 'test', '1,');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (9, 'A ', '1', 9, to_date('25-10-2016 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), 66, 0, '考试试题', '0,1,');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (10, 'A ', '1', 47, to_date('19-10-2016 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), 66, 0, 'changxinzhi', '0,1,');
commit;
prompt 8 records loaded
prompt Loading MULTIQUESTIONS...
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (20, '1', 4, '在子类构造方法中使用super()显式调用父类的构造方法，super()必须写在子类构造方法的第一行，否则编译不通过', 'super()和this()不一定要放在构造方法内第一行', 'this()和super()可以同时出现在一个构造函数中' || chr(9) || '', 'this()和super()可以在static环境中使用，包括static方法和static语句块', 'A', 1, null, '在使用super和this关键字时，以下描述正确的是()', 1, 2);
insert into MULTIQUESTIONS (questionno, subjectid, sectionid, questiona, questionb, questionc, questiond, rightanswer, questionlevel, spare, question, ismultiple, questionmark)
values (1, '1', 7, 'ArrayList myList = new Object()', 'List myList = new Vector()', 'ArrayList myList = new List()', 'List myList = new List()', 'B', 2, null, '欲构造ArrayList类的一个实例，此类继承了List接口，下列哪个方法是正确的:()', 1, 2);
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
values (10, '1', 1, 'double', 'char ', 'byte', 'short', 'A', 1, null, '在switch（expression）语句中，expression的数据类型不能是（     ）', 1, 2);
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
commit;
prompt 21 records loaded
prompt Loading PAPERMANAGE...
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 1, 1, 3, 1);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 1, 4, 3, 2);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 1, 8, 3, 3);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 1, 15, 3, 4);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 1, 16, 3, 5);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 3, 0, 10, 6);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 4, 7, 37, 7);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (44, 4, 5, 38, 8);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 1, 1, 3, 1);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 1, 2, 3, 2);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 1, 3, 3, 3);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 1, 5, 3, 4);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 1, 12, 3, 5);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 3, 1, 10, 6);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 4, 7, 25, 7);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 4, 6, 25, 8);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (45, 4, 8, 25, 9);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 1, 5, 3, 1);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 1, 7, 3, 2);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 1, 12, 3, 3);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 1, 17, 3, 4);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 1, 18, 3, 5);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 3, 0, 10, 6);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 4, 7, 25, 7);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 4, 6, 25, 8);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (46, 4, 5, 25, 9);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 1, 1, 3, 1);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 1, 4, 3, 2);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 1, 7, 3, 3);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 1, 13, 3, 4);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 1, 18, 3, 5);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 3, 2, 10, 6);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 4, 7, 25, 7);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 4, 6, 25, 8);
insert into PAPERMANAGE (paperno, typeid, questionno, questionmark, qid)
values (47, 4, 5, 25, 9);
commit;
prompt 35 records loaded
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
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('123', '张三', null, '1', null, '123', null, null, null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10010', '张三', 'JAVA', '1', '13013013010', '123', '123456789123456789', '男', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10011', '李四', 'JAVA', '2', '13013013011', '123', '123456789123456789', '男', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10012', '王五', 'JAVA', '3', '13013013012', '123', '123456789987654321', '女', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10013', '赵六', 'JAVA', '1', '13013013013', '123', '123456789987654321', '男', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10014', '钱七', 'JAVA', '2', '13013013014', '123', '123456789987654321', '女', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10015', '孙八', 'JAVA', '3', '13013013015', '123', '123456789987654321', '男', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10016', '马哲', 'JAVA', '0', '13013013016', '123', '123456789987654321', '男', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('10017', '岳同书', 'JAVA', '0', '13013013017', '123', '123456789987654321', '男', null);
commit;
prompt 9 records loaded
prompt Loading SCOREMANAGE...
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '123', 30, 70, 100, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10010', 30, 70, 77, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10011', 30, 60, 72, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10012', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10013', 30, 50, 65, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10014', 30, 40, 58, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10015', 30, 90, 93, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10016', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10017', 30, 70, 77, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10010', 30, 60, 72, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10011', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10012', 30, 90, 93, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10013', 30, 70, 77, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10014', 30, 30, 51, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10015', 30, 50, 65, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10016', 30, 60, 72, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10017', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (8, '123', 30, 44, 61, 'hehe');
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '123', 30, 70, 100, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10010', 30, 70, 77, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10011', 30, 60, 72, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10012', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10013', 30, 50, 65, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10014', 30, 40, 58, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10015', 30, 90, 93, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10016', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (1, '10017', 30, 70, 77, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10010', 30, 60, 72, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10011', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10012', 30, 90, 93, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10013', 30, 70, 77, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10014', 30, 30, 51, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10015', 30, 50, 65, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10016', 30, 60, 72, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (2, '10017', 30, 80, 86, null);
insert into SCOREMANAGE (examno, sno, ptscore, etscore, score, spare)
values (10, '10010', 30, 10, 37, 'hehe');
commit;
prompt 36 records loaded
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
values (2, '第三章');
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
values (10, '第十章');
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
insert into SECTIONTRANS (sectionid, sectionname)
values (1, '第一章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第二章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第三章');
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
values (10, '第十章');
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
insert into SECTIONTRANS (sectionid, sectionname)
values (1, '第一章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第二章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第三章');
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
values (10, '第十章');
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
insert into SECTIONTRANS (sectionid, sectionname)
values (1, '第一章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第二章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第三章');
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
values (10, '第十章');
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
insert into SECTIONTRANS (sectionid, sectionname)
values (1, '第一章');
insert into SECTIONTRANS (sectionid, sectionname)
values (2, '第二章');
insert into SECTIONTRANS (sectionid, sectionname)
values (3, '第三章');
commit;
prompt 75 records loaded
set feedback on
set define on
prompt Done.
