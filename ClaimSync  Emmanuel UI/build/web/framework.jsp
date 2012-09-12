 <tbody style="height: 100px; overflow-y: auto;">
                                <% for (int r = 0; r < patientHistory.size(); r++) {
                                        Visitationtable vps = (Visitationtable) patientHistory.get(r);
                                       /* if(vps.getVitals()==""){
                                        String[] vts = vps.getVitals().split("-");
                                        if(vts != null){
                                        String[] bps = vts[3].split(":");*/
                                %>
                                <tr>

                                    <td>
                                        <%=vps.getDate()%>
                                    </td>

                                   <!-- <td>
                                        Temperature: <%=vts[0]==null?"":vts[0]%> (celsius) | Weight: <%=vts[1]==null?"":vts[1]%> (Kg) | Height: <%=vts[2]==null?"":vts[2]%> (m) | Blood Pressure: Systolic <%=bps[0]==null?"":bps[0]%> Diatolic <%=bps[1]==null?"":bps[1]%> | Pulse: <%=vts[4]==null?"":vts[4]%> | Pulse: <%=vts[5]==null?"":vts[5]%>

                                    </td>-->

                                </tr>
                                <%}}}%>
                            </tbody>