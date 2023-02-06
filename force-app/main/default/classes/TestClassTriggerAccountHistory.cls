@isTest
public class TestClassTriggerAccountHistory {
    @istest
    public static void accountMethod(){
        Account acc = new Account(name='Sneha');
        insert acc;
        acc.Name='Sneha1';
        update acc;
        string AccName = [select Name from Account where id =:acc.id].Name;
        system.assertNotEquals('Sneha1', AccName);
    }
    
}