trigger cancionTgr on Cancion__c (after insert, after update) 
{
    Cancion__c c = trigger.new[0];
    if(c.letra__c == null)
    {
        songs.getSong(c.Artista__c, c.Cancion__c,c.Id);
    }
    
}