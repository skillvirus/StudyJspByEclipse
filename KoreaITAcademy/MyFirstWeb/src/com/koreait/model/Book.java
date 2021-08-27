package com.koreait.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.koreait.database.DataPack;
import com.koreait.database.DatabaseAccessHelper;

public class Book {
	private int bookRowNum;
	private String bookID;//ID
	private String bookTitle; //제목
	private String bookISBN; //ISBN
	private int bookPageNum; //List 페이지 번호

	DatabaseAccessHelper dah = null;
	ArrayList<DataPack> dp = null;
	
	public Book() {
		dah = new DatabaseAccessHelper();
		dp = new ArrayList<DataPack>();
	}
	
	public Book(String bookID, String bookTitle, String bookISBN) {
		this.bookID = bookID;
		this.bookTitle = bookTitle;
		this.bookISBN = bookISBN;
	}
	
	public Book(int bookRowNum, String bookID, String bookTitle, String bookISBN) {
		this.bookRowNum = bookRowNum;
		this.bookID = bookID;
		this.bookTitle = bookTitle;
		this.bookISBN = bookISBN;
	}
	
	public int getBookRowNum() {
		return bookRowNum;
	}

	public void setBookRowNum(int bookRowNum) {
		this.bookRowNum = bookRowNum;
	}
	
	public String getBookID() {
		return bookID;
	}
	
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	
	public String getBookTitle() {
		return bookTitle;
	}
	
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	
	public String getBookISBN() {
		return bookISBN;
	}
	
	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}
	
	public Integer getBookPageNum() {
		return bookPageNum;
	}

	public void setBookPageNum(int bookPageNum) {
		this.bookPageNum = bookPageNum;
	}
	
	/*
	 * 등록
	 */
	public void insertBookInfo(Book bookInfo) {
		
		String qry = "INSERT INTO BookInfo (BookID, BookTitle, BookISBN) VALUES (?,?,?)";
		
		dp.add(new DataPack(1, bookInfo.bookID));
		dp.add(new DataPack(2, bookInfo.bookTitle));
		dp.add(new DataPack(3, bookInfo.bookISBN));
		
		dah.executeNonQuery(qry, dp);
	}
	
	/*
	 * 수정
	 */
	public void updateBookInfo(Book bookInfo) {
		
		String qry = " UPDATE 	BookInfo"
				   + " SET		BookTitle = ?,"
				   + "			BookISBN = ?"
				   + " WHERE 	BookID = ?";
		
		dp.add(new DataPack(1, bookInfo.bookTitle));
		dp.add(new DataPack(2, bookInfo.bookISBN));
		dp.add(new DataPack(3, bookInfo.bookID));
		
		dah.executeNonQuery(qry, dp);
	}
	
	/*
	 * 삭제
	 */
	public void deleteBookInfo(Book bookInfo) {
		
		String qry = " DELETE"
				   + " FROM 	BookInfo"
				   + " WHERE	BookID = ?";
		
		dp.add(new DataPack(1, bookInfo.bookID));
		
		dah.executeNonQuery(qry, dp);
	}
	
	/*
	 * 조회
	 */
	public ResultSet selectBookInfo(Book bookInfo) {

		String qry = " SELECT 	ROW_NUMBER() OVER () AS [BookRowNum],"
				   + "			BookID," //도서ID
				   + " 			BookTitle," //도서제목
				   + "		 	BookISBN" //도서ISBN
				   + " FROM 	BookInfo" //도서정보
				   + " WHERE 	BookID = CASE WHEN ? = '' THEN BookID ELSE ? END" //도서ID
				   + "          AND BookTitle LIKE ?" //도서제목
				   + "          AND BookISBN LIKE ?" //도서ISBN
				   + " ORDER BY	ROW_NUMBER() OVER () DESC"
				   + " LIMIT 	10 OFFSET ?";
		
		dp.add(new DataPack(1, bookInfo.bookID));
		dp.add(new DataPack(2, bookInfo.bookID));
		dp.add(new DataPack(3, bookInfo.bookTitle));
		dp.add(new DataPack(4, bookInfo.bookISBN));
		dp.add(new DataPack(5, bookInfo.bookPageNum));

		ResultSet rs = dah.executeQuery(qry, dp);

		return rs;
	}
	
	/*
	 * 조회(조회조건에 맞는 전체 Record 수)
	 */
	public int selectBookInfoCount(Book bookInfo) {

		String qry = " SELECT 	COUNT(*) COUNT" //도서ID
				   + " FROM 	BookInfo" //도서정보
				   + " WHERE 	BookID = CASE WHEN ? = '' THEN BookID ELSE ? END" //도서ID
		           + "          AND BookTitle LIKE ?" //도서제목
		           + "          AND BookISBN LIKE ?"; //도서ISBN
				   
		dp.add(new DataPack(1, bookInfo.bookID));
		dp.add(new DataPack(2, bookInfo.bookID));
		dp.add(new DataPack(3, bookInfo.bookTitle));
		dp.add(new DataPack(4, bookInfo.bookISBN));
		
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