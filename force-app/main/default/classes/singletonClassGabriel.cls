public with sharing class singletonClassGabriel {

    public singletonClassGabriel(){
        
    }

    private static singletonClassGabriel() {
        System.debug('Hola, soy Gabriel Sosa');
    }

    public void getGabriel(){
        singletonClassGabriel();
    }
}
