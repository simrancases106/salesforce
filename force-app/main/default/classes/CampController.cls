public class CampController{
    public Job_Campaign__c camp {get;set;}
    
    public CampController() {
        camp = new Job_Campaign__c();
    }
    
    public PageReference  saveCampaign() {
        Integer count = [Select count() from job_Campaign__c where Name = :camp.Name];
        system.debug('cccc'+count);
        if(count > 0) {
            system.debug('in if');
            ApexPages.addmessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Name Already Exists'));
        }
        Database.insert(camp, false);
        return ApexPages.currentPage();
    }
}