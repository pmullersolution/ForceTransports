@isTest
public class accountClass_tst 
{
    @TestSetup
    static void makeData()
    {
        List<Account> listAcct = new List<Account>();
        for(integer i =0;i <=200;i++)
        {
            listAcct.add(new account(name = 'cliente prueba '+i, BillingCountry= 'Argentina', BillingCity='Mendoza', BillingState = 'Mendoza '+i));
        }   
        system.debug(listAcct);
        Database.insert(listAcct);
    }



    static testmethod void copiarDireccion_tstOK() 
    {
        //Declaración de codigo
        
        List<Account> accs = database.query('Select Id, Name, BillingAddress, BillingCountry, BillingCity, BillingState, BillingStreet From Account');

        //Llamar a clase para prueba
        accountclass.copiarDireccion(accs);
    }

    static testmethod void copiarDireccion_tstKO() 
    {
        //Declaración de codigo
        List<Account> accs = database.query('Select Id, Name, BillingAddress, BillingCountry, BillingCity, BillingState, BillingStreet From Account');
        for(Account acc : accs)
        {
            acc.BillingCountry = null;
            acc.BillingCity = null;
            acc.BillingState = null;
            acc.BillingStreet = null;
        }

        update accs;

        //Llamar a clase para prueba
        accountclass.copiarDireccion(accs);
    }
}
