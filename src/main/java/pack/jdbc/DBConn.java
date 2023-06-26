package pack.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pack.member.MemberBean;

public class DBConn {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rS = null;
	PreparedStatement pStmt = null;

	public DBConn() {   // DB 접속완료
		try {
			DBConnectionMgr pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			System.out.println("DB Access OK!!");

		} catch (Exception e) {
			System.out.println("exception : " + e.getMessage());
		}
	}

	///////////////////////////////////////////////////////////////////////////////
	///////////////////// ↓↓↓ 관련 작업 시작 ↓↓↓ /////////////////////
	//////////////////////////////////////////////////////////////////////////////

	// 회원가입 시작
	public int memInsert(MemberBean bean) {
//		System.out.println("JSP 에서 메서드를 실행했음!!");
//		System.out.println("DTO에 저장된 uid : " + bean.getUid());
//		System.out.println("DTO에 저장된 upw : " + bean.getUpw());
//		System.out.println("DTO에 저장된 uemail : " + bean.getUemail());
		// 전달받아서 DTO에 저장된 데이터를 게터로 호출하여
		// insert 구문으로 DB 에 저장
		
		int rtnCnt = 0;
		String sql = "insert into memberList (uid, upw, uemail) ";
		sql += "values (?, ?, ?)";
		try {
			pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, bean.getUid());
			pStmt.setString(2, bean.getUpw());
			pStmt.setString(3, bean.getUemail());
			rtnCnt = pStmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return rtnCnt;
	}
	// 회원가입 끝

	// 로그인 시작
	public boolean memLogin(String uid, String upw) {
		boolean accountChk = false;
		
		try {
			stmt = conn.createStatement();
			String sql = "select count(*) from memberList ";
			sql += "where uid='"+ uid + "' and upw='" + upw + "'";
			rS = stmt.executeQuery(sql);
			if (rS.next()) {
				//System.out.println("count(*) : " + rS.getInt(1));
				if(rS.getInt(1) == 1) accountChk = true;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return accountChk;
	}
	// 로그인 끝
	
	
	// 회원 정보 수정용 데이터 반환
	public MemberBean memModifyRead(String uid) {
		
		MemberBean bean = new MemberBean();
		
		try {
			String sql = "select uemail from memberList where uid=?";
			pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, uid);
			rS = pStmt.executeQuery();
			
			if (rS.next()) {
				bean.setUemail(rS.getString("uemail"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return bean;
	}
	
	public boolean memModify(MemberBean bean) {
		
		int rtnCnt = 0;
		boolean chkToF = false;
		try {
			
			String sql = "update memberList set upw=?, uemail=? where uid=?";
			pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, bean.getUpw());
			pStmt.setString(2, bean.getUemail());
			pStmt.setString(3, bean.getUid());
			rtnCnt = pStmt.executeUpdate();
			
			if(rtnCnt == 1) chkToF = true;
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return chkToF;
	}
	
	
	
	
	// 회원 탈퇴 시작
	public boolean memWithdraw(String uid) {
		String sql = "delete from memberList where uid=?";
		int rtnCnt = 0;
		boolean chkToF = false;
		try {
			pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, uid);
			rtnCnt = pStmt.executeUpdate();
			
			if (rtnCnt == 1) chkToF = true;
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return chkToF;
	}
	// 회원 탈퇴 끝
}
