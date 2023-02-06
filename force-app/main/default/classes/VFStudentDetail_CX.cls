public class VFStudentDetail_CX {
    public Student_Detail__c stud;
    public VFStudentDetail_CX(ApexPages.StandardController controller) {
        stud = (Student_Detail__c)controller.getRecord();
    }
    public void save(){
        if(!String.isBlank(stud.Gender__c)){
            try{
                if(stud.Gender__c == 'Male'){
                    stud.First_Name__c = 'Mr.'+stud.First_Name__c;
                }
                if(stud.Gender__c == 'Female'){
                    stud.First_Name__c = 'Miss.'+stud.First_Name__c;
                }
                if(stud.Gender__c == 'Trangender' || stud.Gender__c == 'Unknown'){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Trangender Or Unknown not allowed'));
                }
                insert stud;
            }
            catch(Exception e){
                System.debug('The following error has occured'+e.getMessage());
            }
        }else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Select Gender'));
        }
    }
}