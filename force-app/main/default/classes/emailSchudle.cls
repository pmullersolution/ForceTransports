global class emailSchudle implements Schedulable {

    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    String[] toAddresses = new String[] {'sergio.baca@me.com'};


    global void emailSchudle(SchedulableContext SC) {

        Integer mes = DATE.MONTH();
        Integer dia = DATE.DAY();

        System.debug(dia,mes);
        for (Contact a : [SELECT email FROM Contact where dia = 'a.dia__c' AND mes = 'a.mes__c']) {
           
            mail.setToAddresses(a.email);
            mail.setSenderDisplayName('Feliz cumple');
            mail.setSubject('Hola Clase programable');
            mail.setBccSender(false);
            mail.setUseSignature(false);
            mail.setPlainTextBody('Hoy te deseamos un feliz cumpleanio');

            mail.setHtmlBody('Your case:<b> </b>has been created.<p>'+
                'To view your case <a href=https://MyDomainName.my.salesforce.com/>click here.</a>');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}
