public class GovLimitController {
    public Integer campCount{get;set;}
    
    public void hitGovLimit() {
        CampTestDataFactory data = new CampTestDataFactory();
        List<Job_Campaign__c> jobs = data.getBulkCampaigns(campCount);
        try{
            for(Job_Campaign__c j : jobs) {
                j.Description__c = 'new description';
                Update j;
            }
        }
        catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Gov Limit'));
            
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Done'));
        database.delete(jobs);
    }
    
    public void hitSOSLLimit() {
        CampTestDataFactory data = new CampTestDataFactory();
        List<Job_Campaign__c> jobs = data.getBulkCampaigns(campCount);
        for(Integer i=0;i<campCount;i++) {
            String name = 'testJobii'+i;
            List<List<SObject>> c = [FIND :name IN ALL FIELDS 
                                      RETURNING Job_Campaign__c(Name)];
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Done'));
        database.delete(jobs);
    }
    
    public void hitSOQLLimit() {
        CampTestDataFactory data = new CampTestDataFactory();
        List<Job_Campaign__c> jobs = data.getBulkCampaigns(campCount);
        for(Integer i=0;i<campCount;i++) {
            String name = 'testJobii'+i;
            List<Job_Campaign__c> c = [Select Name from Job_Campaign__c where Name = :name];
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Done'));
        database.delete(jobs);
    }
}