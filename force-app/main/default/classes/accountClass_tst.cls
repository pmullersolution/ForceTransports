@isTest
public class accountClass_tst 
{
    @TestSetup
    static void makeData()
    {
        List<Account> listAcct = new List<Account>();
<<<<<<< HEAD
        for(integer i =0;i <=200;i++)
        {
            listAcct.add(new account(name = 'cliente prueba '+i, BillingCountry= 'Argentina', BillingCity='Mendoza', BillingState = 'Mendoza '+i));
        }   
=======
        for(integer i =0;i <=5;i++)
        {
            listAcct.add(new account(name = 'cliente prueba '+i, BillingCountry= 'Argentina', BillingCity='Mendoza', BillingState = 'Mendoza '+i));
        }   

        //
>>>>>>> 845c5fce3fc192b7ae867def38db84d750df069d
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 845c5fce3fc192b7ae867def38db84d750df069d
