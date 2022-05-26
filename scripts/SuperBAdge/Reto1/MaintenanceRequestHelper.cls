public with sharing class MaintenanceRequestHelper {
    
    public static void updateworkOrders(List<Case> updWorkOrders, Map<Id,Case> nonUpdCaseMap) {// metodo statico que va a recorrer 
    
        //el objeto Case y crea una variable para asignar los trabajos 
        //y un  mapa para obtener los casos vacio y en consecuencia asignarle los trabajos 
            
            Set<Id> validIds = new Set<Id>();// se trae los id vacios y se los setea par llenarlos 
            For (Case c : updWorkOrders){ // se recorre el objeto CASE y la variable upWORK....
                if (nonUpdCaseMap.get(c.Id).Status != 'Closed' && c.Status == 'Closed'){
                    if (c.Type == 'Repair' || c.Type == 'Routine Maintenance'){
                        validIds.add(c.Id); // luego de la condicion que comprueba que estan vacios los registros , se le asigna id
                    }
                }
            }
            
           
            if (!validIds.isEmpty()){ // si los id no estan vacios , se accede a ellos para obtener los objetos relacionados con CASE
                Map<Id,Case> closedCases = new Map<Id,Case>([SELECT Id, Vehicle__c, Equipment__c, Equipment__r.Maintenance_Cycle__c,
                                                              (SELECT Id,Equipment__c,Quantity__c FROM Equipment_Maintenance_Items__r) 
                                                              FROM Case WHERE Id IN :validIds]);
                Map<Id,Decimal> maintenanceCycles = new Map<ID,Decimal>();
                
                //calcula el pedido de mantenimiento y selecciona el ciclo minimo , utilizando un arreglo.
                AggregateResult[] results = [SELECT Maintenance_Request__c, 
                                             MIN(Equipment__r.Maintenance_Cycle__c)cycle 
                                             FROM Equipment_Maintenance_Item__c 
                                             WHERE Maintenance_Request__c IN :ValidIds GROUP BY Maintenance_Request__c];
                
                for (AggregateResult ar : results){ //se recorre el arreglo anterior y se pone el id del ciclo
                                                    //se obtiene el pedido de mantenimeinto y se castea a decimal el pedido de ciclo
                    maintenanceCycles.put((Id) ar.get('Maintenance_Request__c'), (Decimal) ar.get('cycle'));
                }
                // se crea una lista de case 
                List<Case> newCases = new List<Case>();
                for(Case cc : closedCases.values()){// s la recorre y se crea un nuevo objeto case que se le asignaran valores
                    Case nc = new Case (
                        ParentId = cc.Id,
                        Status = 'New',
                        Subject = 'Routine Maintenance',
                        Type = 'Routine Maintenance',
                        Vehicle__c = cc.Vehicle__c,
                        Equipment__c =cc.Equipment__c,
                        Origin = 'Web',
                        Date_Reported__c = Date.Today() 
                    );
                    
                    // se invoca el objeto nuevo de case y se le asignan los valores anteriormente seteados 
                        nc.Date_Due__c = Date.today().addDays((Integer) maintenanceCycles.get(cc.Id));
                   
                    
                    newCases.add(nc);// se agregan al objeto 
                }
                
                insert newCases;// se insertan en base 
                
                List<Equipment_Maintenance_Item__c> clonedList = new List<Equipment_Maintenance_Item__c>();// se crea una lista 
                // del mantenimiento 
                for (Case nc : newCases){// se recorre la lista Case donde esta el nuevo objeto xcreado anteriormente para clonarla e insertarla 
                    for (Equipment_Maintenance_Item__c clonedListItem : closedCases.get(nc.ParentId).Equipment_Maintenance_Items__r){
                        Equipment_Maintenance_Item__c item = clonedListItem.clone();
                        item.Maintenance_Request__c = nc.Id;
                        clonedList.add(item);
                    }
                }
                insert clonedList;
            }
        }
    }
    
