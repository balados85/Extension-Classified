package entities;
// Generated Sep 12, 2012 4:07:18 PM by Hibernate Tools 3.2.1.GA



/**
 * Permission generated by hbm2java
 */
public class Permission  implements java.io.Serializable {


     private Integer permissionid;
     private String permission;

    public Permission() {
    }

    public Permission(String permission) {
       this.permission = permission;
    }
   
    public Integer getPermissionid() {
        return this.permissionid;
    }
    
    public void setPermissionid(Integer permissionid) {
        this.permissionid = permissionid;
    }
    public String getPermission() {
        return this.permission;
    }
    
    public void setPermission(String permission) {
        this.permission = permission;
    }




}

