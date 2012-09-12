<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("Forward".equals(request.getParameter("action"))) {
            String visit = request.getParameter("id");
            String patientid = request.getParameter("patientid");
            String order = request.getParameter("orderid");
            
            int visitid = -1;
            int orderid = visitid - 1;

            try {
                visitid = Integer.parseInt(visit);
                orderid = Integer.parseInt(order);
                
                HMSHelper mgr = new HMSHelper();
                String previous = mgr.getPatientFolder(patientid).getStatus();
                mgr.updateLaborders(orderid, "");
                mgr.updateVisitation(visitid);
                mgr.updateFolderLocation(previous, "Room 1", patientid);
                mgr.updateVisitationStatus(visitid, "Room 1", previous);
           
                // description = 
            } catch (NumberFormatException e) {
                
                session.setAttribute("lasterror", "Sorry there was error forwarding patient");
                response.sendRedirect("../labresults.jsp");
                return;
            }
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        session.setAttribute("lasterror", "Shortcut successfully Added");
        response.sendRedirect("../secondary.jsp");
        return;
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>