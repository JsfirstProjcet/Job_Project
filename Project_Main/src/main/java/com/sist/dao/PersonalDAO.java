package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class PersonalDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static int personalIdcheck(String email)
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("personalIdcheck",email);
		session.close();
		return count;
	}
	public static void personalInsert(PersonalVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("personalInsert",vo);
		session.close();
	}
	public static PersonalVO personalLogin(String email,String pwd)
	{
		PersonalVO vo=new PersonalVO();
		SqlSession session=ssf.openSession();
		int count=session.selectOne("personalIdCheckCount",email);
		if(count==0)
		{
			vo.setMsg("NOID");
		}
		else
		{
			vo=session.selectOne("personalGetPassword",email);
			if(pwd.equals(vo.getPw()))
			{
				vo.setMsg("OK");
			}
			else
			{
				vo.setMsg("NOPWD");
			}
		}
		
		session.close();
		return vo;
	}
}
