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
	
	public void insertUserInfo(User userInfo) { //등록
		DatabaseAccessHelper dah = new DatabaseAccessHelper();
		ArrayList<DataPack> dp = new ArrayList<DataPack>();
		
		String qry = "INSERT INTO UserInfo (UserID, UserName, UserPhoneNum) VALUES (?,?,?)";
		
		dp.add(new DataPack(1, userInfo.userID));
		dp.add(new DataPack(2, userInfo.userName));
		dp.add(new DataPack(3, userInfo.userPhoneNum));
		
		dah.executeNonQuery(qry, dp);
		
		dah.close();		
	}
	
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
	
	public void deleteUserInfo(User userInfo) { //삭제
		DatabaseAccessHelper dah = new DatabaseAccessHelper();
		ArrayList<DataPack> dp = new ArrayList<DataPack>();
		
		String qry = " DELETE"
				   + " FROM 	UserInfo"
				   + " WHERE	UserID = ?";
		
		dp.add(new DataPack(1, userInfo.userID));
		
		dah.executeNonQuery(qry, dp);
		
		dah.close();
	}
	
	public ResultSet selectUserInfo(User userInfo) { //조회
		DatabaseAccessHelper dah = new DatabaseAccessHelper();
		ArrayList<DataPack> dp = new ArrayList<DataPack>();
		
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
		//dah.close();
		
		return rs;
	}
}