package bow.board.model;

import java.util.Date;

public class BbsDTOnorm {

	private int board_idx;
	private String subject;
	private String content;
	private String writer;
	private int password;
	private Date writedate;
	private String datechar;
	
	private int list_idx;
	private int list_se_idx;
	private String list_idx_pointer;
	
	private int lev_me;
	private int lev_point;
	
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	private int news;

	protected BbsDTOnorm() {
		// TODO Auto-generated constructor stub
	}
    
	protected BbsDTOnorm(int board_idx, String subject, String content, String writer, int password, Date writedate,
			String datechar, int list_idx, int list_se_idx, String list_idx_pointer, int lev_me, int lev_point,
			int readnum, int ref, int lev, int sunbun, int news) {
		super();
		this.board_idx = board_idx;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.writedate = writedate;
		this.datechar = datechar;
		this.list_idx = list_idx;
		this.list_se_idx = list_se_idx;
		this.list_idx_pointer = list_idx_pointer;
		this.lev_me = lev_me;
		this.lev_point = lev_point;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.news = news;
	}




	protected BbsDTOnorm(int board_idx, String subject, String content, String writer, int password, Date writedate,
			String datechar, int list_idx, int list_se_idx, int readnum, int ref, int lev, int sunbun, int news) {
		super();
		this.board_idx = board_idx;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.writedate = writedate;
		this.datechar = datechar;
		this.list_idx = list_idx;
		this.list_se_idx = list_se_idx;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.news = news;
	}


	protected BbsDTOnorm(int board_idx, String subject, String content, String writer, int password, Date writedate,
			String datechar, int list_idx, int readnum, int ref, int lev, int sunbun, int news) {
		super();
		this.board_idx = board_idx;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.writedate = writedate;
		this.datechar = datechar;
		this.list_idx = list_idx;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.news = news;
	}


	protected BbsDTOnorm(int board_idx, String subject, String content, String writer, int password, Date writedate,
			String datechar, int readnum, int ref, int lev, int sunbun, int news) {
		super();
		this.board_idx = board_idx;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.writedate = writedate;
		this.datechar = datechar;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.news = news;
	}


	protected BbsDTOnorm(int board_idx, String subject, String content, String writer, int password, Date writedate,
			int readnum, int ref, int lev, int sunbun, int news) {
		super();
		this.board_idx = board_idx;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.news = news;
	}

   	
	
	public String getList_idx_pointer() {
		return list_idx_pointer;
	}



	public void setList_idx_pointer(String list_idx_pointer) {
		this.list_idx_pointer = list_idx_pointer;
	}

	public int getLev_me() {
		return lev_me;
	}


	public void setLev_me(int lev_me) {
		this.lev_me = lev_me;
	}


	public int getLev_point() {
		return lev_point;
	}


	public void setLev_point(int lev_point) {
		this.lev_point = lev_point;
	}


	public int getList_idx() {
		return list_idx;
	}


	public void setList_idx(int list_idx) {
		this.list_idx = list_idx;
	}


	public int getList_se_idx() {
		return list_se_idx;
	}


	public void setList_se_idx(int list_se_idx) {
		this.list_se_idx = list_se_idx;
	}

	public String getDatechar() {
		return datechar;
	}


	public void setDatechar(String datechar) {
		this.datechar = datechar;
	}


	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public int getNews() {
		return news;
	}

	public void setNews(int news) {
		this.news = news;
	}

}
