public class AccountChildContactUpdate {
    public void ContactUpdate(){
        List<Account> ListAcc = [select Id,name,(select id,AccountId,FirstName, LeadSource from Contacts) 
                                 from Account where Rating ='Hot'];
        List<Contact> Listconupdate = new List<Contact>();
        for(Account acc:ListAcc){
            List<Contact> Listcon = acc.Contacts;
            for(Contact con:Listcon){
                con.FirstName = 'Sneha Account Contact';
                con.LeadSource = 'Web';
                Listconupdate.add(con);
            }
            database.update(Listconupdate,false);
        }
    }
}