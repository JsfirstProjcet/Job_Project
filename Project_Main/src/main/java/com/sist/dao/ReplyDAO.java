package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommuneVO;
import com.sist.vo.ReplyVO;

public class ReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	/*
	 * <select id="replyListData" resultType="ReplyVO" parameterType="int"> SELECT
	 * rno,bno,id,nickname,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
	 * FROM community_reply WHERE rno=#{rno} ORDER BY bno DESC </select>
	 */

	public static List<ReplyVO> replyListData(int bno) {
		SqlSession session = null;
		List<ReplyVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("replyListData", bno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	/*
	 * <select id="replyCount" resultType="int" parameterType="ReplyVO"> SELECT
	 * COUNT(*) FROM community_reply WHERE bno=#{bno} </select>
	 * 
	 * <!-- 댓글 쓰기 --> <insert id="replyInsert" parameterType="ReplyVO"> INSERT INTO
	 * community_reply(rno,bno,id,nickname,msg,regdate,group_id,group_step,
	 * group_tap) VALUES( (SELECT NVL(MAX(rno)+1, 1) FROM community_reply),
	 * #{bno},#{id},#{nickname},#{msg},SYSDATE, (SELECT NVL(MAX(group_id)+1, 1) FROM
	 * community_reply),0,0) </insert>
	 */
	public static void replyInsert(ReplyVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("replyInsert", vo);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static int replyCount(int bno) {

		SqlSession session = null;
		int count = 0;
		try {
			session = ssf.openSession();
			count = session.selectOne("replyCount", bno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	/*
	 *
	 * <delete id="replyDelete" parameterType="int"> DELETE FROM community_reply
	 * WHERE rno=#{rno} </delete>
	 * 
	 * 
	 * <update id="replyUpdate" parameterType="ReplyVO"> UPDATE community_reply SET
	 * msg=#{msg} WHERE rno=#{rno} </update>
	 */

	public static void replyDelete(int rno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("replyDelete", rno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void replyUpdate(ReplyVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("replyUpdate", vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	/*
	 * 
	 * <!-- 댓글 등록시 commune테이블 reply+1 --> <update id="communeReplyCountIncrement"
	 * parameterType="int"> UPDATE community SET reply=reply+1 WHERE bno=#{bno}
	 * </update> <!-- 댓글 삭제시 commune테이블 reply-1 --> <update
	 * id="communeReplyCountDecrement" parameterType="int"> UPDATE community SET
	 * reply=reply-1 WHERE bno=#{bno} </update>
	 * 
	 */

	public static void communeReplyCountIncrement(int bno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("communeReplyCountIncrement", bno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void communeReplyCountDecrement(int bno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("communeReplyCountDecrement", bno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
/*
 * <select id="replyLikeCount" resultType="int" parameterType="int">
		SELECT like_count 
		FROM community_reply
		WHERE rno=#{rno}
	</select>
 */
	
	public static int replyLikeCount(int rno) {

		SqlSession session = null;
		int count = 0;
		try {
			session = ssf.openSession();
			count = session.selectOne("replyLikeCount", rno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
}
