package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Goods;
import service.InterfacePeopleService;
import service.PeopleService;

/**
 * Servlet implementation class DoPhone1
 */
@WebServlet("/DoPhone1")
public class DoPhone1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InterfacePeopleService peopleService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoPhone1() {
    	peopleService = new PeopleService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		try {
			HashMap<String, Goods> order = (HashMap<String, Goods>)session.getAttribute("order");
			String id = "1";
			String name = "HUAWEI P40 Pro 5G";
			int price = order.get(id).getPrice();
			int number = Integer.parseInt(request.getParameter("number")) + order.get(id).getNumber();
			String picture = "image/phone1.png";
			
			order.replace(id, new Goods(id, name, price, number, picture));
			session.setAttribute("order", order);
			
			System.out.println(
					"当前加车信息为:" + 
					"id:" + id + " " + 
					"name:" + name + " " +
					"price:" + price + " " + 
					"number:" + number + " " + 
					"picture:" + picture + " " + 
					"sum:" + number*price + " ");
			
			request.getRequestDispatcher("Phone1.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error_sign", "<h4 class=\"lead\">请先登录再加入购物车!</h4>");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
