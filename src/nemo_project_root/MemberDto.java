package nemo_project_root;

import java.sql.*;

public class MemberDto {
	
	private String id;
	private String pw;
	//private String pw2;
	private String name;
	private String studentnumber;
	private String phonenumber;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	/* public String getPw2() {
		return pw2;
	}
	
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	} */

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getStudentnumber() {
		return studentnumber;
	}

	public void setStudentnumber(String studentnumber) {
		this.studentnumber = studentnumber;
	}


	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	
}