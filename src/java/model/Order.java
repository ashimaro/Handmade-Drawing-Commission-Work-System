package model;

import javax.servlet.http.Part;

/**
 *
 * @author Ashi
 */
public class Order {

    private int orderId;
    private int drawingDetailsId;
    private int userId;
    private int figureno;
    private int commissionid;
    private int artistId;
    private Part paymentFile;
    private String background;
    private String status;
    private String remarks;
    private String trackingNumber;
    private String transdatetime;
    
    
    private String beginDate;
    private String endDate;

   
   

    public Order() {
    }

    public Order(int orderId, int drawingDetailsId, int userId, int figureno, int commissionid, int artistId, String status) {
        super();
        this.orderId = orderId;
        this.drawingDetailsId = drawingDetailsId;
        this.userId = userId;
        this.figureno = figureno;
        this.commissionid = commissionid;
        this.artistId = artistId;
    }

    public Order(int orderId, int commissionId, int userId, int artistId, int figureno, String status, String trackingNumber) {
        super();
        this.orderId = orderId;
        this.figureno = figureno;
        this.commissionid = commissionId;
        this.userId = userId;
        this.artistId = artistId;
        this.commissionid = commissionid;

        this.trackingNumber = trackingNumber;
    }

    public Order(int orderId, int userId, Part paymentFile) {
        super();
        this.orderId = orderId;

        this.userId = userId;

        this.paymentFile = paymentFile;
    }

    public Order(int drawingDetailsId, int userId) {
        super();

        this.drawingDetailsId = drawingDetailsId;
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getDrawingDetailsId() {
        return drawingDetailsId;
    }

    public void setDrawingDetailsId(int drawingDetailsId) {
        this.drawingDetailsId = drawingDetailsId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFigureNo() {
        return figureno;
    }

    public void setFigureNo(int figureno) {
        this.figureno = figureno;
    }

    public int getCommissionId() {
        return commissionid;
    }

    public void setCommissionId(int commissionid) {
        this.commissionid = commissionid;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Part getPaymentFile() {
        return paymentFile;
    }

    public void setPaymentFile(Part paymentFile) {
        this.paymentFile = paymentFile;
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRemarks() {
        return remarks;
    }

    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

     public String getTransdatetime() {
        return transdatetime;
    }

    public void setTransdatetime(String transdatetime) {
        this.transdatetime = transdatetime;
    }
    
     public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

}
