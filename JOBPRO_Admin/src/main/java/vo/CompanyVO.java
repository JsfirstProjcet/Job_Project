package vo;

/*
  "cid"	VARCHAR2(10 BYTE)		NOT NULL,
	"pw"	VARCHAR2(10 BYTE)		NOT NULL,
	"email"	VARCHAR2(30 BYTE)		NOT NULL,
	"cname"	VARCHAR2(100 BYTE)		NOT NULL,
	"name"	VARCHAR2(51 BYTE)		NOT NULL,
	"phone"	VARCHAR2(20 BYTE)		NOT NULL,
	"brnumber"	VARCHAR2(20 BYTE)		NOT NULL,
	"state"	NUMBER	DEFAULT 0	NULL,
	"access-key"	VARCHAR2(100 BYTE)		NULL
 */
public class CompanyVO {

  private String cid;
  private String pw;
  private String email;
  private String cname;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getCid() {
    return cid;
  }

  public void setCid(String cid) {
    this.cid = cid;
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

  public String getCname() {
    return cname;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getBrnumber() {
    return brnumber;
  }

  public void setBrnumber(String brnumber) {
    this.brnumber = brnumber;
  }

  public String getAccess_key() {
    return access_key;
  }

  public void setAccess_key(String access_key) {
    this.access_key = access_key;
  }

  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
  }

  private String name;
  private String phone;
  private String brnumber;
  private String access_key;
  private int state;

}
