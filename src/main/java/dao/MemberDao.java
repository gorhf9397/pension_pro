package dao;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.apache.catalina.Session;

import dto.MemberDto;

public class MemberDao {
	PreparedStatement pstmt;
	Connection conn;

	public MemberDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/pension";
		conn = DriverManager.getConnection(db, "root", "1234");
	}

	public void userid_check(HttpServletRequest request, JspWriter out) throws Exception {
		// request
		String userid = request.getParameter("userid");
		// 쿼리생성
		String sql = "select count(*) as cnt from member where userid=?";
		// member table 에 userid 가 있냐. 있으면 몇개있는지를 확인해라.
		// 심부름꾼생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		// 실행
		ResultSet rs = pstmt.executeQuery();
		rs.next();

		out.print(rs.getString("cnt"));
	}

	public void member_input_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		String sql = "insert into member(userid,name,pwd,email,phone,writeday)";
		sql = sql + "values(?,?,?,?,?,now())";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, name);
		pstmt.setString(3, pwd);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);

		pstmt.executeUpdate();

		pstmt.close();
		conn.close();

		response.sendRedirect("login.jsp");
	}

	public void login_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");

		String sql = "select * from member where userid=? and pwd=? and state=0";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			session.setAttribute("userid", rs.getString("userid"));
			session.setAttribute("name", rs.getString("name"));

			rs.close();
			pstmt.close();
			conn.close();

			response.sendRedirect("../main/index.jsp");
		} else {
			rs.close();
			pstmt.close();
			conn.close();

			response.sendRedirect("login.jsp?chk=1");
		}
	}

	public void logout(HttpServletResponse response, HttpSession session) throws Exception {
		session.invalidate();

		response.sendRedirect("../main/index.jsp");
	}
	
	public void userid_search(HttpServletRequest request, JspWriter out) throws Exception {
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		
		String sql="select userid from member where name=? and phone=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			out.print(rs.getString("userid"));
		}else {
			out.print("1");
		}
	}
	
	public void member_info(HttpSession session, HttpServletRequest request) throws Exception {
		String userid=session.getAttribute("userid").toString();
		
		String sql="select * from member where userid=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		// jsp에서 필요한 내용을 전부 request로 각각 생성도 가능
		/*
		 * request.setAttribute("userid", rs.getString("userid"));
		 * request.setAttribute("name", rs.getString("name"));
		 * request.setAttribute("email", rs.getString("email"));
		 * request.setAttribute("phone", rs.getString("phone"));
		 */
		// jsp에서 필요한 내용을 하나의 객체로 만들어서 사용(dto)
		MemberDto mdto=new MemberDto();
		mdto.setUserid(rs.getString("userid"));
		mdto.setName(rs.getString("name"));
		mdto.setEmail(rs.getString("email"));
		mdto.setPhone(rs.getString("phone"));
		
		request.setAttribute("mdto", mdto);
	}
	
	public void pwd_change_ok(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {
		String old_pwd=request.getParameter("old_pwd");
		String pwd=request.getParameter("pwd");
		
		// db에있는 비밀번호 읽어오기
		String sql="select pwd from member where userid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		String dbpwd=rs.getString("pwd");
		
		if(old_pwd.equals(dbpwd)) {
			sql="update member set pwd=? where userid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, session.getAttribute("userid").toString());
			
			pstmt.executeUpdate();
			session.invalidate();
			
			pstmt.close();
			conn.close();
			
			response.sendRedirect("../member/login.jsp");
		}else {
			response.sendRedirect("pwd_change.jsp");
		}
	}
	
	public void info_change(HttpServletRequest request, HttpSession session) throws Exception {
		
		String userid=session.getAttribute("userid").toString();
		String sql="select * from member where userid=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		MemberDto mdto=new MemberDto();
		mdto.setUserid(rs.getString("userid"));
		mdto.setName(rs.getString("name"));
		mdto.setEmail(rs.getString("email"));
		mdto.setPhone(rs.getString("phone"));
		
		request.setAttribute("mdto", mdto);
	}
	
	public void info_change_ok(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {
		
		String userid=session.getAttribute("userid").toString();
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		String sql="update member set email=?, phone=? where userid=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, phone);
		pstmt.setString(3, userid);
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		response.sendRedirect("../member/member_info.jsp");
	}
	
	public void pwd_search(HttpServletRequest request, JspWriter out) throws Exception {
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String phone=request.getParameter("phone");
		String name=request.getParameter("name");
		
		String sql="select pwd from member where name=? and phone=? and userid=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, userid);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			out.print(rs.getString("pwd"));
		} else {
			out.print("1");
		}
	}
	
	public void userid_search_js(HttpServletRequest request,
			HttpSession session,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		
		String sql="select userid from member where name=? and phone=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next()) {
			session.setAttribute("imsiuser", rs.getString("userid"));
			session.setAttribute("chk", "1");
			System.out.println(request.getAttribute("userid"));
			System.out.println(request.getAttribute("chk"));
			response.sendRedirect("login_js.jsp");
		} else {
			session.setAttribute("chk", "2");
			response.sendRedirect("login_js.jsp");
		}
	}
	
	public void pwd_search_js(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String userid=request.getParameter("userid");
		String phone=request.getParameter("phone");
		
		String sql="select pwd from member where name=? and userid=? and phone=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, userid);
		pstmt.setString(3, phone);
		
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next()) {
			session.setAttribute("pwd", rs.getString("pwd"));
			session.setAttribute("chk","3");
			pstmt.close();
			conn.close();
			response.sendRedirect("login_js.jsp");
		}else {
			pstmt.close();
			conn.close();
			session.setAttribute("chk", "4");
			response.sendRedirect("login_js.jsp");
		}
	}
	
	//회원탈퇴신청
	public void member_out(HttpSession session,HttpServletResponse response) throws Exception {
		//member테이블의 state필드의 값을 1로 변경
		String userid=session.getAttribute("userid").toString();
		
		String sql="update member set state=1 where userid=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		//쿼리실행
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		//로그아웃
		session.invalidate();
		
		response.sendRedirect("../main/index.jsp");
	}
}
