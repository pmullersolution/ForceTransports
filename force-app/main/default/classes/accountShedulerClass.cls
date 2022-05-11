global class accountShedulerClass implements Schedulable
{
    global void execute(SchedulableContext SC)
    {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'sergio.baca@me.com'}; 
            String[] ccAddresses = new String[] {'sergi65@gmail.com'};
            
            mail.setToAddresses(toAddresses);
            mail.setCcAddresses(ccAddresses);
            mail.setReplyTo('sergio.baca@me.com');
            mail.setSenderDisplayName('Curso Power Solutions');
            mail.setSubject('Hola Clase programable');
            mail.setBccSender(false);
            mail.setUseSignature(false);
            mail.setPlainTextBody('Curso Power Solutions');

            mail.setHtmlBody('Your case:<b> </b>has been created.<p>'+
                'To view your case <a href=https://MyDomainName.my.salesforce.com/>click here.</a>');

            // Send the email you have created.
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}
