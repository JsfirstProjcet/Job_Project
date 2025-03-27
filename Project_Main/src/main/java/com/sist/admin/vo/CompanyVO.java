package com.sist.admin.vo;

import lombok.Data;

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
@Data
public class CompanyVO {

  private String cid;
  private String pw;
  private String email;
  private String cname;

  private String name;
  private String phone;
  private String brnumber;
  private String access_key;
  private int state;

}
