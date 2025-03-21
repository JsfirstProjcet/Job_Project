package com.sist.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;

import jakarta.servlet.http.HttpServletRequest;
import com.sist.vo.*;
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
	
	/*
		<insert id="communeInsert" parameterType="CommuneVO" >
			INSERT INTO community(bno,subject,content,regdate) 
			VALUES(pn_no_seq.nextval,#{subject},#{content},#{regdate})
		</insert>
	 */
	public static void communeInsert(CommuneVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("communeInsert",vo);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	/*
	 * <select id="communeDetailData" resultType="CommuneVO" parameterType="int">
		SELECT bno, subject, content, regdate, hashtag, id, nickname,hit,type,reply,likes
		FROM community
		WHERE bno=#{bno}
	</select>
	 */
	public static CommuneVO communeDetailData(int bno) {
		SqlSession session=null;
		CommuneVO vo=null;
		try {
			session=ssf.openSession();
			session.update("communeHitIncrement",bno);
			vo=session.selectOne("communeDetailData",bno);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	/*
	 * <update id="communeUpdate" parameterType="CommuneVO">
	 	UPDATE community SET
		subject=#{subject},content=#{content}
		WHERE bno=#{bno}
	</update>	
	
	<delete id="communeDelete" parameterType="int">
	  DELETE FROM community
	  WHERE bno=#{bno}
	</delete>
	 */	
	
	// 조회수 안늘어나는거 
	public static CommuneVO CommuneUpdateData(int bno)
		{
		SqlSession session=null;
		CommuneVO vo=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("communeDetailData",bno);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
		}
	 
	
	public static void communeUpdate(CommuneVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("communeUpdate",vo);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	public static void communeDelete(int bno) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.delete("communeDelete",bno);
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 * 	<!-- 조회수 높은거 상단에 -->
		<select id="communeTop4" resultType="CommuneVO">
	    SELECT bno, subject, nickname, hit
	    FROM community
	    ORDER BY hit DESC
	    LIMIT 4
		</select>
	 */
	
	public static List<CommuneVO> communeTop4() {
		SqlSession session=null;
		List<CommuneVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("communeTop4");
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
	 * <select id="communePoster" resultType="CommuneVO">
		SELECT id,poster
		FROM personal
		WHERE id=#{id}
		</select>
	 */
	public static CommuneVO communePoster(String string)
	{
	SqlSession session=null;
	CommuneVO vo=null;
	try {
		session=ssf.openSession();
		vo=session.selectOne("communePoster",string);
		session.commit();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		if(session!=null)
			session.close();
	}
	return vo;
	}
	
/*
 * 	<!-- 아이디 세션으로 포스터 가져오기 -->
	<select id="communePoster1" resultType="string" parameterType="string">
		SELECT poster
		FROM personal
		WHERE id=#{id}
	</select>
 */
	
	public static String communePoster1(String string)
	{
	SqlSession session=null;
	String poster=null;
	try {
		session=ssf.openSession();
		poster=session.selectOne("communePoster1",string);
		session.commit();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		if(session!=null)
			session.close();
	}
	return poster;
	}
	
}
