package com.sist.vo;

import lombok.Data;

/*
HNO     NOT NULL NUMBER         
YEAR    NOT NULL NUMBER         
MONTH   NOT NULL NUMBER         
CONTENT NOT NULL VARCHAR2(2000) 
STEP    NOT NULL NUMBER         
CID     NOT NULL VARCHAR2(10)  
 */
@Data
public class HistoryVO {
	private int hno,year,month,step,count;
	private String content,cid;
}
