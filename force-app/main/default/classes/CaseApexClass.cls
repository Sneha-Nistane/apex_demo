public class CaseApexClass {
	List<Account> ListAcc = [select Id,Name from Account where Id='0015g0000147nFMAAY' OR Id='0015g0000145pZqAAI' Order by CreatedDate desc];
    String accountid = NULL;String accountid1 = NULL;
    List<Case> Listcase = [select id, Priority, Status, Origin, Type,AccountId from Case];
    List<Case> UpdateList = new List<Case>();
    public void updateRecord(){
        for(Account acc:ListAcc){
            if(acc.Id == '0015g0000147nFMAAY'){
                accountid = acc.Id;
            }
            if(acc.Id == '0015g0000145pZqAAI'){
                accountid1 = acc.Id;
            }
        }
        for(Case Cas:Listcase){
            if(Cas.Priority == 'High'){
                Cas.AccountId = accountid;
                Cas.Status = 'Working';
                Cas.Origin = 'Email';
                Cas.Type = 'Electrical';
                UpdateList.add(Cas);
            }
            if(Cas.Priority == 'Low'){
                Cas.AccountId = accountid1;
                Cas.Status = 'New'; 
                Cas.Origin = 'Phone'; 
                Cas.Type = 'Other'; 
                UpdateList.add(Cas);
            }
        }
        database.update(UpdateList,false);
    }
}