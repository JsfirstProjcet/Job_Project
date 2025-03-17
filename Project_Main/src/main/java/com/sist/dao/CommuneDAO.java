package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommuneVO;

import jakarta.servlet.http.HttpServletRequest;

public class CommuneDAO {
	private static SqlSessionFactory ssf;
	static {
		
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 
	 * <select id="communeListData" resultType="CommuneVO" parameterType="hashmap">
	   </select>
	 */
	
	public static List<CommuneVO> communeListData(Map map){
		SqlSession session=null;
		List<CommuneVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("communeListData",map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
		
				
	}
	/*
	 * <select id="communeTotalPage" resultType="int">
		SELECT CEIL (COUNT(*)/10.0) FROM COMMUNITY
	</select>
	 */
	
	public static int communeTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("communeTotalPage");
		session.close();
		return total;
	}
}
