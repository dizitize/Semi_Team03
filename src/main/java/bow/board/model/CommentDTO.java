package bow.board.model;

import java.sql.Date;

public class CommentDTO {


	private int comment_board_idx;
	private int board_idx;
	private String content;
	private String writer;
	private Date writedate;
	private int password;
	private int list_idx;
	
	public CommentDTO() {
		
	}
	
	protected CommentDTO(int comment_board_idx, int board_idx, String content, String writer, Date writedate,
			int password, int list_idx) {
		super();
		this.comment_board_idx = comment_board_idx;
		this.board_idx = board_idx;
		this.content = content;
		this.writer = writer;
		this.writedate = writedate;
		this.password = password;
		this.list_idx = list_idx;
	}

	public CommentDTO(int comment_board_idx, int board_idx, String content, String writer, Date writedate,
			int password) {
		super();
		this.comment_board_idx = comment_board_idx;
		this.board_idx = board_idx;
		this.content = content;
		this.writer = writer;
		this.writedate = writedate;
		this.password = password;
	}

	public int getList_idx() {
		return list_idx;
	}

	public void setList_idx(int list_idx) {
		this.list_idx = list_idx;
	}

	public int getComment_board_idx() {
		return comment_board_idx;
	}

	public void setComment_board_idx(int comment_board_idx) {
		this.comment_board_idx = comment_board_idx;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

}
