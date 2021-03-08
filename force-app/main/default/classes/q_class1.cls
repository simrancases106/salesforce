public class q_class1 implements Queueable{
    public static void execute(QueueableContext con) {
        Job_Campaign__c job = new Job_Campaign__c();
        job.Name = 'Queued Job';
        job.Active__c = true;
        job.Description__c = 'des';
        insert job;
    }
}