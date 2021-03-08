public class PositionAfterTriggerHandler {
    public void updateCandidateDesignation(List<Position__c> pos) {
        
        List<Candidate__c> candidates = [select Designation__c, Position__r.Assignee__c from Candidate__C where Position__c in :pos];
        system.debug(candidates);
        List<Candidate__c> updatedCandidates = new List<Candidate__c>();
        for(Candidate__c c: candidates) {
            if(c.Position__r.Assignee__c != null) {
                String des = designation__c.getInstance(c.Position__r.Assignee__c).designation__c;
                c.Designation__c = des;
                updatedCandidates.add(c);
            }
        }
        Database.update(updatedCandidates, false);
    }
}