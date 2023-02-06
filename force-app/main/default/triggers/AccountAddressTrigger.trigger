trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account Acc:trigger.new){
        if(Acc.Match_Billing_Address__c == true){
            Acc.BillingPostalCode = Acc.ShippingPostalCode;
       }
    }
    
}