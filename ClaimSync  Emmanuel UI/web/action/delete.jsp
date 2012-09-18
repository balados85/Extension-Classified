<%-- 
    Document   : delete
    Created on : Jul 20, 2012, 2:18:04 PM
    Author     : lisandro
--%>
<%@page import="java.util.List"%>
<%@page import="entities.Appoint"%>
<%@page import="entities.*"%>
<%@page import="helper.HibernateUtil"%>
<% try {
     Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();


        // String doctorId = request.getParameter("doctorId");
        // String patientId = request.getParameter("patientId");
        // String content = request.getParameter("content");

        String title = request.getParameter("title");
        //String q = request.getParameter("id");
        // int id = Integer.parseInt(q);
        System.out.print(title);

        HMSHelper its = new HMSHelper();
        List itmss = its.EditAppointment(title);
        for (int i = 0; i < itmss.size(); i++) {
            Appoint app = (Appoint) itmss.get(i);
            
            int id = app.getId();

            System.out.println("ere");

            Appoint deleteApp = null;

            deleteApp = its.deleteAppointment(+id);

            session.setAttribute("item", deleteApp);
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../index.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>