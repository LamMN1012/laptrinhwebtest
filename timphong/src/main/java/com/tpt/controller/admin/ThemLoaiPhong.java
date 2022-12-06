package com.tpt.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tpt.dao.hibernate.impl.LoaiphongDao;
import com.tpt.model.LoaiphongModel;
//import com.tpt.model.Loaiphong;
import com.tpt.model.hibernate.Loaiphong;
//import com.tpt.service.ILoaiphongService;
//import com.tpt.service.impl.LoaiphongServiceImpl;
import com.tpt.service.ILoaiphongService;
import com.tpt.service.impl.LoaiphongServiceImpl;

@WebServlet(urlPatterns = { "/admin/them-loaiphong" })
public class ThemLoaiPhong extends HttpServlet {

	/**
	 * 
	 */
	ILoaiphongService loaiphongService = new LoaiphongServiceImpl();
	LoaiphongDao loaiphongDao = new LoaiphongDao();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.getRequestDispatcher("/views/admin/them-loaiphong.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		LoaiphongModel loaiphong = new LoaiphongModel();
				loaiphong.setTenloai(req.getParameter("tenloai"));
		//loaiphong.setTenloai(req.getParameter("tenloai"));

		if (loaiphong.getTenloai().isEmpty()) {
			req.setAttribute("emptyText", "Bạn chưa nhập loại phòng");
			req.getRequestDispatcher("/views/admin/them-loaiphong.jsp").forward(req, resp);
		} else {
			loaiphongService.insertLoaiphong(loaiphong);
			//loaiphongDao.create(loaiphong);
			resp.sendRedirect(req.getContextPath() + "/admin/list-loaiphong");
		}
	}
}
