trigger ContactToAccountTrigger on Contact (after insert) {
    set<id> setAcc = new set<id>();
    for(Contact Con:Trigger.new){
        if(Con.AccountId != null){
          setAcc.add(Con.AccountId);
        }
    }
    Map<id,Account> mapAcc = new Map<id,Account>();
    if(!setAcc.isEmpty()){
        for(Account Acc:[select id,description,phone from Account where id in:setAcc]){
            mapAcc.put(Acc.id,Acc);
        } 
    }
    List<Account> ListAcc = new List<Account>();
    for(Contact con:Trigger.new){
        if(mapAcc.containsKey(con.AccountId)){
            mapAcc.get(con.AccountId).description = con.FirstName+' '+con.LastName;
            mapAcc.get(con.AccountId).phone = con.phone;
        }
    }
    ListAcc.addAll(mapAcc.values());
    if(!ListAcc.isEmpty()){
        database.update(ListAcc,false);
   }
}