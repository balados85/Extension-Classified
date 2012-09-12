package entities;
// Generated Sep 12, 2012 4:07:18 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Patientdiagnosis generated by hbm2java
 */
public class Patientdiagnosis  implements java.io.Serializable {


     private Integer id;
     private String patientid;
     private int diagnosisid;
     private String code;
     private int visitationid;
     private Date date;

    public Patientdiagnosis() {
    }

    public Patientdiagnosis(String patientid, int diagnosisid, String code, int visitationid, Date date) {
       this.patientid = patientid;
       this.diagnosisid = diagnosisid;
       this.code = code;
       this.visitationid = visitationid;
       this.date = date;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getPatientid() {
        return this.patientid;
    }
    
    public void setPatientid(String patientid) {
        this.patientid = patientid;
    }
    public int getDiagnosisid() {
        return this.diagnosisid;
    }
    
    public void setDiagnosisid(int diagnosisid) {
        this.diagnosisid = diagnosisid;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public int getVisitationid() {
        return this.visitationid;
    }
    
    public void setVisitationid(int visitationid) {
        this.visitationid = visitationid;
    }
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }




}


