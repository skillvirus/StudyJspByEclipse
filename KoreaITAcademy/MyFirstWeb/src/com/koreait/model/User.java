package com.koreait.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.koreait.database.DataPack;
import com.koreait.database.DatabaseAccessHelper;

public class User {
	private Integer userRowNum;
	private String userID;//ID
	private String userName; //이름
	private String userPhoneNum; //전화번호
	private Integer userPageNum; //List 페이지 번호

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
	
	public User(Integer uerRowNum, String userID, String userName, String userPhoneNum) {
		this.userRowNum = uerRowNum;
		this.userID = userID;
		this.userName = userName;
		this.userPhoneNum = userPhoneNum;
	}
	
	public Integer getUserRowNum() {
		return userRowNum;
	}

	public void setUserRowNum(Integer userRowNum) {
		this.userRowNum = userRowNum;
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
	
	public Integer getUserPageNum() {
		return userPageNum;
	}

	public void setUserPageNum(Integer userPageNum) {
		this.userPageNum = userPageNum;
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
	}
	
	/*
	 * 수정
	 */
	public void updateUserInfo(User userInfo) {
		
		String qry = " UPDATE 	UserInfo"
				   + " SET		UserName = ?,"
				   + "			UserPhoneNum = ?"
				   + " WHERE 	UserID = ?";
		
		dp.add(new DataPack(1, userInfo.userName));
		dp.add(new DataPack(2, userInfo.userPhoneNum));
		dp.add(new DataPack(3, userInfo.userID));
		
		dah.executeNonQuery(qry, dp);
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
		           + "          AND UserName LIKE ?" //사용자성명
		           + "          AND UserPhoneNum LIKE ?" //사용자전화번호
				   + " ORDER BY UserID DESC"
				   + " LIMIT 	10 OFFSET ?";
		
		dp.add(new DataPack(1, userInfo.userID));
		dp.add(new DataPack(2, userInfo.userID));
		dp.add(new DataPack(3, userInfo.userName));
		dp.add(new DataPack(4, userInfo.userPhoneNum));
		dp.add(new DataPack(5, userInfo.userPageNum));
		
		ResultSet rs = dah.executeQuery(qry, dp);
		
		return rs;
	}
	
	/*
	 * 조회(조회조건에 맞는 전체 Record 수)
	 */
	public int selectUserInfoCount(User userInfo) {

		String qry = " SELECT 	COUNT(*) COUNT" //사용자ID
				   + " FROM 	UserInfo" //사용자정보
				   + " WHERE 	UserID = CASE WHEN ? = '' THEN UserID ELSE ? END" //사용자ID
		           + "          AND UserName LIKE ?" //사용자성명
		           + "          AND UserPhoneNum LIKE ?"; //사용자전화번호
				   
		dp.add(new DataPack(1, userInfo.userID));
		dp.add(new DataPack(2, userInfo.userID));
		dp.add(new DataPack(3, userInfo.userName));
		dp.add(new DataPack(4, userInfo.userPhoneNum));
		
//		String qry = " SELECT 	COUNT(*) COUNT" //사용자ID
//				   + " FROM 	UserInfo" //사용자정보
//				   + " WHERE 	UserID = CASE WHEN "+ userInfo.userID +" = '' THEN UserID ELSE "+ userInfo.userID+" END" //사용자ID
//		           + "          AND UserName LIKE '" +userInfo.userName + "'"//사용자성명
//		           + "          AND UserPhoneNum LIKE '" +userInfo.userPhoneNum + "'"; //사용자전화번호
		
		
		ResultSet rs = dah.executeQuery(qry, dp);
		
		int returnValue = 0;
		
		try {
			if (rs.next()) {
				returnValue = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return returnValue;
	}
	
	/*
	 * Database 연결 종료
	 */
	public void closeDatabase() {
		if (dah != null) {
			dah.close();
		}
	}
}