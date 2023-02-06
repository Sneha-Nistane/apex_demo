public class FutureClassAccount {
	@future
    public static void futureMethod(List <Id> listId){
        List <Account> listacc = [select id,name,Rating from Account where id in :listId];
        List <Account> listAcc1 = new List<Account>();
        for(Account Acc:listacc){
            Acc.rating = 'Cold';
            listAcc1.add(Acc);
        }
        Database.update(listAcc1,false);
    }
}