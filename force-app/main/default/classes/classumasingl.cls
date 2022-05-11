public with sharing class classumasingl { //nombre de la clase sintaxis
    
    private List<suma__c> lista = new list<suma__c>();
    
    private static classumasingl instance = null;
    
    private classumasingl (List<suma__c>lista){
        this.lista = lista;
    }
    public static classumasingl getInstance(List<suma__c> lista)
    {
       if(instance == null){
           instance = new classumasingl(lista);
       }
       return instance;
   }
   private void sumarTrigg(){
       for(Integer i = 0; i < this.lista.size(); i ++){

           this.lista[i].resultado__c = this.lista[i].Valor_Dos__c + this.lista[i].Valor_Uno__c;
       }
   }
   public void getSuma(){

       sumarTrigg();
   }
}