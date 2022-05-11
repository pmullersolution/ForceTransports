global class accountClassFuture 
{
    @future
    public static void myFuture(id id: idCliente) 
    {
        for (Account Acclist : [Select id, Name From Account where id = idCliente]) 
        {
            Messaging.
        }
    }
}
