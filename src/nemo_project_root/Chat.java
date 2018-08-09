package nemo_project_root;

public class Chat {
	
	// auto_increment - ID값이 클수록 최근 메세지 
	int messageID;
	int articleID;
	
	String chatRoomId ;
	String userID;
	String userName ;
	String message;
	String chatTime ;
	
	
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public Integer getMessageID() {
		return messageID;
	}
	public void setMessageID( Integer messageID ) {
		this.messageID = messageID;
	}
	public Integer getArticleID() {
		return articleID;
	}
	public void setArticleID( Integer articleID) {
		this.articleID = articleID;
	}
	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName; 
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	
}

