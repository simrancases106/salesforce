public class FutureMethod {
	@future
    public static void addPositions(List<ID> ids) {
        List<Job_Campaign__c> jobs = [Select ID, Name from Job_Campaign__c where Id in :ids];
        List<Position__c> pos = new List<Position__c>();
        for(Job_Campaign__c j : jobs) {
            Position__c p = new Position__c();
            p.Name = j.Name+'-Developer';
            p.Type__c = 'Full Time';
            p.Job_Campaign__c = j.Id;
         	pos.add(p);
        }
        DataBase.insert(pos, false);

    }
}