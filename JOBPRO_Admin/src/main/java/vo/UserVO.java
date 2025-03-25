package vo;

import java.util.Date;

/*
  id	VARCHAR2(10 BYTE)		NOT NULL,
	pw	VARCHAR2(10 BYTE)		NOT NULL,
	email 	VARCHAR2(30 BYTE)		NOT NULL,
	 name 	VARCHAR2(51 BYTE)		NOT NULL,
	 sex 	VARCHAR2(8 BYTE)		NULL,
	 birth 	DATE		NULL,
	 phone 	VARCHAR2(20 BYTE)		NULL,
	 findJob 	VARCHAR2(100 BYTE)		NULL,
	 addr1 	VARCHAR2(200 BYTE)		NULL,
	 addr2 	VARCHAR2(200 BYTE)		NULL,
	 desired_occupation 	VARCHAR2(100 BYTE)		NULL,
	 expected_salary 	VARCHAR2(100 BYTE)		NULL,
	 poster 	VARCHAR2(200 BYTE)		NULL,
	 nickname 	VARCHAR2(60 BYTE)		NULL,
	 isadmin 	NUMBER	DEFAULT 0	NOT NULL
 */
public class UserVO {

  private String id, pw, email, name, sex, phone, findJob, addr1, addr2, desired_occupation, expected_salary, poster, nickname;

  public Date getBirth() {
    return birth;
  }

  public void setBirth(Date birth) {
    this.birth = birth;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getFindJob() {
    return findJob;
  }

  public void setFindJob(String findJob) {
    this.findJob = findJob;
  }

  public String getAddr1() {
    return addr1;
  }

  public void setAddr1(String addr1) {
    this.addr1 = addr1;
  }

  public String getAddr2() {
    return addr2;
  }

  public void setAddr2(String addr2) {
    this.addr2 = addr2;
  }

  public String getDesired_occupation() {
    return desired_occupation;
  }

  public void setDesired_occupation(String desired_occupation) {
    this.desired_occupation = desired_occupation;
  }

  public String getExpected_salary() {
    return expected_salary;
  }

  public void setExpected_salary(String expected_salary) {
    this.expected_salary = expected_salary;
  }

  public String getPoster() {
    return poster;
  }

  public void setPoster(String poster) {
    this.poster = poster;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public int getIsadmin() {
    return isadmin;
  }

  public void setIsadmin(int isadmin) {
    this.isadmin = isadmin;
  }

  private Date birth;
  private int isadmin;
}
