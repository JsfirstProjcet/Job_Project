package vo;

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
public class RecruitVO {

  public int eno, education, hit, salary;
  public String name;
  public String title;
  public String personal_history;

  public String getSalary_str() {
    return salary_str;
  }

  public void setSalary_str(String salary_str) {
    this.salary_str = salary_str;
  }

  public int getEno() {
    return eno;
  }

  public void setEno(int eno) {
    this.eno = eno;
  }

  public int getEducation() {
    return education;
  }

  public void setEducation(int education) {
    this.education = education;
  }

  public int getHit() {
    return hit;
  }

  public void setHit(int hit) {
    this.hit = hit;
  }

  public int getSalary() {
    return salary;
  }

  public void setSalary(int salary) {
    this.salary = salary;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getPersonal_history() {
    return personal_history;
  }

  public void setPersonal_history(String personal_history) {
    this.personal_history = personal_history;
  }

  public String getLoc() {
    return loc;
  }

  public void setLoc(String loc) {
    this.loc = loc;
  }

  public String getEmp_type() {
    return emp_type;
  }

  public void setEmp_type(String emp_type) {
    this.emp_type = emp_type;
  }

  public String getCid() {
    return cid;
  }

  public void setCid(String cid) {
    this.cid = cid;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String salary_str;
  public String loc;
  public String emp_type;
  public String cid;
  public String content;
}
