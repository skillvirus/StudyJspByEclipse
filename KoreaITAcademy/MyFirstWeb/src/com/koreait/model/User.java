package com.koreait.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.koreait.database.DataPack;
import com.koreait.database.DatabaseAccessHelper;

public class User {
	private String userID;//ID
	private String userName; //이름
	private String userPhoneNum; //전화번호
	
	DatabaseAccessHelper dah = null;
	ArrayList<DataPack> dp = null;
	
	public User() {
		dah = new DatabaseAccessHelper();
		dp = new ArrayList<DataPack>();
	}
	
	public User(String userID, String userName, String userPhoneNum) {
		this.userID = userID;
		this.userName = userName;
		this.userPhoneNum = userPhoneNum;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserPhoneNum() {
		return userPhoneNum;
	}
	
	public void setUserPhoneNum(String userPhoneNum) {
		this.userPhoneNum = userPhoneNum;
	}
	
	/*
	 * 등록
	 */
	public void insertUserInfo(User userInfo) {
		
		String qry = "INSERT INTO UserInfo (UserID, UserName, UserPhoneNum) VALUES (?,?,?)";
		
		dp.add(new DataPack(1, userInfo.userID));
		dp.add(new DataPack(2, userInfo.userName));
		dp.add(new DataPack(3, userInfo.userPhoneNum));
		
		dah.executeNonQuery(qry, dp);
		
		dah.close();		
	}
	
	/*
	 * 수정
	 */
	public void updateUserInfo(User userInfo) { //수정
		Connection ct = null; //데이터베이스 연결객체
		PreparedStatement ps = null; //SQL문 저장 객체
		String qry; //SQL 쿼리문 저장 문자열
		
		try {
			qry = "UPDATE UserInfo SET UserName = ?, UserPhoneNum = ? WHERE UserID = ?";
			
			Class.forName("org.sqlite.JDBC");
			ct = DriverManager.getConnection("jdbc:sqlite:././Resources/Database/BookManagement.db");
			ps = ct.prepareStatement(qry);
			
			ps.setString(1, userInfo.userName);
			ps.setString(2, userInfo.userPhoneNum);
			ps.setString(3, userInfo.userID);
			
			ps.executeUpdate();
			
			ct.close();
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/*
	 * 삭제
	 */
	public void deleteUserInfo(User userInfo) {
		
		String qry = " DELETE"
				   + " FROM 	UserInfo"
				   + " WHERE	UserID = ?";
		
		dp.add(new DataPack(1, userInfo.userID));
		
		dah.executeNonQuery(qry, dp);
		
		dah.close();
	}
	
	/*
	 * 조회
	 */
	public ResultSet selectUserInfo(User userInfo) {

		String qry = " SELECT 	UserID," //사용자ID
				   + " 			UserName," //사용자성명
				   + "		 	UserPhoneNum" //사용자전화번호
				   + " FROM 	UserInfo" //사용자정보
				   + " WHERE 	UserID = CASE WHEN ? = '' THEN UserID ELSE ? END" //사용자ID
		           + "          AND UserName = CASE WHEN ? = '' THEN UserName ELSE ? END" //사용자성명
		           + "          AND UserPhoneNum = CASE WHEN ? = '' THEN UserPhoneNUm ELSE ? END" //사용자전화번호
				   + " ORDER BY UserID DESC";
		
		dp.add(new DataPack(1, userInfo.userID));
		dp.add(new DataPack(2, userInfo.userID));
		dp.add(new DataPack(3, userInfo.userName));
		dp.add(new DataPack(4, userInfo.userName));
		dp.add(new DataPack(5, userInfo.userPhoneNum));
		dp.add(new DataPack(6, userInfo.userPhoneNum));
		
		ResultSet rs = dah.executeQuery(qry, dp);
		
		return rs;
	}
	
	/*
	 * DB 연결 종료
	 */
	public void closeDatabase() {
		dah.close();
	}
}