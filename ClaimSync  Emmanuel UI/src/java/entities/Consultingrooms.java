package entities;
// Generated Sep 12, 2012 4:07:18 PM by Hibernate Tools 3.2.1.GA



/**
 * Consultingrooms generated by hbm2java
 */
public class Consultingrooms  implements java.io.Serializable {


     private Integer consultingroomid;
     private String consultingroom;

    public Consultingrooms() {
    }

    public Consultingrooms(String consultingroom) {
       this.consultingroom = consultingroom;
    }
   
    public Integer getConsultingroomid() {
        return this.consultingroomid;
    }
    
    public void setConsultingroomid(Integer consultingroomid) {
        this.consultingroomid = consultingroomid;
    }
    public String getConsultingroom() {
        return this.consultingroom;
    }
    
    public void setConsultingroom(String consultingroom) {
        this.consultingroom = consultingroom;
    }




}

