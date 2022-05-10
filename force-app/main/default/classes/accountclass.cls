public with sharing class accountclass {
    public static void copiarDireccion(List<Account> listAcc) 
    {
        //soy Jessica
        //Power
        for(integer i=0;i < listAcc.size();i++)
        {
            listAcc[i].ShippingCountry = listAcc[i].BillingCountry;
            listAcc[i].ShippingCity = listAcc[i].BillingCity;
            listAcc[i].ShippingState = listAcc[i].BillingState;
            listAcc[i].ShippingStreet = listAcc[i].BillingStreet;  
        }
    }
}