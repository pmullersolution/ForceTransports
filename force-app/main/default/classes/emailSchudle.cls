global class emailSchudle implements Schedulable
{
    global void execute(SchedulableContext SC)
    {
            Messaging.SingleEmailMessage mess = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'sergio.baca@me.com'}; 

            Integer d = Date.today().day();
            Integer m = Date.today().month();
            System.debug('Month:'+m+'Day:'+d);
            List<Contact> listContacts = [SELECT id, name,birthdate, dia__c, mes__c FROM contact];
            for (Contact c : listContacts) {
                if (c.dia__c==d && ctc.mes__c==m){
                    System.debug('HAY MATCH DE'+dia__c+'con TODAY:'+d);
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(toAddresses);
                    mail.setSenderDisplayName('Curso Power Solutions');
                    mail.setSubject('Hola Clase programable');
                    mail.setBccSender(false);
                    mail.setUseSignature(false);
                    mail.setPlainTextBody('Curso Power Solutions');
                    mess.add(mail);
                } else {
                    System.debug('NO SE CUMPLE MATCH');
                }
            }
            Messaging.sendEmail( mess);
    }
}
