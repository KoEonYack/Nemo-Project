package nemo_project_root;
import java.util.ArrayList;
import java.util.HashMap;

public class TestMain {

	public static void main(String[] args) throws Exception {
		Test t = new Test();
		String xml=t.restClient();
		System.out.println(xml);
		Parser parser = new Parser();
		ArrayList<HashMap<String, Object>> testList = parser.parserTest();
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i);
			System.out.println("here : " + test);
			//System.out.println("code : " + test.get("code"));
			//System.out.println("name : " + test.get("nodename"));
		}
	}

}
