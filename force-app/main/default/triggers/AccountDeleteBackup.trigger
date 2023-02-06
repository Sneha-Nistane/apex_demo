/*
    Trigger Description         :   Maintain Deleted record backup of account in Account Backup Object
    Trigger Object              :   Account
    Trigger Event               :   before delete
    Trigger Created on          :   09-12-22  10:45 PM
    Trigger Dev. Name and Id    :   Miss. Sneha Nistane SF0023
    Trigger Update on           :   09-12-22  10:45 PM

*/
trigger AccountDeleteBackup on Account (before delete) {
    List <Account_Backup__c> ListAB = new List<Account_Backup__c>();
    for(Account Acc:Trigger.old){
        if(Acc != Null){
           	Account_Backup__c AB = new Account_Backup__c();
            AB.Account_Name__c = Acc.Name;
            AB.Account_Number__c = Acc.AccountNumber;
            AB.Phone__c = Acc.Phone;
            AB.Rating__c = Acc.Rating;
            ListAB.add(AB); 
        }
    }
    if(!ListAB.isEmpty()){
        database.insert(ListAB,false);
    }
}