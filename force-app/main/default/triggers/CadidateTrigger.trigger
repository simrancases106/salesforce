trigger CadidateTrigger on Candidate__c (before update) {
	if(Trigger.isupdate && Trigger.isbefore) {
        CandidateAfterTriggerHandler handler = new CandidateAfterTriggerHandler();
        handler.updateCandidateMinWage(Trigger.new);
    }
}