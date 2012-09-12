<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="entities.*,helper.HibernateUtil,org.hibernate.Session,java.util.Date" %>
<% try {
        Session sess = HibernateUtil.getSessionFactory().getCurrentSession();
        sess.beginTransaction();
        HMSHelper mgr = new HMSHelper();
        if (request.getParameter("patientid") != null) {
            Patient p = mgr.getPatientByID(request.getParameter("patientid"));
            session.setAttribute("patient", p);
            response.sendRedirect("../index.jsp");
            return;
        }

        if ("forward".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("unitid");

            /*Visitationtable visit = new Visitationtable();
             visit.setStatus(unitName);
             visit.setDate(new Date());*/
            Patient p = (Patient) session.getAttribute("patient");
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String previous = mgr.getPatientFolder(patientid).getStatus();
            int type = -1;
            try {
                type = Integer.parseInt(request.getParameter("contype"));
            } catch (NumberFormatException e) {
                response.sendRedirect("../index.jsp");
                return;
            }
            if (patientid.equals("")) {
                response.sendRedirect("../index.jsp");
                return;
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date();

            String l = mgr.stepOverVisit(patientid, dateFormat.format(date));

            if (l.equalsIgnoreCase("Yes")) {
                session.setAttribute("lasterror", "Patient is already logged");
                response.sendRedirect("../index.jsp");
                return;
            }
            /*visit.setPatientid(patientid);
             visit.setPatientstatus("Out Patient");
             visit.setVisittype(type);
             session.setAttribute("visit", visit);
             sess.save(visit);*/

            Visitationtable visit = mgr.createNewVisit(patientid, "", "", unitName, type, "");
            mgr.updateFolderLocation(previous, unitName, patientid);
            mgr.addPatientConsultation(visit.getVisitid(), type);

            response.sendRedirect("../index.jsp");
            return;

        }
        if ("Forward to Accounts".equals(request.getParameter("action"))) {
            //System.out.println("here");
            String unitName = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String[] ptid = request.getParameterValues("dispensed[]") == null ? null : request.getParameterValues("dispensed[]");
            String[] afford = request.getParameterValues("afford[]") == null ? null : request.getParameterValues("afford[]");
            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            //String unit = request.getParameter("unitid") == null ? "Pharmacy" : request.getParameter("unitid");
            String visit = request.getParameter("visitid");
            String loc = request.getParameter("from");
            String previous = mgr.getPatientFolder(patientid).getStatus();
            int visitid = - 1;
            try {
                visitid = Integer.parseInt(visit);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../pharmacy.jsp");
                return;
            }


            if (patientid != null && !unitName.equals("")) {
                // System.out.println(patientid);
                mgr.updateFolderLocation(previous, unitName, patientid);
                mgr.updateVisitationStatus(visitid, unitName, previous);

                if (ptid != null) {
                    for (int r = 0; r < ptid.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(ptid[r]), "Yes");
                    }
                }
                if (afford != null) {
                    for (int r = 0; r < afford.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        mgr.updatePatientTreatment(Integer.parseInt(afford[r]), "Afford",0.0);
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../pharmacy.jsp");
                return;
            }
            session.setAttribute("lasterror", "Please try again");
            response.sendRedirect("../pharmacy.jsp");
            return;
            //String registrationDate = request.getParameter("dor");
        }

        if ("Forward".equals(request.getParameter("laboratory"))) {

            String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
            String id[] = request.getParameterValues("ids[]") == null ? null : request.getParameterValues("ids[]");
            String labid = request.getParameter("labid") == null ? "Laboratory" : request.getParameter("labid");
            String[] results = request.getParameterValues("results[]") == null ? null : request.getParameterValues("results[]");
            String[] affords = request.getParameterValues("afford[]") == null ? null : request.getParameterValues("afford[]");
            String[] concentration = request.getParameterValues("concentration[]") == null ? null : request.getParameterValues("concentration[]");
            String[] range = request.getParameterValues("range[]") == null ? null : request.getParameterValues("range[]");
            // String patientid = request.getParameter("patient") == null ? "" : request.getParameter("patient");
           // String previous = mgr.getPatientFolder(patientid).getStatus();
            String visit = request.getParameter("visitid");
            String loc = request.getParameter("from");

            int visitid = - 1;
            int orderid = -1;
            try {
                visitid = Integer.parseInt(visit);
                orderid = Integer.parseInt(labid);
            } catch (NumberFormatException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }

            //  int pid =  - 1;

            try {
                if (mgr.getVisitById(visitid).getPreviouslocstion().equals("Room 1")) {
                    /*System.out.println(visitid);
                    System.out.println(unitName);*/
                    mgr.updateFolderLocation("Laboratory", "Accounts", patientid);
                    mgr.updateVisitationStatus(visitid, "Accounts", "Laboratory");

                    if (affords != null) {
                        for (int r = 0; r < affords.length; r++) {
                            //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                            mgr.updatePatientInvestigation(Integer.parseInt(affords[r]), "","","", "Afford", 0.0);
                            // mgr.updateLaborders(1, "",new Date());
                        }
                    }
                    /*for (int r = 0; r < id.length; r++) {
                     //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                     mgr.updatePatientInvestigation(Integer.parseInt(id[r]), results[r], "Yes", 0.0);
                     // mgr.updateLaborders(1, "",new Date());
                     }*/
                }
                if (mgr.getVisitById(visitid).getPreviouslocstion().equals("Accounts")) {
                   /* System.out.println(visitid);
                    System.out.println(unitName);*/
                    mgr.updateFolderLocation("Laboratory", "Records", patientid);
                    mgr.updateVisitationStatus(visitid, "Records", "Laboratory");
                    mgr.updateLaborders(orderid, new Date());
                    
                    
                    for (int r = 0; r < id.length; r++) {
                        //Patienttreatment patienttreatment = mgr.getPatientTreatment(Integer.parseInt(ptid[r]));
                        String result = request.getParameter("results"+id[r])==""? "": request.getParameter("results"+id[r]);
                        String concen = request.getParameter("concentration"+id[r])==""? "": request.getParameter("concentration"+id[r]);
                        String rnge = request.getParameter("range"+id[r])==""? "": request.getParameter("range"+id[r]);
                        
                        mgr.updatePatientInvestigation(Integer.parseInt(id[r]), result, concen, rnge, "Yes", 0.0);
                        // mgr.updateLaborders(1, "",new Date());
                    }
                }
                session.setAttribute("lasterror", "Successfully forwarded");
                response.sendRedirect("../laboratory.jsp");
                return;
            } catch (NullPointerException e) {
                session.setAttribute("lasterror", "Please try again");
                response.sendRedirect("../laboratory.jsp");
                return;
            }
        }

        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();

    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>