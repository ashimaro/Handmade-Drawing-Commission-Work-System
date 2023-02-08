
package model;

import javax.servlet.http.Part;  /**For image*/

/**
 *
 * @author Ashwini
 */
public class commissionWork implements java.io.Serializable{
    
    private int commissionId;
    private String commissionName;
    private double commissionPrice;
    private double commissionBackground;
    private String commissionDesc; 
     
    private Part commissionImage;
   
    private Part commissionImage2;
    
    private int artistId;

   
   public commissionWork(){
       
   }

   
 public commissionWork(int commissionId,String commissionName,double commissionPrice,double commissionBackground, String commissionDesc, int artistId){
     this.commissionId=commissionId;
     this.commissionName=commissionName;
     this.commissionPrice=commissionPrice;
     this.commissionBackground=commissionBackground;
     this.commissionDesc=commissionDesc;
     this.artistId = artistId;
     
   }
    
    public int getCommissionId() {
        return commissionId;
    }

    public void setCommissionId(int commissionId) {
        this.commissionId = commissionId;
    }

    public String getCommissionName() {
        return commissionName;
    }

    public void setCommissionName(String commissionName) {
        this.commissionName = commissionName;
    }

    public double getCommissionPrice() {
        return commissionPrice;
    }

    public void setCommissionPrice(double commissionPrice) {
        this.commissionPrice = commissionPrice;
    }

  

    public double getCommissionBackground() {
        return commissionBackground;
    }

    public void setCommissionBackground(double commissionBackground) {
        this.commissionBackground = commissionBackground;
    }

    public String getCommissionDesc() {
        return commissionDesc;
    }

    public void setCommissionDesc(String commissionDesc) {
        this.commissionDesc = commissionDesc;
    }

    public Part getCommissionImage() {
        return commissionImage;
    }

    public void setCommissionImage(Part commissionImage) {
        this.commissionImage = commissionImage;
    }

    public Part getCommissionImage2() {
        return commissionImage2;
    }

    public void setCommissionImage2(Part commissionImage2) {
        this.commissionImage2 = commissionImage2;
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }
   
   
    
    
}
