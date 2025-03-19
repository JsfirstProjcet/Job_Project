package vo;

import java.util.Date;
import lombok.Data;

/*
  "rno"	NUMBER		NOT NULL,
	"bno"	NUMBER		NOT NULL,
	"msg"	CLOB		NOT NULL,
	"regdate"	DATE	DEFAULT SYSDATE	NULL,
	"group_id"	NUMBER		NULL,
	"group_step"	NUMBER	DEFAULT 0	NULL,
	"group_tap"	NUMBER	DEFAULT 0	NULL,
	"id"	VARCHAR2(10 BYTE)		NOT NULL,
	"nickname"	VARCHAR2(60 BYTE)		NULL
 */
@Data
public class ReplyVO {

  private int rno, bno, group_id, group_step, group_tap;
  private String id, nickname, msg;
  private Date regdate;

}
