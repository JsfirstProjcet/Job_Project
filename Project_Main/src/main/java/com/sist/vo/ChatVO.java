package com.sist.vo;

import jakarta.websocket.Session;

import lombok.Data;

@Data
public class ChatVO {
   private String id;
   private String name,poster;
   private Session session;
}