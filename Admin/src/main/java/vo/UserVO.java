package vo;

import java.util.Date;
import lombok.Data;

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
@Data
public class UserVO {

  private String id, pw, email, name, sex, phone, findJob, addr1, addr2, desired_occupation, expected_salary, poster, nickname;
  private Date birth;
  private int isadmin;
}
