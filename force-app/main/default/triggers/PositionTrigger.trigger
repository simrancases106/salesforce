trigger PositionTrigger on Position__c (after update) {
    if(Trigger.isUpdate && Trigger.isAfter) {
        PositionAfterTriggerHandler handler = new PositionAfterTriggerHandler();
        handler.updateCandidateDesignation(Trigger.new);
    }
}