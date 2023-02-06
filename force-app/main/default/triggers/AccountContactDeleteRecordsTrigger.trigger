trigger AccountContactDeleteRecordsTrigger on Account (before Delete) {
    Set<Id> setAcc = new Set<Id>();
    for(Account acc:trigger.old){
        setAcc.add(acc.Id);
    }
    List <Account> listAcc = new List<Account>();
    for(Account Acc:[select Id,name, (select id from Contacts) from Account where Id=:setAcc]){
        listAcc.add(Acc);
    }
    List <Contact> listCon = new List<Contact>();
    for(Account A:listAcc){
        listCon.add(A.Contacts);
    }
    delete listCon;
    delete listAcc;
}