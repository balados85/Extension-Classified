package entities;
// Generated Sep 17, 2012 11:22:58 AM by Hibernate Tools 3.2.1.GA



/**
 * Users generated by hbm2java
 */
public class Users  implements java.io.Serializable {


     private String username;
     private String password;
     private String staffid;
     private boolean temporal;

    public Users() {
    }

    public Users(String username, String password, String staffid, boolean temporal) {
       this.username = username;
       this.password = password;
       this.staffid = staffid;
       this.temporal = temporal;
    }
   
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getStaffid() {
        return this.staffid;
    }
    
    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }
    public boolean isTemporal() {
        return this.temporal;
    }
    
    public void setTemporal(boolean temporal) {
        this.temporal = temporal;
    }




}


