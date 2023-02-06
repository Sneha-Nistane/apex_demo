public class IntegrationJsonGenDemo {
	public void createJson(string nm,string ph)
    {
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        try{
           Account A = new Account();
            A.name = nm;
            A.Phone = ph;
            Insert A;
            js.writeStringField('Status', 'Success');
            js.writeIdField('Account Id',A.id);
            js.writeNumberField('Success Code Number', 100);
        }catch(Exception e){
            js.writeStringField('Status', 'Failed');
            js.writeNumberField('Failed Code Number', 200);
		}
        js.writeEndObject();
        string Result = js.getAsString();
        system.debug(Result);
	}
}