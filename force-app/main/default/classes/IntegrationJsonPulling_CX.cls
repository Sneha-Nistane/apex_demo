public class IntegrationJsonPulling_CX {
    public List<Account> ListAcc {set;get;}
    public Integer count{set;get;}
    public IntegrationJsonPulling_CX(ApexPages.StandardController controller) {
       showRecords();
    }
    public void showRecords(){
        ListAcc  = [select id,Name,Rating from Account];
        count = ListAcc.size();
    }

}