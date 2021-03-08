public class FutureController {
    public void addJobs() {
        CampTestDataFactory data = new CampTestDataFactory();
        List<Job_Campaign__c> jobs = data.getBulkCampaigns(5);
        List<Id> ids = new List<Id>();
        for(Job_Campaign__c j : jobs){
            ids.add(j.Id);
        }
        FutureMethod.addPositions(ids);
    }
}