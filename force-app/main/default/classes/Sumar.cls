public with sharing class Sumar {
    private  List<Suma__c> lista = new List<Suma__c>();
  
    private static  Sumar instance  = null;    
    private Sumar(List<Suma__c>lista) {
        this.lista = lista;  
    }  
    public static Sumar getInstance(List<Suma__c>lista){
  
      if(instance  == null){
        instance = new Sumar(lista);
      }
      return instance;
    }
  
    private  void sumarTrigg(){  
      for (Integer i = 0; i < this.lista.size(); i++) { 
          this.lista[i].Resultado__c =  this.lista[i].n1__c +  this.lista[i].n2__c;
        }
   }
  
  public void getSuma(){
       sumarTrigg();
    }  
  }