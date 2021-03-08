public class PositionTestDataFactory {
	public static List<Position__c> createPositions(Integer count) {
        Job_Campaign__c j = new Job_Campaign__c();
        j.Name = 'Test job name';
        j.Active__c = true;
        insert j;
        List<Position__c> positions = new List<Position__c>();
        for(Integer k = 0; k<count; k++) {
            Position__c position = new Position__c();
            position.Name = 'Test position name'+k;
            position.Type__c = 'Full Time';
            position.Job_Campaign__c = j.Id;
            positions.add(position);
        }
        insert positions;
        
        
        List<Candidate__c> candidates = new List<Candidate__c>();
        for(Position__c p: positions) {
            Candidate__c cand = new Candidate__c();
            cand.Name = 'Candidate'+p.Name;
            cand.Email__c = 'Candidate'+p.Name+'@test.com';
            cand.Active__c = true;
            cand.Position__c = p.Id;
            candidates.add(cand);
        }
        insert candidates;
        return positions;
    }
}