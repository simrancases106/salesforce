public class CampDescriptionBatch implements Database.Batchable<SObject>{
	String Field;
    String Value;
    
    public CampDescriptionBatch(String field, String value){
        this.Field = field;
        this.Value = value;
    }
    
    public Database.QueryLocator start(Database.BatchableContext con) {
        String query = 'Select Name, Description__c from Job_Campaign__c';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext con, List<Job_Campaign__c> jobs) {
        for(Job_Campaign__c j : jobs) {
            j.put(Field, Value);
        }
        Database.update(jobs, false);
    }
    
    public void finish(Database.BatchableContext con) {
        
    }
}