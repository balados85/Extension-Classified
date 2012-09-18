<%-- 
    Document   : update
    Created on : Jul 20, 2012, 11:57:49 AM
    Author     : lisandro
--%>
<%@page import="java.util.List"%>
<%@page import="entities.*"%>
<%@page import="entities.HMSHelper"%>
<%@page import="helper.HibernateUtil"%>
<% try {
    Users current = (Users) session.getAttribute("staff");
            if(current == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
       

      
           // String doctorId = request.getParameter("doctorId");
           // String patientId = request.getParameter("patientId");
           // String content = request.getParameter("content");
            String start1 = request.getParameter("start");
            String allDay1 = request.getParameter("allday");
            String end1 = request.getParameter("end");
            String title = request.getParameter("title");
            //String q = request.getParameter("id");
           // int id = Integer.parseInt(q);
            
             HMSHelper its = new HMSHelper();
         List itmss = its.EditAppointment(title);
                for (int i = 0; i < itmss.size(); i++) {
                    Appoint app = (Appoint) itmss.get(i);
                  String doctorId2=  app.getDoctorId();
                  String patientId2=  app.getPatientId();
                  String allDay2=  app.getAllday();
                  String content2 =  app.getContent();
                  String start2 =  app.getStart();
                   String end2 = app.getEnd();
                   int id = app.getId();

                   String doctorId = doctorId2;
                   String patientId = patientId2;
                   String content =content2;
                   String start = start1;
                   String allDay = allDay1;
                   String end = end1;
                   
System.out.println(title+"allDay"+allDay);
    
        System.out.println("ere");
           

          
            Appoint updateApp = null;
          
            updateApp  = its.updateAppointment(start, allDay, end, title, doctorId, patientId, content, id);
         
            session.setAttribute("item",  updateApp);
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