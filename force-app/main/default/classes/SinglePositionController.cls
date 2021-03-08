public class SinglePositionController {
	public Position__c getSinglePositions() {
        String id = ApexPages.currentPage().getParameters().get('id');
        Position__c p = [Select Id, Name from Position__c where id = :id];
        return p;
    }
}