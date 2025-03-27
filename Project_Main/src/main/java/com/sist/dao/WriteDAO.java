package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;

public class WriteDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   public static List<WriteVO> writeListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<WriteVO> list=session.selectList("writeListData",map);
	   session.close();
	   return list;
   }
   public static int writeTotalPage() {
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("writeTotalPage");
	   session.close();
	   return count;
   }
   public static WriteVO getWriteData(int sno) {
	    SqlSession session = ssf.openSession();
	    WriteVO vo = session.selectOne("getWriteData", sno);
	    session.close();
	    return vo;
	}
   public static WriteVO writeDetailData(int sno)
   {
       SqlSession session = ssf.openSession();
       WriteVO vo = session.selectOne("writeDetailData", sno);
       session.close();
       return vo;
   }
   public static WriteVO writeUpdateData(int sno)
   {
 	  SqlSession session=ssf.openSession();
 	  WriteVO vo=session.selectOne("writeDetailData",sno);
 	  session.close();
 	  return vo;
   }
   public static void writeUpdate(WriteVO vo)
   {
 	  SqlSession session=ssf.openSession(true);
 	  try {
 	  session.update("writeUpdate",vo);//insert/update/delete
 	  // ps.executeUpdate()
 	  }catch(Exception ex) {
 		  ex.printStackTrace();
 	  }
 	  session.close();
   }
   public static String writeGetPassword(int sno)
   {
 	  SqlSession session=ssf.openSession();
 	  String pwd=session.selectOne("writeGetPassword",sno);
 	  session.close();
 	  return pwd;
   }
   
   public static void writeDelete(int sno)
   {
 	  SqlSession session=ssf.openSession(true);
 	  session.delete("writeDelete",sno);//insert/update/delete
 	  // ps.executeUpdate()
 	  session.close();
   }

}




