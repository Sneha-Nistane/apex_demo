/*
    Trigger Description         :   To add Prefix depemds on Gender
    Trigger Object              :   Student_Detail__c
    Trigger Event               :   Before Insert
    Trigger Created on          :   05-12-22  10:45 PM
    Trigger Dev. Name and Id    :   Miss. Sneha Nistane SF0023
    Trigger Update on           :   05-12-22  10:45 PM

*/
trigger StudentPrefixGenderDemo on Student_Detail__c (before insert) {
    for(Student_Detail__c stud:Trigger.new){
        if(stud.Gender__c == 'Male'){
            stud.First_Name__c = 'Mr.'+stud.First_Name__c;
        }
        if(stud.Gender__c == 'Female'){
            stud.First_Name__c = 'Miss.'+stud.First_Name__c;
        }
        if(stud.Gender__c == 'Trangender' || stud.Gender__c == 'Unknown'){
            stud.Gender__c.addError('This Person is not Allowed');
        }
    }
}