package model;

import javax.servlet.http.Part;

/**
 *
 * @author ashwini
 */
public class DrawingDetails implements java.io.Serializable {
   
    protected int drawingDetailsId;
    protected int figureNo;
    protected Part imageOrder;
    
    
    protected Part imageOrder1;
    protected Part imageOrder2;
    protected Part imageOrder3;
    protected Part imageOrder4;
    protected Part backgroundImage;

  
    
    private int userId;
    private int commissionId;
    private String status;
    private Double bgPrice;


 
    
    public DrawingDetails(){}

    public DrawingDetails (int figureNo){
        super();
        this.figureNo=figureNo;
    }
    
    public DrawingDetails (int drawingDetailsId, int figureNo){
        super();
        this.drawingDetailsId =drawingDetailsId;
        this.figureNo=figureNo;
    }
    public DrawingDetails (int drawingDetailsId, int figureNo, int commissionId, int userId){
        super();
        this.drawingDetailsId =drawingDetailsId;
        this.figureNo=figureNo;
        this.commissionId=commissionId;
        this.userId= userId;
    }

    public int getDrawingDetailsId() {
        return drawingDetailsId;
    }

    public void setDrawingDetailsId(int drawingDetailsId) {
        this.drawingDetailsId = drawingDetailsId;
    }

    public int getFigureNo() {
        return figureNo;
    }

    public void setFigureNo(int figureNo) {
        this.figureNo = figureNo;
    }

    public Part getImageOrder() {
        return imageOrder;
    }

    public void setImageOrder(Part imageOrder) {
        this.imageOrder = imageOrder;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCommissionId() {
        return commissionId;
    }

    public void setCommissionId(int commissionId) {
        this.commissionId = commissionId;
    }
   public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Double getBgPrice() {
        return bgPrice;
    }

    public void setBgPrice(Double bgPrice) {
        this.bgPrice = bgPrice;
    }
    
      public Part getImageOrder1() {
        return imageOrder1;
    }

    public void setImageOrder1(Part imageOrder1) {
        this.imageOrder1 = imageOrder1;
    }

    public Part getImageOrder2() {
        return imageOrder2;
    }

    public void setImageOrder2(Part imageOrder2) {
        this.imageOrder2 = imageOrder2;
    }

    public Part getImageOrder3() {
        return imageOrder3;
    }

    public void setImageOrder3(Part imageOrder3) {
        this.imageOrder3 = imageOrder3;
    }

    public Part getImageOrder4() {
        return imageOrder4;
    }

    public void setImageOrder4(Part imageOrder4) {
        this.imageOrder4 = imageOrder4;
    }

    public Part getBackgroundImage() {
        return backgroundImage;
    }

    public void setBackgroundImage(Part backgroundImage) {
        this.backgroundImage = backgroundImage;
    }
}
