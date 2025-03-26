package com.sist.vo;

import lombok.Data;


@Data
public class JjimVO {
	private int no,bno,rno;
	private String id,type;
	private CommuneVO cvo=new CommuneVO();
	
	
}
