public class VFAccountDemo1_CX {
    public Account Acc;
    public VFAccountDemo1_CX(ApexPages.StandardController controller) {
        Acc = (Account)controller.getRecord();
    }
    public void save(){
        insert Acc;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Account Created Successfully'));
    }

}