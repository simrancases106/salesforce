trigger ChangeAddress on Building__c (after update) {
	BuildingTriggerHandler handler = new BuildingTriggerHandler();
    if(Trigger.isUpdate) {
    	handler.updateAddress(Trigger.new);
    }
}