public class AccountCreateContact {
    public void createContact(){
        List <Account> ListAcc = [select Id,name from Account where Rating ='Hot'];
        List <Contact> con = new List <Contact>();
        for(Account acc:ListAcc){
            Contact conobj = new Contact();
            conobj.AccountId = acc.Id;
            conobj.LastName   = acc.name;
            con.add(conobj);
        }
        database.insert(con,false);
    }
}