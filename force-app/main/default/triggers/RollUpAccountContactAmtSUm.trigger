trigger RollUpAccountContactAmtSUm on Contact (after insert,after update,before delete,after undelete) {
	set <Id> setId = new set<Id>();
    if((trigger.isAfter && trigger.isInsert) || (trigger.isAfter && trigger.isUpdate) || 
       											(trigger.isAfter && trigger.isUndelete)){
        for(Contact con:trigger.new){
            setId.add(con.AccountId);
        }
    }
    if((trigger.isBefore && trigger.isDelete)){
        for(Contact con:trigger.old){
            setId.add(con.AccountId);
        }
    }
    Map <Id,Account> mapAcc = new Map<Id,Account>();
    for(Account acc:[select id,Total_Amount__c from Account where id in:setId]){
        mapAcc.put(acc.id,acc);
    }
    List <Account> AccUpdate = new List<Account>();
    if((trigger.isAfter && trigger.isInsert) || (trigger.isAfter && trigger.isUpdate) || 
       											(trigger.isAfter && trigger.isUndelete)){
        for(Contact con:trigger.new){
            if(mapAcc.containsKey(con.AccountId)){
                mapAcc.get(con.AccountId).Total_Amount__c = mapAcc.get(con.AccountId).Total_Amount__c + con.Amount__c;
            }
        }
    }
     if((trigger.isBefore && trigger.isDelete)){
        for(Contact con:trigger.old){
            if(mapAcc.containsKey(con.AccountId)){
                mapAcc.get(con.AccountId).Total_Amount__c = mapAcc.get(con.AccountId).Total_Amount__c - con.Amount__c;
            }
        }
    }
    AccUpdate.addAll(mapAcc.values());
    database.update(AccUpdate,false);
}