global class AccountBatchClass implements Database.Batchable<sObject>,Database.stateful{
    integer count = 0;
	global Database.QueryLocator start(Database.BatchableContext BC){
      	String query = 'select id,name,Rating from Account where Ownership=\'Public\'';
        return Database.getQueryLocator(query);
   	}
	global void execute(Database.BatchableContext BC, List<Account> ListAcc){
       List<Account>listacc1 = new List<Account>();
       for(Account acc:ListAcc){
           acc.Rating = 'Hot'; 
           listacc1.add(acc);
           count++;
        }
        Database.update(listacc,false);
        system.debug('done');
    }
   global void finish(Database.BatchableContext BC){
       system.debug('Count of Account Record='+count);
   }
}