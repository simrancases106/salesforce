public class CampTestDataFactory {
    public List<Job_Campaign__c> getBulkCampaigns(Integer count) {
        List<Job_Campaign__c> jobs = new List<Job_Campaign__c>();
        for(Integer i = 0; i<count; i++) {
            Job_Campaign__c j = new Job_Campaign__c();
            j.Name = 'testJobii'+i;
            j.Description__c = 'des';
            j.Active__c = true;
            jobs.add(j);
        }
        Insert jobs;
        return jobs;
    }
}