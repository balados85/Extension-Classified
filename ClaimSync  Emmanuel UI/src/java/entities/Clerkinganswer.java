package entities;
// Generated Sep 12, 2012 4:07:18 PM by Hibernate Tools 3.2.1.GA



/**
 * Clerkinganswer generated by hbm2java
 */
public class Clerkinganswer  implements java.io.Serializable {


     private Integer answerid;
     private String answer;
     private int questionid;

    public Clerkinganswer() {
    }

    public Clerkinganswer(String answer, int questionid) {
       this.answer = answer;
       this.questionid = questionid;
    }
   
    public Integer getAnswerid() {
        return this.answerid;
    }
    
    public void setAnswerid(Integer answerid) {
        this.answerid = answerid;
    }
    public String getAnswer() {
        return this.answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public int getQuestionid() {
        return this.questionid;
    }
    
    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }




}


