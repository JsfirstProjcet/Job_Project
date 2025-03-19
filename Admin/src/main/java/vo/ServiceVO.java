package vo;

import java.util.Date;
import lombok.Data;

/*
    ID       NUMBER                 not null        primary key,
    PID      VARCHAR2(10)           not null,
    QTITLE   VARCHAR2(100)          not null,
    QCONTENT CLOB                   not null,
    ATITLE   VARCHAR2(100),
    ACONTENT CLOB,
    VISIBLE  NUMBER default 0       not null,
    OK       NUMBER default 0       not null,
    QDATE    DATE   default SYSDATE not null,
    ADATE    DATE   default NULL
 */
@Data
public class ServiceVO {

  private int id, visible, ok;
  private String pid, qtitle, qcontent, atitle, acontent;
  private Date qdate, adate;

}
