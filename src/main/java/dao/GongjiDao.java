package dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDto;
import dto.GongjiDto;

public class GongjiDao {
	PreparedStatement pstmt;
	Connection conn;
	
	public GongjiDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension";
		conn = DriverManager.getConnection(db, "root", "1234");
	}
	
	public void write_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//request
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String gubun;
		if(request.getParameter("gubun") == null) {
			gubun="0";
		} else {
			gubun=request.getParameter("gubun");
		}
		//쿼리생성
		String sql="insert into gongji(title,content,gubun,writeday)";
		sql=sql+"values(?,?,?,now())";
		//심부름꾼생성
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, gubun);
		//쿼리실행
		pstmt.executeUpdate();
		//close
		pstmt.close();
		conn.close();
		//이동
		response.sendRedirect("list.jsp");
	}
	
	public void list(HttpServletRequest request) throws Exception {
		//request x
		
		//쿼리생성
		String sql="select * from gongji order by gubun desc,id desc";
		//심부름꾼생성s
		pstmt=conn.prepareStatement(sql);
		//쿼리실행
		ResultSet rs=pstmt.executeQuery();
		//ArrayList 를 생성 : dto를 담을
		ArrayList<GongjiDto> list=new ArrayList<GongjiDto>();
		//rs를 dto에 저장한후 list에 하나씩 넣기
		while(rs.next()) {
			GongjiDto gdto=new GongjiDto();
			gdto.setTitle(rs.getString("title"));
			gdto.setId(rs.getInt("id"));
			gdto.setWriteday(rs.getString("writeday"));
			gdto.setGubun(rs.getInt("gubun"));
			
			list.add(gdto);
		}
		request.setAttribute("list", list);
	}
	
	public void content(HttpServletRequest request) throws Exception {
		//request
		String id=request.getParameter("id");
		//쿼리생성
		String sql="select * from gongji where id=?";
		//심부름꾼생성
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		//쿼리실행
		ResultSet rs=pstmt.executeQuery();
		rs.next();	
		//rs를dto에 담기
		GongjiDto gdto=new GongjiDto();
		gdto.setId(rs.getInt("id"));
		gdto.setTitle(rs.getString("title"));
		gdto.setWriteday(rs.getString("writeday"));
		gdto.setGubun(rs.getInt("gubun"));
		gdto.setContent(rs.getString("content"));
		//dto를 request영역에 저장
		request.setAttribute("gdto", gdto);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//request
		String id=request.getParameter("id");
		//쿼리생성
		String sql="delete from gongji where id=?";
		//심부름꾼생성
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		//쿼리실행
		pstmt.executeUpdate();
		//close
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list.jsp");
	}
	
	public void update(HttpServletRequest request) throws Exception {
		String id=request.getParameter("id");
		String sql="select * from gongji where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		GongjiDto gdto=new GongjiDto();
		
 	    gdto.setTitle(rs.getString("title"));
 	    gdto.setId(rs.getInt("id"));
 	    gdto.setGubun(rs.getInt("gubun"));
 	    gdto.setContent(rs.getString("content"));
 	    
 	    // dto를 request영역에 저장
 	    request.setAttribute("gdto", gdto);
	}
	
	public void update_ok(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		String gubun;
		if(request.getParameter("gubun") == null) {
			gubun="0";
		}else {
			gubun=request.getParameter("gubun");
		//쿼리생성
		String sql="update gongji set title=?, content=?, gubun=? where id=?";
		//심부름꾼생성
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, gubun);
		pstmt.setString(4, id);
		//쿼리실행
		pstmt.executeUpdate();
		//close
		pstmt.close();
		conn.close();
		//이동
		response.sendRedirect("list.jsp");
		}
	}
	
	public void getThree(HttpServletRequest request) throws Exception {
		String sql="select * from gongji order by id desc limit 3";
		
		pstmt=conn.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<GongjiDto> glist=new ArrayList<GongjiDto>();
		while(rs.next()) {
			GongjiDto gdto=new GongjiDto();
			gdto.setId(rs.getInt("id"));
			if(rs.getString("title").length()>13) {
				gdto.setTitle(rs.getString("title").substring(0,10)+"···"); //substring 텍스트의 길이를 자름
				}else {
					gdto.setTitle(rs.getString("title"));
				}
			gdto.setWriteday(rs.getString("writeday"));
			
			glist.add(gdto);
		}
		request.setAttribute("glist", glist);
	}
}
