package com.sist.admin.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ServiceVO {

  private int id, ok;
  private String pid, title, content;
  private Date regdate;

}
