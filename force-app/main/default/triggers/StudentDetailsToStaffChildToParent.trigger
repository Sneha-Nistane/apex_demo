trigger StudentDetailsToStaffChildToParent on Student_Detail__c (After insert) {
    set<id> setstaff = new set<id>();
    for(Student_Detail__c stud:trigger.new){
        setstaff.add(stud.Staff_Detail__c);
    }
    Map<id,Staff_Details__c> mapStaff = new Map<id,Staff_Details__c>();
    for(Staff_Details__c staff:[select id,Salary__c from Staff_Details__c where id =:setstaff]){
        mapStaff.put(staff.id,staff);
    }
    List <Staff_Details__c> liststaff = new List <Staff_Details__c>();
    //List <Student_Detail__c> liststud = new List <Student_Detail__c>();
    for(Student_Detail__c stud:trigger.new){
        if(stud.Gender__c == 'Male'){
            //stud.Hostel_Facility__c = true;
            
            if(mapStaff.containsKey(stud.Staff_Detail__c)){
                mapStaff.get(stud.Staff_Detail__c).Salary__c = mapStaff.get(stud.Staff_Detail__c).Salary__c + stud.Tution_Fees__c;
            } 
           //liststud.add(stud);
        }
    }
    liststaff.addAll(mapStaff.values());
    database.update(liststaff,false);
    //database.update(stud,false);
}