package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {
	
	public Board getBoardDetail(int boardNo) {
		return DaoHelper.selectOne("boardDao.getBoardDetail", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
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
