trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    for(Opportunity opp:Trigger.old){
        if(opp.StageName == 'Closed Won'){
            
        }
    }
}