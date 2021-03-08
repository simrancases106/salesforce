public class CampExtention {
    public CampExtention(CampController obj){}
    
    public List<Job_Campaign__c> getCampaigns() {
        List<Job_Campaign__c> cc = [Select Name, Description__c, Active__c from Job_Campaign__c];
        return cc;
    }
}