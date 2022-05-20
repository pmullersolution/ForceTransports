public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcess = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.QueryLocator('SELECT id, LeadSourse FROM Lead');            
    }
    public void execute(database.BatchableContext bc, List<Lead> scope){
        List<Lead> leads = new List<Lead>();
        for (Lead lead : scope) {
            lead.LeadSourse ='Dereamforce';
            recordsProcess++;
        }
        update leads;
    }
    public void finish(database.BatchableContext bc) {
        System.debug(recordProcessed + 'Total of records Processed' );
    }
}
