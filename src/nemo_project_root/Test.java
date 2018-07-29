package nemo_project_root;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class Test {
	
	private String cityCode = "";
	
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
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
}
