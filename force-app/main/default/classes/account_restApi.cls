@RestResource(UrlMapping='/clientes/*')
global with sharing class account_restApi 
{
    @HttpGet
    global static list<Account> doGet()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string NameAccount = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        return [Select Id, Name, Phone From Account Where Name = :NameAccount];
    }
}