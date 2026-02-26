package business;

/**
 *
 * @author Heather Ward
 */
public class User {
    
    //contains all info relevant to user & attaches to session
    private String userName, userID, storeID, adminLevel, 
            password, passAttempt;
    
    public User() {
        this.userName = "";
        this.userID = "";
        this.storeID = "";
        this.adminLevel = "";
        this.password = "";
        this.passAttempt = "";
    }
    
    public boolean isAuthenticated() {
        if (!this.password.isEmpty()) {
            if (this.password.equals(this.passAttempt)) {
                return true;
            }
        }
        return false;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String un) {
        this.userName = un;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String uid) {
        this.userID = uid;
    }

    public String getStoreID() {
        return storeID;
    }

    public void setStoreID(String sid) {
        this.storeID = sid;
    }

    public String getAdminLevel() {
        return adminLevel;
    }

    public void setAdminLevel(String al) {
        this.adminLevel = al;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassAttempt() {
        return passAttempt;
    }

    public void setPassAttempt(String passAttempt) {
        this.passAttempt = passAttempt;
    }
}
