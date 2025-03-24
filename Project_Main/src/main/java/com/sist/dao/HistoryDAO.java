package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;

public class HistoryDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<HistoryVO> comHistoryList(String cid)
	{
		SqlSession session=ssf.openSession();
		List<HistoryVO> list=session.selectList("comHistoryList",cid);
		session.close();
		return list;
	}
	public static List<HistoryVO> comHistoryYMList(String cid)
	{
		SqlSession session=ssf.openSession();
		List<HistoryVO> list=new ArrayList<HistoryVO>();
		try {
			
			list=session.selectList("comHistoryYMList",cid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}
	public static int historyStep(HistoryVO vo)
	{
		SqlSession session=ssf.openSession();
		int step=session.selectOne("historyStep",vo);
		session.close();
		return step;
	}
	public static void insertHistory(HistoryVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("insertHistory",vo);
		session.close();
	}
	public static void deleteHistory(HistoryVO vo) {
		SqlSession session=ssf.openSession();
		try {
			session.delete("deleteHistory",vo);
			session.update("updateDelStep",vo);
			session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
	}
	public static HistoryVO historyDetail(int hno) {
		SqlSession session=ssf.openSession();
		HistoryVO vo=session.selectOne("historyDetail",hno);
		session.close();
		return vo;
	}
	public static void upHistory(HistoryVO vo) {
		SqlSession session=ssf.openSession();
		try {
			int prev=session.selectOne("historyHnoOfPrevStep",vo);
			vo.setStep(vo.getStep()-1);
			session.update("updateHStep",vo);
			vo.setStep(vo.getStep()+1);
			vo.setHno(prev);
			session.update("updateHStep",vo);
			session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
	}
	public static void downHistory(HistoryVO vo) {
		SqlSession session=ssf.openSession();
		try {
			int next=session.selectOne("historyHnoOfNextStep",vo);
			vo.setStep(vo.getStep()+1);
			session.update("updateHStep",vo);
			vo.setStep(vo.getStep()-1);
			vo.setHno(next);
			session.update("updateHStep",vo);
			session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
	}
	public static void updateHContent(HistoryVO vo) {
		SqlSession session=ssf.openSession(true);
		session.update("updateHContent",vo);
		session.close();
	}
	
}
