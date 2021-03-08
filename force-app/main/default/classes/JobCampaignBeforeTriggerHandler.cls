public class JobCampaignBeforeTriggerHandler {
    
    public void checkJobName(List<Job_Campaign__c> jobList) {
        List<String> Names = new List<String>();
        for(Job_Campaign__c job: jobList) {
            Names.add(job.Name);
        }
        //Map<Id,Job_Campaign__c> m = new Map<Id,Job_Campaign__c>([Select Id, Name from Job_Campaign__c where Name in :Names]);
        //system.debug(m);
        
        List<Job_Campaign__c> jobs = [Select Name from Job_Campaign__c where Name in :Names];
		List<String> existingJobNames = new List<String>();        
        for(Job_Campaign__c job: jobs) {
            existingJobNames.add(job.Name);
        }
        if(existingJobNames.size() > 0) {
            for(Job_Campaign__c jj: jobList) {
                if(existingJobNames.contains(jj.Name)) {
                    jj.Name.addError(Constants.error);
                }
            }
    	}
    }
}