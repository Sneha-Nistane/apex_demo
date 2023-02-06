public class QueueableAccountNameChange implements Queueable{
    public List<Account> accList;
    public QueueableAccountNameChange(List <Account> accList){
        this.accList = accList;
    }
    public void execute(QueueableContext context){
        for(Account acc:accList){
            acc.Name = acc.Name+' Queaueable';
        }
        update accList;
    }
}