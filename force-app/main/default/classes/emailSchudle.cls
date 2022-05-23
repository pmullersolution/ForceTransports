global class emailSchudle implements Schedulable
{
    global void execute(SchedulableContext SC)
    {

            Integer d = Date.today().day();
            Integer m = Date.today().month();
            list<Messaging.SingleEmailMessage> mess = new List<Messaging.SingleEmailMessage>();
//             
            List<Contact> listContacts = [SELECT id, name,birthdate,email, dia__c, mes__c FROM contact];
            for (Contact c : listContacts) {
                if (c.dia__c==d && c.mes__c==m){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    String[] toAddresses = new String[] {c.email};
                    mail.setToAddresses(toAddresses);
                    mail.setSubject('Feliz Cumple!!!!!! Que cumplas para atras');
                    mail.setPlainTextBody('Me gusta apex, no es tan facil');
                    mess.add(mail);
                    //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                    //mess.add(mail);
                } 
            }
            Messaging.sendEmail( mess);
            
    }
}
