trigger AccountToContactTrigger on Account (after update) {
    Map<id,Account> mapAcc = new Map<id,Account>();//step 1.Map for Parent (Account)
    for(Account Acc:Trigger.new){
        if(Acc.Type == 'Technology Partner'){
           mapAcc.put(Acc.id,Acc); 
        }
    }
    List <Contact> ListCon = new List<Contact>();
    if(!mapAcc.isEmpty()){
       for(Contact con:[select id,AccountId,LeadSource from Contact where AccountId in:mapAcc.keySet()]){ 
           //step2 list for Child //And step 3 iteration of child
            if(mapAcc.containsKey(con.AccountId)){
                if(mapAcc.get(con.AccountId).Type =='Technology Partner'){
                    con.LeadSource = 'Purchased List';
                    ListCon.add(con);
                }
            }
        } 
        if(!ListCon.isEmpty()){
            database.update(ListCon,false);
        }
    }
    
}