package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.*;
import com.sist.commons.*;
import java.util.*;
public class InterviewDAO {
	private static SqlSessionFactory ssf;
	static {
		
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	
	public static List<InterviewVO> interviewListData(Map map){
		SqlSession session=null;
		List<InterviewVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("interviewListData",map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static int interviewTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("interviewTotalPage");
		session.close();
		return total;
	}
	
	/*
	 * 	
	<select id="interviewDetailData" resultType="InterviewVO" parameterType="int">
		  SELECT * FROM INTERVIEW
		  WHERE ino=#{ino}
		</select>
		
		<update id="interviewHitIncrement" parameterType="int">
		UPDATE interview SET
		hit=hit+1
		WHERE ino=#{ino}
	</update>
	
	 */
	
	public static InterviewVO interviewDetailData(int ino) {
		SqlSession session=ssf.openSession(true);
		InterviewVO vo=null;
		try {
		
		session.update("interviewHitIncrement",ino);
		vo=session.selectOne("interviewDetailData",ino);
		session.close();
		
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	// <select id="interviewFindData" resultType="InterviewVO" parameterType="int">
	
	public static List<InterviewVO> interviewFindData(int type) {
		
		SqlSession session=ssf.openSession(true);
		List<InterviewVO> list=null;
		try {
		list=session.selectList("interviewFindData",type);
		session.close();
		
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
	 * <select id="categoryCount">
		SELECT COUNT(*) 
		FROM interview_type
		WHERE jno=#{jno}
		</select>
	 */
	public static int categoryCount(int jno) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("categoryCount",jno);
		session.close();
		return count;
		
	}
	/*
	 * 
	 * <select id="interviewAll" resultType="InterviewVO">
	    SELECT ino, title, sub_title, company, department, name,
	           TO_CHAR(idate, 'YY-MM-DD') AS idate, hit, poster
	    FROM INTERVIEW
	    ORDER BY ino ASC
	 */
	public static List<InterviewVO> interviewAll() {
	    SqlSession session = ssf.openSession();
	    List<InterviewVO> list = session.selectList("interviewAll");
	    session.close();
	    return list;
	}
	
	/*
	 * 
	 * <select id="interviewSearch" resultType="interviewVO" parameterType="string">
		SELECT ino,title,company,department,name
		FROM INTERVIEW
		WHERE title LIKE '%' || #{search} || '%'
		OR name LIKE '%' || #{search} || '%'
		OR company LIKE '%' || #{search} || '%'
		OR department LIKE '%' || #{search} || '%'
		</select>
	 */
	
	public static List<InterviewVO> interviewSearch(String search){
		
		SqlSession session=null;
		List<InterviewVO> list=null;
		try {
			 session=ssf.openSession();
			 list=session.selectList("interviewSearch",search);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
