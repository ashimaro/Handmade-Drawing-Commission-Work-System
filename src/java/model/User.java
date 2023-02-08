package model;
/**
 *
 * @author Ashwini.
 */
public class User implements java.io.Serializable {
    
    private int    userId;
    private String name;
    private String email;
    private String password;
    private String address;
    private String postcode;
    private String city;
    private String state;
    private String phoneNo;
    private String pubusertype;
    private String lastlogin;


    public String getPubusertype() {
        return pubusertype;
    }

    public void setPubusertype(String pubusertype) {
        this.pubusertype = pubusertype;
    }

    public String getLastlogin() {
        return lastlogin;
    }

    public void setLastlogin(String lastlogin) {
        this.lastlogin = lastlogin;
    }
    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    
    public String getUserType() {
        return pubusertype;
    }

    public void setUserType(String pubusertype) {
        this.pubusertype = pubusertype;
    }
    
    public String getlastlogin() {
        return lastlogin;
    }

    public void setLastLogin(String lastlogin) {
        this.lastlogin = lastlogin;
    }
    
     public int getActiveUserId() {
        return userId;
    }


}