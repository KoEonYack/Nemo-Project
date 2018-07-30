package nemo_project_root;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class Test {
	
	private String cityCode = "";
	private String DepPlaceId = "";
	private String ArrPlaceId = "";
	private String DepPlandTime = "";
	
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	public void setDepPlaceId(String DepPlaceId) {
		this.DepPlaceId = DepPlaceId;
	}
	
	public void setArrPlaceId(String ArrPlaceId) {
		this.ArrPlaceId = ArrPlaceId;
	}
	
	public void setDepPlandTime(String DepPlandTime) {
		this.DepPlandTime = DepPlandTime;
	}
	
	
	public String restClient() throws Exception{
		String addr = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList?";
		String serviceKey ="serviceKey=m4KM1T%2BEowdd34qwVcuNf8XXA%2FtWRVay0Dym8myQhHM9AkfxDvl%2FwJlrXgTdsin7c64gVp94noNG4CdMnYzaag%3D%3D&";
		String parameter = "";
	
		parameter = parameter + "&" + "cityCode=" + cityCode;
		// parameter = parameter + "&" + "pageNo=1";
		// parameter = parameter + "&" + "MobileOS=ETC";
		// parameter = parameter + "&" + "MobileApp=Apptesting";
		
		addr = addr + serviceKey + parameter;
		System.out.println(addr);
		
		URL url = new URL(addr);
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));

		String inLine;
		String xml="";
		while((inLine = in.readLine()) != null) xml = inLine;
		in.close();
		
		return xml;
	}
	
	public String restClientCity() throws Exception{

		String addr = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?";
		String serviceKey ="serviceKey=m4KM1T%2BEowdd34qwVcuNf8XXA%2FtWRVay0Dym8myQhHM9AkfxDvl%2FwJlrXgTdsin7c64gVp94noNG4CdMnYzaag%3D%3D&";
		String parameter = "";
		
		parameter = parameter + "&" + "numOfRows=150";
		parameter = parameter + "&" + "pageSize=100";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "StartPage=1";
		parameter = parameter + "&" + "depPlaceId=" + DepPlaceId;
		parameter = parameter + "&" + "arrPlaceId=" + ArrPlaceId;
		parameter = parameter + "&" + "depPlandTime=" + DepPlandTime;
		parameter = parameter + "&" + "trainGradeCode=00";
		addr = addr + serviceKey + parameter;
		
		System.out.println(addr);
		
		URL url = new URL(addr);
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));

		String inLine;
		String xml="";
		while((inLine = in.readLine()) != null) xml = inLine;
		in.close();
		
		return xml;
	}
	
	
	
	
	
}
