package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {

	public void updateBoard(Board board) {
		DaoHelper.update("boardDao.updateBoard", board.getTitle(),
												 board.getContent(),
												 board.getDeleted(),
												 board.getNo());
	}
	
	public Board getBoardByNo(int boardNo) {
		return DaoHelper.selectOne("boardDao.getBoardByNo", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setContent(rs.getString("board_content"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setUpdateDate(rs.getDate("board_update_date"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setCustomer(new Customer(rs.getString("cust_id")));
			
			return board;
		}, boardNo);
	}
	
	public void deleteBoard(int boardNo) {
		DaoHelper.update("boardDao.deleteBoard", boardNo);
	}
	public Board getBoardDetailByNo(int boardNo) {
		return DaoHelper.selectOne("boardDao.getBoardDetailByNo", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setContent(rs.getString("board_content"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setUpdateDate(rs.getDate("board_update_date"));
			
			Customer customer = new Customer();
			customer.setCustName(rs.getString("cust_name"));
			
			board.setCustomer(customer);
			
			return board;
		}, boardNo);
	}
	
	public List<Board> getBoards() {
		return DaoHelper.selectList("boardDao.getBoards", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setDeleted(rs.getString("board_deleted"));
			
			Customer customer = new Customer();
			customer.setCustName(rs.getString("cust_name"));
			
			board.setCustomer(customer);
			
			return board;
		});
	}
	
	public void insertBoard(Board board) {
		DaoHelper.update("boardDao.insertBoard", board.getTitle(),
												 board.getContent(),
												 board.getCustomer().getCustId());
	}
	


}
