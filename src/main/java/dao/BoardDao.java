package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {
	
	public int getCommentCntByBoardNo(int boardNo) {
		return DaoHelper.selectOne("boardDao.getCommentCntByBoardNo", rs -> {
			return rs.getInt("cnt");
		},boardNo);
	}
	
	public void updateBoard(Board board) {
		DaoHelper.update("boardDao.updateBoard", board.getTitle(),
												 board.getContent(),
												 board.getCommentCnt(),
												 board.getDeleted(),
												 board.getReadCnt(),
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
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setUpdateDate(rs.getDate("board_update_date"));
			board.setFilename(rs.getString("board_filename"));

			Customer customer = new Customer();
			customer.setCustId(rs.getString("cust_id"));
			customer.setCustName(rs.getString("cust_name"));
			
			board.setCustomer(customer);
			
			return board;
		}, boardNo);
	}
	
	public void deleteBoard(int boardNo) {
		DaoHelper.update("boardDao.deleteBoard", boardNo);
	}
	
	public List<Board> getBoards(String loginId, int begin, int end) {
		String query = "manager".equals(loginId) ? "boardDao.getAllBoards" : "boardDao.getActiveBoards";
		
		return DaoHelper.selectList(query, rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setDeleted(rs.getString("board_deleted"));
			
			
			Customer customer = new Customer();
			customer.setCustId(rs.getString("cust_id"));
			customer.setCustName(rs.getString("cust_name"));
			
			board.setCustomer(customer);
			
			return board;
		}, begin, end);
	}
	
	public void insertBoard(Board board) {
		DaoHelper.update("boardDao.insertBoard", board.getTitle(),
												 board.getContent(),
												 board.getCustomer().getCustId(),
												 board.getFilename());
	}
	
	public int getTotalRows () {
		return DaoHelper.selectOne("boardDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}

}
