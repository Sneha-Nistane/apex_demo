public class IntegrationJsonParserDemo {

    public String getA() {
        return null;
    }

    public string JsonString{get;set;}
    public Map<String,object> result {get;set;}
    public IntegrationJsonParserDemo(){
       Map<String,object> result = new Map<String,object>();
        JsonString = '{"Name":"Sneha Parser test","Rating":"Hot"}';
        system.JSONParser jp = JSON.createParser(JsonString);
        while(jp.nextToken() != null){
            result.put(jp.getText(),jp.getCurrentToken());
        }
    }
}