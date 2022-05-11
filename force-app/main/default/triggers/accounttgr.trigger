trigger accounttgr on Account (before insert, before update) 
{
    accountclass.copiarDireccion(trigger.new);
    accountClassFuture.myFuture(trigger.new[0].Id);
}