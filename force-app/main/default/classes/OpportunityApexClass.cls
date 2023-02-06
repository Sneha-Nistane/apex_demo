public class OpportunityApexClass {
	List <Opportunity> ListOpp = [select Id,Name, StageName, Type, LeadSource, Amount from Opportunity];
    List <Opportunity> ListUpdate = new List<Opportunity>();
    public void updateData(){
        for(Opportunity opp:ListOpp){
            if(opp.StageName =='Closed Won'){
                opp.Type = 'Existing Customer - Upgrade'; 
                opp.LeadSource = 'Phone Inquiry'; //Web
                opp.Amount = 15000;
                ListUpdate.add(opp);
            }
            if(opp.StageName =='Closed Lost'){
                opp.Type = 'Existing Customer - Downgrade'; 
                opp.LeadSource = 'Web'; 
                opp.Amount = 20000;
                ListUpdate.add(opp);
            }
        }
        database.update(ListUpdate,false);
    }
}