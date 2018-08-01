package nemo_project_root;

public class ArticleDto {
	
	private int articleID;
	private String startCity;
	private String endCity;
	private String startStation;
	private String endSatation;
	private String startTime;
	private String endTime;
	private String startDay;
	private String masterUserID;
	private String masterUserName;
	
	public int getArticleID() {
		return articleID;
	}
	public void setArticleID(int articleID) {
		this.articleID = articleID;
	}
	public String getStartCity() {
		return startCity;
	}
	public void setStartCity(String startCity) {
		this.startCity = startCity;
	}
	public String getEndCity() {
		return endCity;
	}
	public void setEndCity(String endCity) {
		this.endCity = endCity;
	}
	public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getEndSatation() {
		return endSatation;
	}
	public void setEndSatation(String endSatation) {
		this.endSatation = endSatation;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getMasterUserID() {
		return masterUserID;
	}
	public void setMasterUserID(String masterUserID) {
		this.masterUserID = masterUserID;
	}
	public String getMasterUserName() {
		return masterUserName;
	}
	public void setMasterUserName(String masterUserName) {
		this.masterUserName = masterUserName;
	}
}
