package entities;
// Generated Sep 12, 2012 4:07:18 PM by Hibernate Tools 3.2.1.GA



/**
 * Clerkingquestion generated by hbm2java
 */
public class Clerkingquestion  implements java.io.Serializable {


     private Integer clerkid;
     private String question;
     private int frequecy;

    public Clerkingquestion() {
    }

    public Clerkingquestion(String question, int frequecy) {
       this.question = question;
       this.frequecy = frequecy;
    }
   
    public Integer getClerkid() {
        return this.clerkid;
    }
    
    public void setClerkid(Integer clerkid) {
        this.clerkid = clerkid;
    }
    public String getQuestion() {
        return this.question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }
    public int getFrequecy() {
        return this.frequecy;
    }
    
    public void setFrequecy(int frequecy) {
        this.frequecy = frequecy;
    }




}


