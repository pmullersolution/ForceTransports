public class cats {
    public cats() {

    }

    public static list<catsFacts> getCatsFacts()
    {
        Http http = new http();
        HttpRequest Request = new HttpRequest();
        list<catsFacts> retorno = new List<catsFacts>();

        Request.setEndpoint('https://cat-fact.herokuapp.com/facts/');
        Request.setMethod('GET');
        HttpResponse Responde = http.send(request);

        String respuesta = Responde.getBody();
        respuesta = respuesta.replaceAll('_id', 'x_id');
        respuesta = respuesta.replaceAll('__v', 'x_v');

        retorno = (List<catsFacts>) JSON.deserializeStrict(respuesta, list<catsFacts>.class);

        return retorno;
    }

    //Class wrapper
    public class catsFacts{
		public Integer x_v{get;set;}
		public String updatedAt{get;set;}
		public String source{get;set;}
		public String type{get;set;}
		public String text{get;set;}
		public String createdAt{get;set;}
		public String user{get;set;}
		public Boolean deleted{get;set;}
		public String x_id{get;set;}
		public Boolean used{get;set;}
		public status status{get;set;}
	}
    public class status{
		public String feedback{get;set;}
		public Integer sentCount{get;set;}
		public Boolean verified{get;set;}
	}
}
