global with sharing class WarehouseSyncSchedule implements Schedulable {
    // implemento el schedulable ya que voy a trabajar con lotes de trabajo.
     global void execute (SchedulableContext ctx){
         System.enqueueJob(new WarehouseCalloutService());// se crea un nuevo trabajo en la clase principal de servicio 
     }
 }