/*
    Trigger Description         :   To not Accept Cold Status Validation
    Trigger Object              :   Account
    Trigger Event               :   Before Insert
    Trigger Created on          :   08-12-22  10:45 PM
    Trigger Dev. Name and Id    :   Miss. Sneha Nistane SF0023
    Trigger Update on           :   08-12-22  10:45 PM

*/
trigger TriggerAccountRatingCold on Account (before insert) {
    for(Account acc:Trigger.new){
        if(acc.Rating == 'Cold'){
            acc.Rating.addError('This account is not created');
        }
    }
}