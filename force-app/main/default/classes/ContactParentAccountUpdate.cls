public class ContactParentAccountUpdate {
	List<Contact> Listcon = [select id,AccountId,Description,Account.Id, Account.Description from Contact 
                             where Account.Rating ='Hot' AND AccountId='0015g0000145pZqAAI'];
    List<Account> updateAcc = new  List<Account>();
    public void updateAccount(){
        for(Contact con:Listcon){
           	Account acc = new Account();
            acc.Id = con.AccountId;
            acc.Description = con.Description;
            updateAcc.add(acc);
            
        }
        database.update(updateAcc,false);
    }
}