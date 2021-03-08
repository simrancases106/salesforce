@isTest
public class JobCampaignAfterTriggerTest {
    static testMethod void testUpdateCandidateStatusNonActive() {
        List<Job_Campaign__c> jobs = TestDataFactory.createActiveInactiveJobCampaignAndCandidates(true, 5, 'In Progress');
        List<Job_Campaign__c> updatedJobs = new List<Job_Campaign__c>();
        for(Job_Campaign__c j: jobs) {
            j.Active__c = false;
            updatedJobs.add(j);
        }
        System.debug('Updated jobs - '+updatedJobs);
        Test.startTest();
        update updatedJobs;
        Test.stopTest();
        
        List<Position__c> pos = [Select Id, (Select Id, status__c from Candidates__r) from Position__c where Job_Campaign__c in :jobs];
        for(Position__c pp: pos) {
            for(Candidate__c c: pp.Candidates__r) {
            	system.assertEquals('On Hold', c.Status__c);
            }
        }
        
    }
    
    static testMethod void testUpdateCandidateStatusActive() {
        List<Job_Campaign__c> jobs = TestDataFactory.createActiveInactiveJobCampaignAndCandidates(false, 5, 'On Hold');
        List<Job_Campaign__c> updatedJobs = new List<Job_Campaign__c>();
        for(Job_Campaign__c j: jobs) {
            j.Active__c = true;
            updatedJobs.add(j);
        }
        Test.startTest();
        update updatedJobs;
        Test.stopTest();
        
        List<Position__c> pos = [Select Id, (Select Id, status__c from Candidates__r) from Position__c where Job_Campaign__c in :jobs];
        for(Position__c pp: pos) {
            for(Candidate__c c: pp.Candidates__r) {
            	system.assertEquals('In Progress', c.Status__c);
            }
        }
    }
    
    Static testMethod void testDisabledTrigger() {
        insert new Toggle_Settings__c(Name = 'EnableAfterUpdateTrigger', Settings__c = false);
        List<Job_Campaign__c> jobs = TestDataFactory.createActiveInactiveJobCampaignAndCandidates(false, 5, 'On Hold');
        List<Job_Campaign__c> updatedJobs = new List<Job_Campaign__c>();
        for(Job_Campaign__c j: jobs) {
            j.Active__c = true;
            updatedJobs.add(j);
        }
        Test.startTest();
        update updatedJobs;
        Test.stopTest();
    }
}