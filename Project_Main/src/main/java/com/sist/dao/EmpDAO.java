package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class EmpDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	//////////////////////////////////////// 사용자
	
	
	
	
	//////////////////////////////////////// 기업
	public static List<EmpVO> empComListData(Map map) {
		SqlSession session = null;
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			session = ssf.openSession();
			list = session.selectList("empComListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public static int empComCount(Map map) {
		SqlSession session = ssf.openSession();
		int count = session.selectOne("empComCount", map);
		session.close();
		return count;
	}
}
