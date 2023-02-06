/*
    Trigger Description         :   Saved the history of account in Account History Object
    Trigger Object              :   Account
    Trigger Event               :   After Update
    Trigger Created on          :   09-12-22  10:45 PM
    Trigger Dev. Name and Id    :   Miss. Sneha Nistane SF0023
    Trigger Update on           :   09-12-22  10:45 PM

*/
trigger TriggerAccountHistory on Account (after update) {
    List <Account_History__c> ListAccHist = new List<Account_History__c>();
    for(Account Acc:Trigger.old){
        Account_History__c AccHis = new Account_History__c();
        AccHis.Account__c = Acc.Id;
        AccHis.Account_Name__c = Acc.Name;
        AccHis.Account_Number__c = Acc.AccountNumber;
        AccHis.Phone__c = Acc.Phone;
        AccHis.Rating__c = Acc.Rating;
        ListAccHist.add(AccHis);
    }
    if(!ListAccHist.isEmpty()){
        database.insert(ListAccHist);
    }
}