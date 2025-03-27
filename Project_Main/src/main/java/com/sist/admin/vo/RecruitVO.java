package com.sist.admin.vo;

import lombok.Data;

/*
    ENO              NUMBER       not null,
    NAME             VARCHAR2(100),
    TITLE            VARCHAR2(200),
    PERSONAL_HISTORY VARCHAR2(100),
    SALARY_STR       VARCHAR2(400),
    EDUCATION        NUMBER,
    LOC              VARCHAR2(400),
    EMP_TYPE         VARCHAR2(200),
    REGDATE          DATE   default SYSDATE,
    HIT              NUMBER default 0,
    DEADLINE         DATE,
    CID              VARCHAR2(10) not null
        constraint FK_COMPANY_TO_EMPLOYMENT_1
            references COMPANY,
    CONTENT          CLOB,
    SALARY           NUMBER,
    constraint PK_EMPLOYMENT
        primary key (eno)
 */
@Data
public class RecruitVO {
  
  public int eno, education, hit, salary;
  public String name;
  public String title;
  public String personal_history;

  public String salary_str;
  public String loc;
  public String emp_type;
  public String cid;
  public String content;
}
