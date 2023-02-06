trigger RollUpAccountContactCount on Contact (after insert,after update,before delete,after undelete) {
    set <Id> setId = new set<Id>();
    if((trigger.isAfter && trigger.isInsert) || (trigger.isAfter && trigger.isUpdate) || (trigger.isAfter && trigger.isUndelete)){
        for(Contact con:trigger.new){
            setId.add(con.AccountId);
        }
    }
    if((trigger.isBefore && trigger.isDelete)){
        for(Contact con:trigger.old){
            setId.add(con.AccountId);
        }
    }
    List <Account> listAcc = new List<Account>();
    for(Account acc:[select name,No_of_Contact__c,(select id,firstname from contacts) from Account where id in:setId]){
        acc.No_of_Contact__c = acc.contacts.size();
        listAcc.add(acc);
    }
    database.update(listAcc,false);
}