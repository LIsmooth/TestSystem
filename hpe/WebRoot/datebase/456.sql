prompt PL/SQL Developer import file
prompt Created on 2016年10月8日 by Administrator
set feedback off
set define off
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

prompt Creating PAPERMANAGE...
create table PAPERMANAGE
(
  paperno      NUMBER(5) not null,
  questiontype VARCHAR2(20),
  questionno   NUMBER(4) not null,
  questionmark NUMBER(2),
  spare        VARCHAR2(20),
  qid          NUMBER(3)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column PAPERMANAGE.qid
  is '在试卷中的题号';
alter table PAPERMANAGE
  add constraint PK_PAPERMANAGE_PAPERNO primary key (PAPERNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

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
  add constraint PK_SCOREMANAGE_SNO foreign key (SNO)
  references STUDENT (SNO);

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
prompt Loading PAPERINFO...
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (2, 2, 1, 1, 5, to_date('08-10-2016', 'dd-mm-yyyy'), '111', '第一阶段HTML考试', '0');
insert into PAPERINFO (paperno, subjectid, questionlevel, startsection, endsection, generatedate, tno, papername, remark)
values (1, 1, 1, 1, 5, to_date('08-10-2016', 'dd-mm-yyyy'), '111', '第一阶段JAVA考试', '0');
commit;
prompt 2 records loaded
prompt Loading SUBJECTINFO...
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('2', 'HTML+CSS', 60, null);
insert into SUBJECTINFO (subjectid, subjectname, classhour, spare)
values ('1', 'Java基础', 80, null);
commit;
prompt 2 records loaded
prompt Loading EXAMMANAGE...
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (2, 'A ', '2', 2, to_date('09-10-2016 12:00:00', 'dd-mm-yyyy hh24:mi:ss'), 60, 0, '第一阶段HTML考试', '0,1,2');
insert into EXAMMANAGE (examno, typeid, subjectid, paperno, examtime, totaltime, charged, examname, classids)
values (1, 'A ', '1', 1, to_date('10-10-2016 10:00:00', 'dd-mm-yyyy hh24:mi:ss'), 120, 0, '第一阶段JAVA考试', '0,1,2,');
commit;
prompt 2 records loaded
prompt Loading PAPERMANAGE...
prompt Table is empty
prompt Loading STUDENT...
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
prompt 8 records loaded
prompt Loading SCOREMANAGE...
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
commit;
prompt 16 records loaded
set feedback on
set define on
prompt Done.
