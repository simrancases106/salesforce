trigger JobCampaignTrigger on Job_Campaign__c (after update, before insert) {
    
    if(Trigger.isupdate && Trigger.isAfter && Toggle_Settings__c.getInstance('EnableAfterUpdateTrigger').Settings__c) {
        JobCampaignAfterTriggerHandler handler = new JobCampaignAfterTriggerHandler();
        handler.updateCandidateStatus(Trigger.new);
    }
    
    if(Trigger.isinsert && Trigger.isBefore) {
        //JobCampaignBeforeTriggerHandler beforeHandler = new JobCampaignBeforeTriggerHandler();
        //beforeHandler.checkJobName(Trigger.new);
    }
}