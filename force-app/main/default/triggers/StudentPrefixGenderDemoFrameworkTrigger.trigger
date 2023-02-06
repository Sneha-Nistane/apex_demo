trigger StudentPrefixGenderDemoFrameworkTrigger on Student_Detail__c (before insert,before update) {
    if(Trigger.isBefore || Trigger.isInsert){
        StudentPrefixGenderHandler.genderHandler(Trigger.new);
    }
    if(Trigger.isBefore || Trigger.isUpdate){
        StudentPrefixGenderHandler.genderHandler(Trigger.new);
    }
}