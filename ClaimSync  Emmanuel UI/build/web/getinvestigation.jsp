<%@page import="entities.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<% Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            } %>
<%    
    HMSHelper mm = new HMSHelper();
    
    String query = request.getParameter("q");
   // mm.removeTrim();
    List treatments = mm.listInvestigationShow(query);
    //out.print(countries.size());
    Iterator<Investigation> iterator = treatments.iterator();
    while (iterator.hasNext()) {
        Investigation investigation = (Investigation) iterator.next();
   //     System.out.println(investigation);
        out.println(investigation.getInvestigation());
    }
    %>