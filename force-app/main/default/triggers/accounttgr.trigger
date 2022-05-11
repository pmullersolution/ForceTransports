trigger accounttgr on Account (before insert, before update) 
{
    accountclass.copiarDireccion(trigger.new);
    string jsonSend = JSON.serialize(trigger.new);
    System.debug(jsonSend);
    accountClassFuture.myFuture(jsonSend);
}