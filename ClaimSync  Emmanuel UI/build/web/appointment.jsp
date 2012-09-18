<%-- 
    Document   : index
    Created on : Jul 17, 2012, 5:08:57 PM
    Author     : lisandro
--%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import="entities.*"%>
<%@page import="java.util.List"%>
<%@page import="entities.HMSHelper"%>
<%@page import="helper.HibernateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<% Users user = (Users) session.getAttribute("staff");
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            } %>
<html>
    <head>
        <link rel='stylesheet' type='text/css' href='cupertino/theme.css' />
        <link rel='stylesheet' type='text/css' href='fullcalendar/fullcalendar.css' />
        <link rel='stylesheet' type='text/css' href='fullcalendar/fullcalendar.print.css' media='print' />
        <script type='text/javascript' src='js/jquery-1.6.2.min.js'></script>
        <script type='text/javascript' src='js/jquery-ui-1.8.16.custom.min.js'></script>
        <script type='text/javascript' src='js/jquery.ui.dialog.js'></script>
        <script type='text/javascript' src='fullcalendar/fullcalendar.min.js'></script>

    </head>   
    <body bgcolor="#457687">
        <%

            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

            HMSHelper itm = new HMSHelper();

            List itmss = itm.listAppointment();
        %>
        <script type='text/javascript'>

   

            $(document).ready(function() {
	
                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();
		
                var calendar = $('#calendar').fullCalendar({
                    defaultView: 'agendaWeek',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'agendaWeek,month'
                        
                        //month ,agendaDay
                    },
                    droppable:true,
                    selectable: true,
                    selectHelper: true,
                     
                           
                    select: function(start, end, allDay) {
                        
                        var title = prompt('Appointment Title');            
                        var doctorId1 = prompt('Doctor Id');
                        var patientId1 = prompt('Patient Id');
                        var content1 = prompt('Appointment Detail');
                        
                        // var showform = document.getElementById("frm");
                        //showform.style.display='';
                        var startId= document.getElementById('startId').value = start;
                        var endId= document.getElementById('endId').value = end;
                        var allDayId = document.getElementById('allDayId').value = allDay;
                        var  titleId=document.getElementById('titleId').value = title;
                        var doctorId = document.getElementById('doctorId').value = doctorId1;
                        var patientId = document.getElementById('patientId').value = patientId1
                        var content = document.getElementById('content').value = content1;
                     
                        var submitNow=document.mainForm.submit();
                       
                       
                        /// alert(start3);
                        if (title) {
                            calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                  
                                end: end,
                                allDay: allDay
                                
                            
                                
                            },
                            true // make the event "stick"
                         
                        );
                        }
                      
                        calendar.fullCalendar('unselect');
                    },
                    editable: true,
                    eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
                        
                        var startId1= document.getElementById('startId1').value = event.start;
                        var endId1= document.getElementById('endId1').value = event.end;
                        var allDayId1 = document.getElementById('allDayId1').value = event.allDay;
                        var  titleId1=document.getElementById('titleId1').value = event.title;
        
                        var submit = confirm("Do You Want To Save Changes?");
                        if (submit==true)
                        {
                            var f=document.update.submit();
                            
                        }
                        else
                        {
                            return;
                        } 

                    },
                    eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
                        
                        var startId1= document.getElementById('startId1').value = event.start;
                        var endId1= document.getElementById('endId1').value = event.end;
                        var allDayId1 = document.getElementById('allDayId1').value = event.allDay;
                        var  titleId1=document.getElementById('titleId1').value = event.title;
        
                        var submit = confirm("Do You Want To Save Changes?");
                        if (submit==true)
                        {
                            var f=document.update.submit();
                            // f.method="post";
                            //f.action='updateItems.jsp?id='+id;
                            //f.submit();
                        }
                        else
                        {
                          return;  
                        } 
                    },
                    eventClick: function(calEvent, jsEvent, view) {
                        
                        var  titleId2=document.getElementById('titleId2').value = calEvent.title;
                        // alert(calEvent.title);
                        $( "#dialog:ui-dialog" ).dialog( "destroy" );
	
                        $( "#edit-confirm" ).dialog({
                            //resizable: false,
                            //height:140,
                            //modal: true,
                            buttons: {
                                "Cancel Appointment": function() {
                                    var deleteForm = document.deleteForm.submit();
                      
                                },
                                "Update Appointment": function() {
                                    var newTitleId = prompt('Update Title',titleId2);
                                    var  newTitleId1=document.getElementById('titleId4').value = newTitleId;
                                    var start4= document.getElementById('startId4').value = calEvent.start;
                                    var updateForm = document.updateTitle.submit();
                                },
                                "Honored":function(){
                                    //var newTitleId = prompt('Update',titleId2);
                                    //var  newTitleId1=document.getElementById('titleId4').value = newTitleId;
                                    var id= document.getElementById('id').value = calEvent.start;
                                    var updateHonred = document.honored.submit();
                                }
                            }
                        });
	
            <%--
                        var deleteEvent = jConfirm("Do You Really Want To Delete The Event?");
                        $.alert.okButton='Edit';
                        if (deleteEvent==true)
                        {       
                            var deleteForm = document.deleteForm.submit();
                      
                        }
                        else
                        {
                                    
} --%>
            },

            events: [
            <%      for (int i = 1; i < itmss.size(); i++) {

               
                    Appoint itt = (Appoint) itmss.get(i);
                    // if(itt.getDoctorId().equals("kkk")){
                    String title = itt.getTitle();
                    String start = itt.getStart();
                    String end = itt.getEnd();
                    String allDay = itt.getAllday();
                    String patient = itt.getPatientId();
                    String doctor = itt.getDoctorId();
                    



                    System.out.print("Title " + title + " " + start);
                    System.out.print("___________________________" + itmss.size() + "____________________________________________________");
            %> 
                           
                       
                       
                            {
                             
                                title:'<%=title%> '+'<%=patient%> '+' <%=doctor%>',
                                start: new Date('<%=start%>'),
                                end: new Date('<%=end%>'),
                                
                                allDay: <%=allDay%>,
                                color: 'white',  
                                textColor: 'green'   
                          
                            
                    
                
                            },
            <% System.out.print("allDay " + allDay + "");%>
            <% //}
}%>
                            {
                            
                            }
   
                        ]
                      
         
                    }
                );
		
                });
           
        </script>


        <style type='text/css'>

            body {
                margin-top: 40px;
                text-align: center;
                font-size: 14px;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            }

            #calendar {
                float: middle;
                width: 900px;
                margin: 0 auto;


            }
            #frm
            {

                float: left;
                width: 150px;
                padding: 0 10px;
                border: 1px solid #ccc;
                background: #eee;
                text-align: left;


            }

        </style>

        <div align="right">
            <table style="display: none" id="frm" name="fm" onkeyup="ddd();">
                <form method="post"  class="frm" action="action/saveAppointment.jsp" name="mainForm">
                    <tr>
                        <td>  <label>Enter Doctor Id </label>
                            <input type="text" name="doctorId" id="doctorId"/>
                        </td>
                    </tr>
                    <tr> 
                        <td> 
                            <label>Enter Patient Id </label>
                            <input type="text" name="patientId" id="patientId">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <lable>Appointment Detail </lable>
                            <input type="text" name="content" id="content">
                        </td>
                    </tr>
                    <input type="hidden" name="start" id="startId">
                        <input type="hidden" name="end" id="endId">
                            <input type="hidden" name="allday" id="allDayId">
                                <input type="hidden" name="title" id="titleId">
                                    <tr>
                                        <td>

                                        </td>
                                    </tr>

                                    </form>
                <div style="display:none">
                                    <form method="post" action="action/updatetitle.jsp" name="updateTitle">
                                        <input type="text" name="newtitle" id="titleId4">
                                            <input type="text" name="start" id="startId4">
                                                </form>
                </div>
                                                <form method="post" action="action/delete.jsp" name="deleteForm">

                                                    <input type="hidden" name="title" id="titleId2">
                                                </form>
                                                <form method="post" action="action/update.jsp" name="update">
                                                    <input type="hidden" name="title" id="titleId1">

                                                        <input type="hidden" name="start" id="startId1">

                                                            <input type="hidden" name="end" id="endId1">

                                                                <input type="hidden" name="allday" id="allDayId1">


                                                                    </form>
                <form action="delete" action="action/delete.jsp" name="honored">
                    <input type="hidden" name="id" id="id"/>
                </form>
                                                                    </table>
                                                                    </div>

                                                                    <div id='calendar'></div>




                                                                    <div id="edit-confirm" title="Edit Options" align="center" style="display: none">
                                                                        <p><span class="ui-icon ui-icon-alert" style="float:none"></span>Options</p>
                                                                    </div>

                                                                    </body>


                                                                    </html>
