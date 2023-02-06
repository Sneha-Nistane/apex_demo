public class IntegrationJsonParserDemo1 {
	public string JsonString{get;set;}
    public Map<String,object> result {get;set;}
    String nm;
    string rat;
    public void IntegrationJsonParserDemo12(){
		Map<String,object> result = new Map<String,object>();
        JsonString = '{"Name":"Sneha Parser test","Rating":"Hot"}';
        system.JSONParser jp = JSON.createParser(JsonString);
        while(jp.nextToken() != null){
            if(jp.getText() == 'Name'){
                jp.nextToken();
                nm = jp.getText();
            }
            if(jp.getText() == 'Rating'){
                jp.nextToken();
                rat = jp.getText();
            }
        }
        Account A = new Account();
        A.Name = nm;
        A.Rating = rat;
        insert A;
    }
}