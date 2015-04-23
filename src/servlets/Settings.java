package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blackboard.platform.plugin.PlugInException;
import edu.wsu.BuildingBlockHelper;

/**
 * Servlet implementation class Settings
 */
public class Settings extends HttpServlet {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 2165875762203932794L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public Settings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String message = request.getParameter("message");
			Properties props = new Properties();
			
			props.setProperty("message", message);
			BuildingBlockHelper.saveBuildingBlockSettings(props);
			response.sendRedirect(BuildingBlockHelper.getBaseUrl("admin/configure.jsp"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.setContentType("application/json");
	        PrintWriter writer = response.getWriter();
	        writer.print("Error: " + e.getMessage());
		}
	}

}
