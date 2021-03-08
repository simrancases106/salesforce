public class CandidateTestDataFactory {
	public static List<Candidate__c> createCandidate(Integer candidateCount, String CanidateStatus) {
        Job_Campaign__c j = new Job_Campaign__c();
        j.Name = 'Test job name';
        j.Active__c = true;
        insert j;
        
        Position__c position = new Position__c();
        position.Name = 'Test position name';
        position.Type__c = 'Full Time';
        position.Job_Campaign__c = j.Id;
        insert position;
        
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        for(Integer k = 0; k<candidateCount; k++) {
            Candidate__c cand = new Candidate__c();
            cand.Name = 'Candidate'+k;
            cand.Email__c = 'Candidate'+k+'@test.com';
            cand.Status__c = CanidateStatus;
            cand.Active__c = true;
            cand.Position__c = position.Id;
            candidates.add(cand);
        }
        insert candidates;
        return candidates;
    }
}