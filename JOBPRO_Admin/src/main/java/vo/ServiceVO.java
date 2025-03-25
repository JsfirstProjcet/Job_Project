package vo;

import java.util.Date;

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
public class ServiceVO {

  private int id, visible, ok;
  private String pid;

  public String getQtitle() {
    return qtitle;
  }

  public void setQtitle(String qtitle) {
    this.qtitle = qtitle;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getVisible() {
    return visible;
  }

  public void setVisible(int visible) {
    this.visible = visible;
  }

  public int getOk() {
    return ok;
  }

  public void setOk(int ok) {
    this.ok = ok;
  }

  public String getPid() {
    return pid;
  }

  public void setPid(String pid) {
    this.pid = pid;
  }

  public String getQcontent() {
    return qcontent;
  }

  public void setQcontent(String qcontent) {
    this.qcontent = qcontent;
  }

  public String getAtitle() {
    return atitle;
  }

  public void setAtitle(String atitle) {
    this.atitle = atitle;
  }

  public String getAcontent() {
    return acontent;
  }

  public void setAcontent(String acontent) {
    this.acontent = acontent;
  }

  public Date getQdate() {
    return qdate;
  }

  public void setQdate(Date qdate) {
    this.qdate = qdate;
  }

  public Date getAdate() {
    return adate;
  }

  public void setAdate(Date adate) {
    this.adate = adate;
  }

  private String qtitle;
  private String qcontent;
  private String atitle;
  private String acontent;
  private Date qdate, adate;

}
