trigger TriggerSendEMailStudent on Student_Detail__c (after insert) {
    List <Messaging.SingleEmailMessage> Listmail = new List <Messaging.SingleEmailMessage>(); 
    for(student_Detail__c stud: Trigger.new)
    {
        if(stud.Email_Id__c != null){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new string[]{stud.Email_Id__c});
            mail.setSenderDisplayName('Sneha Send the Mail');
            mail.setSubject('Happy BirthDay'+stud.First_Name__c );
            mail.setPlainTextBody('Happy BirthDay'+stud.First_Name__c );
            Listmail.add(mail);
        }
    }
    if(!Listmail.isEmpty()){
        Messaging.SendEmailResult[] results = Messaging.sendEmail(Listmail);
        for(Messaging.SendEmailResult mr:results){
            if(mr.isSuccess()){
                //Do something for success
            }else{ //operation failed
                for(Messaging.SendEmailError err:mr.getErrors()){
                    System.debug('The following error has occured');
                    System.debug(err.getStatusCode()+' : '+ err.getMessage());
                    System.debug('Fields that affected this error:'+err.getFields());
                } 
            }
        }
    }
}