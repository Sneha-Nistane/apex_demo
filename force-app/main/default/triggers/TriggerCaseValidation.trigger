/*
    Trigger Description         :   To not Accept STatus=working,priority=Medium,Origin=Phone Status Validation
    Trigger Object              :   Case
    Trigger Event               :   Before Insert
    Trigger Created on          :   08-12-22  10:45 PM
    Trigger Dev. Name and Id    :   Miss. Sneha Nistane SF0023
    Trigger Update on           :   08-12-22  10:45 PM

*/
trigger TriggerCaseValidation on Case (before insert) {
    for(Case ca:Trigger.new){
        if(ca.Status == 'Working' && ca.Priority == 'Medium' && ca.Origin == 'Phone'){
            ca.CaseNumber.addError('This Case will not create');
        }
    }
}