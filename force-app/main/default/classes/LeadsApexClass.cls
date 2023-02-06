public class LeadsApexClass {
	List<Lead> Listlead = [select id,Rating, Status, Industry,  Account__c  from Lead];
    List<Lead> updateLead = new List<Lead>();
    public void updateRecord(){
        for(Lead L:Listlead){
            if(L.Rating == 'Hot'){
                L.Status = 'Closed - Converted';
                L.Industry = 'Agriculture';
                updateLead.add(L);
            }
            if(L.Rating == 'Cold'){
                L.Status = 'Closed - Not Converted';
                L.Industry = 'Chemicals';
                updateLead.add(L);
            }
        }
        database.update(updateLead,false);
    }
    
}