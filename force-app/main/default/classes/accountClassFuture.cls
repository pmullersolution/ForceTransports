global class accountClassFuture 
{
    @future
    public static void myFuture(id IdCliente)
    {
        for(Account Acclist : [Select id, Name From Account where id = :IdCliente])
        {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'sergio.baca@me.com'}; 
            mail.setToAddresses(toAddresses);
            mail.setSubject('Hola Sergio, se creo el cliente '+Acclist.name);
            mail.setPlainTextBody('Me gusta apex por facil');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}
