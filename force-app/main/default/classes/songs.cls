public class songs {

    @future(callout=true)
    public static void getSong(String autor, String cancion, id IdCancion)
    {
        SongsC s = getSongSync(autor, cancion, IdCancion, true);
    }
    
    @AuraEnabled(cacheable=true)
    public static songsC getSongSync(String autor, String cancion, String IdCancion, Boolean act)
    {
        songsC s = new songsC();
        
        Http http = new http();

        HttpRequest Request = new HttpRequest();

        Request.setEndpoint('https://api.lyrics.ovh/v1/:' +autor + '/:' +cancion);

        Request.setMethod('GET');

        HttpResponse Response = http.send(Request);

        String respuesta = Response.getBody();

        s = (songsC) JSON.deserializeStrict(respuesta, songsC.class);

        if(act)
        {
            Cancion__c cancionObj = new Cancion__c(Id = IdCancion, letra__c = s.lyrics);
            update cancionObj;
        }
           

        return s;

    }

    public class songsC{
        @AuraEnabled()
		  public String lyrics{get;set;}
    
    }
}