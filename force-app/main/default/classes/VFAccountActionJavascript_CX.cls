public class VFAccountActionJavascript_CX {
    public Account Acc {get;set;}
    public VFAccountActionJavascript_CX(ApexPages.StandardController controller) {
       Acc = (Account)controller.getRecord();     
    }
    public void save(){
        Database.insert(Acc,false);
    }
}