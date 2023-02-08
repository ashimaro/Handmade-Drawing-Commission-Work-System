package model;

/**
 *
 * @author Ashwini
 */
public class Feedback implements java.io.Serializable {
    protected int feedbackId;
    protected String feedback;
    private int userId;
    private int commissionId;
    protected int feedbackstar;
    
public Feedback() {}

public Feedback(String feedback){
    super();
    this.feedback = feedback;
}  
public Feedback (int feedbackId , String feedback, int feedbackstar){
    super();
    this.feedbackId= feedbackId;
    this.feedback=feedback;
    this.feedbackstar=feedbackstar;
}

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    
    public void setFeedbackStar(int feedbackstar) {
        this.feedbackstar = feedbackstar;
    }
    
    public int getFeedbackStar() {
        return feedbackstar;
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
    
    

}