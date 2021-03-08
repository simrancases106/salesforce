trigger UpdateCandidateCountTrigger on Candidate__c (after update) {
	CandidateTriggerHelper helper = new CandidateTriggerHelper();
    if(Trigger.isupdate) {
        
    }
}