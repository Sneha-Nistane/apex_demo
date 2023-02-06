public class IntegrationJsonGenDemo1 {
	public void createJson()
    {
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        try{
           List <Account> ListAcc = [Select id,Name,Phone From Account where phone <> Null];
            for(Account Acc:ListAcc){
                js.writeStringField('Account Name', Acc.Name);
                js.writeStringField('Account Phone', Acc.Phone);
                js.writeStringField('Status', 'Success');
                js.writeNumberField('Success Code Number', 100);
            }
           
        }catch(Exception e){
            js.writeStringField('Status', 'Failed');
            js.writeNumberField('Failed Code Number', 200);
		}
        js.writeEndObject();
        string Result = js.getAsString();
        system.debug(Result);
	}
}