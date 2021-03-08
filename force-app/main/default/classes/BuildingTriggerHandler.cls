public class BuildingTriggerHandler {
    public void updateAddress(List<Building__c> buildingList) {
        List<Flat__c> updatedFlats = new List<Flat__c>();
        List<Id> ids = new List<Id>();
        for(Building__c buil: buildingList) {
            ids.add(buil.Id);
        }
        List<Building__c> buildings = [Select Id, Address__c, (Select Name, Address__c from Flats__r) from Building__c where Id in :ids];
        for(Building__c bb: buildings) {
            for(Flat__c ff: bb.flats__r) {
                ff.Address__c = bb.Address__c;
                updatedFlats.add(ff);
            }
        }
        update updatedFlats;
    }
}