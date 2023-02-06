trigger CaseForNewStatusTrigger on Case (after insert,after update) {
	List <Messaging.SingleEmailMessage> Listmail = new List <Messaging.SingleEmailMessage>(); 
    for(Case C: Trigger.new)
    {
        if(C.Status == 'New'){
            if(trigger.isAfter && trigger.isInsert){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new string[]{'nistanesneha@gmail.com'});
                mail.setSenderDisplayName('Sneha Send the Mail');
                mail.setSubject('Case status'+C.CaseNumber+' is a new Case');
                mail.setPlainTextBody('Your Case Number'+C.CaseNumber+' is a new Case' );
                Listmail.add(mail);
            }
            if(trigger.isAfter && trigger.isUpdate){
                if(C.Status != Trigger.oldMap.get(C.id).status){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new string[]{'nistanesneha@gmail.com'});
                    mail.setSenderDisplayName('Sneha Send the Mail');
                    mail.setSubject('Case status'+C.CaseNumber+' is a new Case');
                    mail.setPlainTextBody('Your Case Number'+C.CaseNumber+' is a new Case' );
                    Listmail.add(mail);
                }
        	}	
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