package src.com.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.com.bean.BuildingBean;
import src.com.bean.LotBean;
import src.com.dao.BuildingsDAO;

import com.google.gson.Gson;

public class AjaxHandler extends HttpServlet {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * Default constructor. 
     */
    public AjaxHandler() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	      String check = request.getParameter("FieldId");
	      System.out.println("Parameter:" +check);
	      if(check!=null){
	    	  if(request.getParameter("FieldId").equalsIgnoreCase("viewBuildings")){	  
	    		 PrintWriter out=response.getWriter(); 		   
	    		 try{
	    			 BuildingsDAO bd= new BuildingsDAO();
	    			 ArrayList<BuildingBean> buildingsData = null;
	    			 buildingsData = bd.getBuildings();
	    			 Gson gson = new Gson();
	    			 String buildings = gson.toJson(buildingsData);
	    			 out.println(buildings);
	    		 }
	    		 catch(Exception e){ 			 
	    			 e.printStackTrace();
	    		 }
	    	  }
	    	  else if(request.getParameter("FieldId").equalsIgnoreCase("viewNearbyLots")){
	    		 PrintWriter out=response.getWriter(); 		   
	    		 try{
	    			 BuildingsDAO bd= new BuildingsDAO();
	    			 ArrayList<LotBean> lotsData = null;
	    			 lotsData = bd.getLots(
	    					 java.sql.Date.valueOf(request.getParameter("FromDate")),
	    					 java.sql.Date.valueOf(request.getParameter("ToDate")),
	    					 java.sql.Time.valueOf(request.getParameter("FromTime")),
	    					 java.sql.Time.valueOf(request.getParameter("ToTime")),
	    					 Integer.valueOf(request.getParameter("BuildingId")));
	    			 Gson gson = new Gson();
	    			 String lots = gson.toJson(lotsData);
	    			 out.println(lots);
	    		 }
	    		 catch(Exception e){ 			 
	    			 e.printStackTrace();
	    		 }
	    	  }
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub			
	}
}
