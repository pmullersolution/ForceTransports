@isTest
public class future_tst 
{
    @TestSetup
    static void makeData() 
    {

        List<Account> listaCuenta = new List<Account>();

        for(integer i =0; i <= 2; i++)
        {
            listaCuenta.add(new account(name = 'cliente prueba '+ i));
            
        }   

        Database.insert(listaCuenta);

    }

    static testmethod void testFutureOK(){

        List<Account> listaString = database.query('Select Id, Name, BillingAddress, BillingCountry, BillingCity, BillingState, BillingStreet From Account');

        String jsonSend2 = JSON.serialize(listaString);

        accountClassFuture.myFuture(jsonSend2);

    }

    static testmethod void testFutureKO(){

        List<Account> listaString = database.query('Select Id, Name, BillingAddress, BillingCountry, BillingCity, BillingState, BillingStreet From Account');

        for (Account variable : listaString) {

            variable.Id = null;
            
        }

        String jsonSend2 = JSON.serialize(listaString);

        accountClassFuture.myFuture(jsonSend2);

    }



}