public class AccountApexClass {
    List <Account> ListAcc = [select Id,name,Rating, Type, SLA__c, NumberOfEmployees, Industry from Account];
    List <Account> updateList = new List <Account>();
    public void updateRecords(){
        for(Account Acc:ListAcc){
            if(Acc.Rating == 'Hot'){
                Acc.Type = 'Customer - Channel'; 
                Acc.SLA__c = 'Gold';
                Acc.Industry ='Agriculture'; 
                Acc.NumberOfEmployees = 100;
                updateList.add(Acc);
            }
            if(Acc.Rating == 'Cold'){
                Acc.Type = 'Installation Partner'; 
                Acc.SLA__c = 'Silver';
                Acc.Industry ='Banking'; 
                Acc.NumberOfEmployees = 50;
                updateList.add(Acc);
            }
        }
        database.update(updateList,false);
    }
}