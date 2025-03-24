package com.sist.vo;

/*
RNO        NOT NULL NUMBER       
BNO        NOT NULL NUMBER       
MSG        NOT NULL CLOB         
REGDATE             DATE         
GROUP_ID            NUMBER       
GROUP_STEP          NUMBER       
GROUP_TAP           NUMBER       
ID         NOT NULL VARCHAR2(10) 
NICKNAME            VARCHAR2(60)
 */
import java.util.*;

import lombok.Data;

@Data
public class ReplyVO {
	private int rno,bno,group_id,group_step,group_tab;
	private String id,nickname,msg,dbday,poster;
	private Date regdate;
	
}
