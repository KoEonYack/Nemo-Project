package nemo_project_root;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.SAXException;


public class Parser {
	
	private String cityCode = "";
	
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	public ArrayList<HashMap<String, Object>> parserTest() throws ParserConfigurationException{
		
		ArrayList<HashMap<String, Object>> testList = new ArrayList<HashMap<String, Object>>();
		
		String addr = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList?";
		String serviceKey ="serviceKey=m4KM1T%2BEowdd34qwVcuNf8XXA%2FtWRVay0Dym8myQhHM9AkfxDvl%2FwJlrXgTdsin7c64gVp94noNG4CdMnYzaag%3D%3D&";
		String parameter = "";
		
		parameter = parameter + "&" + "cityCode=" + cityCode;
		//parameter = parameter + "&" + "pageNo=1";
		//parameter = parameter + "&" + "MobileOS=ETC";
		//parameter = parameter + "&" + "MobileApp=Apptesting";
		
		addr = addr + serviceKey + parameter;
		System.out.println(addr);
		
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder parser = f.newDocumentBuilder();
		
		Document xmlDoc = null;
		String paseUrl = addr;
		try {
			xmlDoc = parser.parse(paseUrl);
		} catch (SAXException | IOException e) {
			e.printStackTrace();
		}
		
		Element root = xmlDoc.getDocumentElement();
		
		int length = root.getElementsByTagName("nodeid").getLength();
		
		for(int i=0; i<length; i++) {
			Node nodeid = root.getElementsByTagName("nodeid").item(i);
			Node nodename = root.getElementsByTagName("nodename").item(i);
			
			HashMap<String, Object> parseTest = new HashMap<String, Object>();
			parseTest.put("nodeid", nodeid.getTextContent());
			parseTest.put("nodename", nodename.getTextContent());
			testList.add(parseTest);
		}
		
		
		return testList;
	}
	
}
