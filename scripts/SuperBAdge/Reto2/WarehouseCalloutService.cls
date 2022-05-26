public with sharing class WarehouseCalloutService {
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
     
    @future(callout=true) // se realiza el pedido , si la llamada es verdadera 
    public static void runWarehouseEquipmentSync(){
        System.debug('go into runWarehouseEquipmentSync');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        List<Product2> product2List = new List<Product2>();//se crea metodo list para los productos 
        System.debug(response.getStatusCode());
        if (response.getStatusCode() == 200){//si el lote de productos es igual a 200 
            List<Object> jsonResponse = (List<Object>)JSON.deserializeUntyped(response.getBody());// se deserializa el Json
            //para poder manipularlo en el codigo
            System.debug(response.getBody()); 
            
            
            for (Object jR : jsonResponse){// se recorre el deserializable 
                Map<String,Object> mapJson = (Map<String,Object>)jR;//se obtiene el id de los objetos deserializados. 
                Product2 product2 = new Product2(); // se crea un objeto producto para reemplazar lo que viene por defecto en el 
                // por lo obtenido del Json con el map.
                //replacement part (always true),
                product2.Replacement_Part__c = (Boolean) mapJson.get('replacement');
                //cost
                product2.Cost__c = (Integer) mapJson.get('cost');
                //current inventory
                product2.Current_Inventory__c = (Double) mapJson.get('quantity');
                //lifespan
                product2.Lifespan_Months__c = (Integer) mapJson.get('lifespan');
                //maintenance cycle
                product2.Maintenance_Cycle__c = (Integer) mapJson.get('maintenanceperiod');
                //warehouse SKU                
                product2.Warehouse_SKU__c = (String) mapJson.get('sku');
                
                product2.Name = (String) mapJson.get('name');
                product2.ProductCode = (String) mapJson.get('_id');
                product2List.add(product2); // se agrega lo reemplazado en producto.
            }
            
            if (product2List.size() > 0){ // si existen elementos en la lista , se reemplaza y se actualiza lo ya declarado 
                upsert product2List;
                System.debug('Your equipment was synced with the warehouse one');
            }
        }
    }
    
    public static void execute (QueueableContext context){
        System.debug('start runWarehouseEquipmentSync');
        runWarehouseEquipmentSync();
        System.debug('end runWarehouseEquipmentSync');
    }
    
}
