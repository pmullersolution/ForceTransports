global class accountClassFuture 
{
    @future
    public static void myFuture(String IdCliente)
    {
        list<Messaging.SingleEmailMessage> mess = new List<Messaging.SingleEmailMessage>();
        String[] toAddresses = new String[] {'jpostigo@powersolution.com.ar'}; 

        
        for(Account Acclist : (List<Account>) JSON.deserialize(IdCliente, List<Account>.class))
        {

           if (Acclist.Id != null)  {

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(toAddresses);
            mail.setSubject('Hola Sergio, se creo el cliente '+Acclist.name);
            mail.setPlainTextBody('Me gusta apex por facil');
            mess.add(mail);
        }

        }

        Messaging.sendEmail(mess);
    }
}