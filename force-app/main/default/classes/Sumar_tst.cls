@isTest
public with sharing class Sumar_tst {
    public Sumar_tst() {
    }
    @TestSetup
    static void makeData(){
        List<Suma__c> lista = new List<Suma__c>();
        for(integer i = 0; i < 200; i++){
            lista.add(new Suma__c(n1__c=i, n2__c=i+1));
        }
        System.debug(lista);
        Database.insert(lista);
    }
    static testmethod void testSuma(){
        List<Suma__c> newLista = Database.query('select n1__c, n2__c from Suma__c');
        Sumar.getInstance(newLista).getSuma();
    }
}
