package shopdb;

import java.sql.*; 
import java.util.ArrayList; 

public class ControlDAO {


	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String JDBC_URL = 
			"jdbc:mysql://localhost:3306/shopdb?useUnicode=true&characterEncoding=euckr";
	private static final String USER = "root";
	private static final String PASSWD = "1234";


	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;


	public ControlDAO() {

		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}


	public void connect() {
		try {

			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void disconnect() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	////////////////////////////////////////////////////////////////////////////////
	
	/*                             book table                                     */
	
	///////////////////////////////////////////////////////////////////////////////
	


	public BookEntity getBook(String isbn) {	
		connect();
		String SQL = "select * from book  where isbn = ?";
		BookEntity book = new BookEntity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();			
			rs.next();
			book.setIsbn( rs.getString("isbn") );
			book.setTitle( rs.getString("title") );
			book.setAuthor( rs.getString("author") );
			book.setPublisher( rs.getString("publisher") );
			book.setPrice( rs.getInt("price") );
			book.setCategory( rs.getString("category"));
			book.setRemaining(rs.getInt("remaining"));
			book.setRegdate(rs.getDate("regdate"));
			book.setImg(rs.getString("img"));
			book.setDescription(rs.getString("description"));
					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return book;
	}
	
	
	public ArrayList<BookEntity> getBookList(String CATEGORY, int startRecord, int pageRecordNo) {	
		connect();
		ArrayList<BookEntity> list = new ArrayList<BookEntity>();
		
		String sql = "select * from book where category = ? order by regdate desc limit ? , ? " ;
				  
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  CATEGORY);
			pstmt.setInt(2,  startRecord);
			pstmt.setInt(3, pageRecordNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BookEntity book = new BookEntity();
				book.setIsbn( rs.getString("isbn") );
				book.setTitle( rs.getString("title") );
				book.setAuthor( rs.getString("author") );
				book.setPublisher( rs.getString("publisher") );
				book.setPrice( rs.getInt("price") );
				book.setCategory( rs.getString("category"));
				book.setRemaining(rs.getInt("remaining"));
				book.setRegdate(rs.getDate("regdate"));
				book.setImg(rs.getString("img"));
				book.setDescription(rs.getString("description"));

				list.add(book);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}
	
	
	
	public boolean insertBook(BookEntity entity) {
		boolean success = false;
		connect();
		
		String SQL = "insert into book values (?, ?, ?, ?, ?, ?, ?, sysdate(), ?, ?)";
		try {
			pstmt = con.prepareStatement(SQL);

			pstmt.setString(1, entity.getIsbn());
			pstmt.setString(2, entity.getTitle());
			pstmt.setString(3, entity.getAuthor());
			pstmt.setString(4, entity.getPublisher());
			pstmt.setInt(5,  entity.getPrice());
			pstmt.setString(6,  entity.getCategory());
			pstmt.setInt(7, entity.getRemaining());
			pstmt.setString(8, entity.getImg());
			pstmt.setString(9, entity.getDescription());
			
			
			pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return success;
	}
	
	
	
	
	
	public int getTotalRecNo(String CATEGORY){
		int totalRecNum  = 0;
		connect();
		String sql = "select count(*) as cnt from book where category = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  CATEGORY);
			rs = pstmt.executeQuery();
			if(rs.next())
				totalRecNum = rs.getInt("cnt");
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		
		return totalRecNum;
	}
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	/*                             category table                                 */
	
	////////////////////////////////////////////////////////////////////////////////

		
	public ArrayList<CategoryEntity> getBoardList() {	
		connect();
		ArrayList<CategoryEntity> list = new ArrayList<CategoryEntity>();
		
		String SQL = "select * from category ";
		try {
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CategoryEntity brd = new CategoryEntity();
				brd.setCateg( rs.getString("categ") );

				list.add(brd);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return list;
	}

	

	
	
	////////////////////////////////////////////////////////////////////////////////
	
	/*                             member table                                 */
	
	////////////////////////////////////////////////////////////////////////////////
	
	public MemberEntity getMember(String id){
		connect();
		String SQL = "select * from member  where id = ?";
		MemberEntity member = new MemberEntity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			rs.next();
			member.setId( rs.getString("id") );
			member.setName( rs.getString("name") );
			member.setAnum( rs.getString("anum") );
							
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return member;
	}


	
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	/*                             orderinfo table                                */
	
	////////////////////////////////////////////////////////////////////////////////
	

		public int getOrderNum(){
			int num = 0;
			connect();	
			String sql = "select max(num) as tnum from orderinfo";

			try {			
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			
				if(rs.next()){
					num = rs.getInt("tnum") + 1;
				}		
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}	
			return num;
		}
		
		
		public boolean insertOrderinfo( int num, String orderer, String isbn, 
				                       java.util.Date date, int quantity) {
			boolean success = false;
			connect();		

			String sql = "insert into orderinfo values (?, ?, ?, ?, ?)";
			try {					
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,  num);
				pstmt.setString(2, orderer);
				pstmt.setString(3, isbn);
				pstmt.setTimestamp(4, new java.sql.Timestamp(date.getTime()));
				pstmt.setInt(5, quantity);
				
				int retval = pstmt.executeUpdate();
				if(retval > 0)
					success= true;
						
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}
			return success;
		}
		
		
		
		public ArrayList<OrderBookEntity> getOrderList(String orderer){
			connect();
			String SQL = "select date(buydate) as buydate, num, B.title, sum(B.price *A.quantity) as total, "
					   + "count(*) as cnt  "
					   + "from orderInfo A, book B where orderer=? "
					   + "and  date(buydate)  >= date(subdate(now(), interval 3 month)) " 
					   + "and A.isbn = B.isbn "
					   + "group by num "
					   + "order by num desc "; 

			ArrayList<OrderBookEntity> list = new ArrayList<OrderBookEntity>();
			
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, orderer);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					OrderBookEntity entity = new OrderBookEntity();
					entity.setBuydate(rs.getDate("buydate"));
					entity.setNum( rs.getInt("num") );
					entity.setTitle( rs.getString("title") );
					entity.setTotal(rs.getInt("total"));
					entity.setCnt(rs.getInt("cnt"));
					list.add(entity);
				}
								
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			finally {
				disconnect();
			}
			    
			return list;
		}
			




		
	
	
	////////////////////////////////////////////////////////////////////////////////
	
	/*                             Cart table                                */
	
	////////////////////////////////////////////////////////////////////////////////

	public boolean insertCart( String uid, String isbn, int quantity) {
		boolean success = false;
		connect();
		
		String sql = "insert into cart values (?, ?, ?)";
		
		try {			

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  uid);
			pstmt.setString(2, isbn);
			pstmt.setInt(3, quantity);	
			
			int retval = pstmt.executeUpdate();
			if(retval > 0)
				success= true;
					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return success;
	}
	
	
	public boolean deleteCart( String uid, String isbn) {
		boolean success = false;
		connect();
		
		String sql = "delete from cart where uid = ? and isbn = ?";
		
		try {			

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  uid);
			pstmt.setString(2, isbn);	
			
			int retval = pstmt.executeUpdate();
			if(retval > 0)
				success= true;
					
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return success;
	}
	
	
	public ArrayList<BookCartEntity> getCart(String uid){
		connect();
		String SQL = "select A.isbn, B.title, B.price,  sum(A.quantity) as quantity, "
					+ "(B.price * sum(A.quantity)) as sum "
					+ "from cart A, book B where uid=? and A.isbn = B.isbn "
					+ "group by A.isbn";

		ArrayList<BookCartEntity> list = new ArrayList<BookCartEntity>();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BookCartEntity entity = new BookCartEntity();
				entity.setIsbn(rs.getString("isbn"));
				entity.setTitle(rs.getString("title"));
				entity.setPrice( rs.getInt("price") );
				entity.setQuantity( rs.getInt("quantity") );
				entity.setSum(rs.getInt("sum"));
				list.add(entity);
			}							
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		    
		return list;
	}



}
	
