prompt PL/SQL Developer import file
prompt Created on 2016��10��22�� by changxinzhi
set feedback off
set define off
prompt Loading CLASSINFO...
insert into CLASSINFO (classid, classname, spare)
values ('4', 'ORACLE-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('5', 'ORACLE-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('6', 'ORACLE-3', null);
insert into CLASSINFO (classid, classname, spare)
values ('7', 'HTML-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('8', 'HTML-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('9', 'HTML-3', null);
insert into CLASSINFO (classid, classname, spare)
values ('0', 'JAVA-S', null);
insert into CLASSINFO (classid, classname, spare)
values ('1', 'JAVA-1', null);
insert into CLASSINFO (classid, classname, spare)
values ('2', 'JAVA-2', null);
insert into CLASSINFO (classid, classname, spare)
values ('3', 'JAVA-3', null);
commit;
prompt 10 records loaded
prompt Loading STUDENT...
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001102', 'javaһ�����', 'JAVA', '1', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001103', 'javaһ������', 'JAVA', '1', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001201', 'java����һ��', 'JAVA', '2', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001202', 'java�������', 'JAVA', '2', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001203', 'java��������', 'JAVA', '2', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001301', 'java����һ��', 'JAVA', '3', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001302', 'java�������', 'JAVA', '3', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001303', 'java��������', 'JAVA', '3', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002101', 'oracleһ��һ��', 'ORACLE', '4', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002102', 'oracleһ�����', 'ORACLE', '4', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002103', 'oracleһ������', 'ORACLE', '4', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002201', 'oracle����һ��', 'ORACLE', '5', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002202', 'oracle�������', 'ORACLE', '5', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002203', 'oracle��������', 'ORACLE', '5', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002301', 'oracle����һ��', 'ORACLE', '6', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002302', 'oracle�������', 'ORACLE', '6', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1002304', 'oracle��������', 'ORACLE', '6', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006101', 'htmlһ��һ��', 'HTML', '7', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006102', 'htmlһ�����', 'HTML', '7', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006103', 'htmlһ������', 'HTML', '7', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006201', 'html����һ��', 'HTML', '8', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006202', 'html�������', 'HTML', '8', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006203', 'html��������', 'HTML', '8', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006301', 'html����һ��', 'HTML', '9', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006302', 'html�������', 'HTML', '9', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1006303', 'html��������', 'HTML', '9', '11122223333', '123', '123456789123456789', '��', null);
insert into STUDENT (sno, sname, major, classid, sphone, spwd, sidcard, sex, spare)
values ('1001101', 'javaһ��һ��', 'JAVA', '1', '11122223333', '123', '123456789123456789', '��', null);
commit;
prompt 27 records loaded
set feedback on
set define on
prompt Done.
