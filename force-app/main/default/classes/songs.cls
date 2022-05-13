public class songs {
    
    @future(callout=true)
    public static void getSong(String autor, String cancion, id IdCancion)
    {
        songsC s = new songsC();
        
        Http http = new http();

        HttpRequest Request = new HttpRequest();

        Request.setEndpoint('https://api.lyrics.ovh/v1/:' +autor + '/:' +cancion);

        Request.setMethod('GET');

        HttpResponse Response = http.send(Request);

        String respuesta = Response.getBody();

        s = (songsC) JSON.deserializeStrict(respuesta, songsC.class);

        Cancion__c cancionObj = new Cancion__c(Id = IdCancion, letra__c = s.lyrics);

        update cancionObj;

    }

    public class songsC{

		  public String lyrics{get;set;}
    
    }
}