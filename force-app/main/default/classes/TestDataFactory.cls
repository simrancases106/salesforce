@isTest
public class TestDataFactory {
    public static List<Job_Campaign__c> createActiveInactiveJobCampaignAndCandidates(Boolean active, Integer count, String CanidateStatus) {
        insert new Toggle_Settings__c(Name = 'EnableEmails', Settings__c = true);
        insert new Toggle_Settings__c(Name = 'EnableAfterUpdateTrigger', Settings__c = true);
        List<Job_Campaign__c> jobs = new List<Job_Campaign__c>();
        for(Integer i=1; i<= count; i++) {
            Job_Campaign__c j = new Job_Campaign__c();
            j.Name = 'job'+i;
            j.Active__c = active;
            jobs.add(j);
        }
        insert jobs; 
        List<Position__c> pos = new List<Position__c>();
        for(Job_Campaign__c j: jobs) {
            for(Integer k=1; k<= count; k++) {
                pos.add(createPosition(j, k));
            }
        }
        insert pos;
        List<Candidate__c> candidates = new List<Candidate__c>();
        for(Position__c p: pos) {
            for(Integer k=1; k<= count; k++) {
                candidates.add(createCandidate(p , k, CanidateStatus));
            }
        }
        insert candidates;
        return jobs;
    }
    
    static Position__c createPosition(Job_Campaign__c job, Integer i) {
        Position__c position = new Position__c();
        position.Name = job.Name+'Position'+i;
        position.Type__c = 'Full Time';
        position.Job_Campaign__c = job.Id;
        return position;
    }
    
    static Candidate__c createCandidate(Position__c pos, Integer i, String CanidateStatus) {
        Candidate__c cand = new Candidate__c();
        cand.Name = pos.Name+'Candidate'+i;
        cand.Email__c = pos.Name+'Candidate'+i+'@example.com';
        cand.Status__c = CanidateStatus;
        cand.Active__c = true;
        cand.Position__c = pos.Id;
        return cand;
    }
    
}