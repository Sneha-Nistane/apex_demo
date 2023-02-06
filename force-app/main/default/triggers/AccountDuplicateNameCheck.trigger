/*
    Trigger Description         :   Check Duplicate Account Name in account object
    Trigger Object              :   Account
    Trigger Event               :   After Update
    Trigger Created on          :   09-12-22  10:45 PM
    Trigger Dev. Name and Id    :   Miss. Sneha Nistane SF0023
    Trigger Update on           :   09-12-22  10:45 PM

*/
trigger AccountDuplicateNameCheck on Account (before insert,before update,after undelete) {
    Set<String> SetAcc = new Set<String>();
    for(Account acc:Trigger.new){
        SetAcc.add(acc.Name);
    }
    List<Account> ListAcc = [select Id,Name from Account where Name=:SetAcc];
    for(Account Acc:Trigger.new){
       if(ListAcc.size() > 0){
            Acc.Name.addError('This Account is alredy present');
        }
    }
}