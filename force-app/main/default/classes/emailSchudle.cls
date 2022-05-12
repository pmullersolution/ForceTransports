global class emailSchudle implements Schedulable
{
    global void execute(SchedulableContext SC)
    {
            String[] toAddresses = new String[] {'sergio.baca@me.com'}; 
            Integer d = Date.today().day();
            Integer m = Date.today().month();
            System.debug('Month:'+m+'Day:'+d);
            List<Contact> listContacts = [SELECT id, name,birthdate, dia__c, mes__c FROM contact];
            for (Contact c : listContacts) {
                if (c.dia__c==d && c.mes__c==m){
                    System.debug('HAY MATCH DE'+c.dia__c+'con TODAY:'+d);
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(toAddresses);
                    mail.setSubject('Hola Sergio Feliz CUMPLE');
                    mail.setPlainTextBody('Me gusta apex por facil');
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                } else {
                    System.debug('NO SE CUMPLE MATCH');
                }
            }
    }
}
