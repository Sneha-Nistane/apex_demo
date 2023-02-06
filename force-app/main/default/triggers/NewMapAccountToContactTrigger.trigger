trigger NewMapAccountToContactTrigger on Account (after update) {
    List <Contact> ListCon = new List<Contact>();
    for(Contact con:[select id,AccountId,LeadSource from Contact where AccountId in:Trigger.newMap.keySet()]){ 
       ListCon.add(con);
    } 
    List <Contact> ListCon1 = new List<Contact>();
    for(Contact con:ListCon){
        if(Trigger.newMap.containsKey(con.AccountId)){
            if(Trigger.newMap.get(con.AccountId).Type =='Technology Partner'){
                con.LeadSource = 'Purchased List';
                ListCon1.add(con);
            }
        }
    }
    if(!ListCon1.isEmpty()){
        database.update(ListCon1,false);
    }
}