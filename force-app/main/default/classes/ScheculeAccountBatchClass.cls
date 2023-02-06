public class ScheculeAccountBatchClass implements schedulable{
    public void execute(SchedulableContext SC){
        AccountBatchClass abc = new AccountBatchClass();
        Database.executeBatch(abc,20);
    }
}