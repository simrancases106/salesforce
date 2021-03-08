public class JobCampaignAfterTriggerHandler {
    public void updateCandidateStatus(List<Job_Campaign__c> JobList) {
        //List<Job_Campaign__c> jobs = [Select Id, Job_Campaign__r.active__c from Position__c where Job_Campaign__c in :JobList];
        //List<Candidate__c> candidates = [select active__c, Job_Campaign__r.active__c from Candidate__C where Position__c.Id in :jobList];
        Boolean enableEmail = Toggle_Settings__c.getInstance('EnableEmails').Settings__c;
        Email_Body__mdt activateBody = [Select Email_Body__c from Email_Body__mdt where label = 'Activate Job'];
        Email_Body__mdt deactivateBody = [Select Email_Body__c from Email_Body__mdt where label = 'Deactivate Job'];
        Map<Id, Boolean> positionMap = new Map<Id, Boolean>();
        
        List<Position__c> positions = [Select Id, Job_Campaign__r.active__c from Position__c where Job_Campaign__c in :JobList];
        for(Position__c p : positions) {
            positionMap.put(p.Id, p.Job_Campaign__r.active__c);
        }
        List<Candidate__c> candidates = [select active__c, Status__c, Email__c, Position__r.Id from Candidate__C where Position__c in :positions];
        List<Candidate__c> updatedCandidates = new List<Candidate__c>();
        
        for(Candidate__c c : candidates) {
            if(!positionMap.get(c.Position__r.Id)) {
                c.Status__c = 'On Hold';
                if(enableEmail) {
                    sendEmail(c.Email__c, activateBody.Email_Body__c);
                }
            }
            else if(positionMap.get(c.Position__r.Id) && c.Status__c == 'On Hold') {
                c.Status__c = 'In Progress';                
				if(enableEmail) {
                    sendEmail(c.Email__c, deactivateBody.Email_Body__c);
                }
            }
            updatedCandidates.add(c);
        }
        Database.update(updatedCandidates, false);
        
    }
    
    public void sendEmail(String emailId, String Body) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[] { emailId };
        message.optOutPolicy = 'FILTER';
        message.subject = 'Job campaign updated';
        message.plainTextBody = body;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.sendEmail(messages);
		system.debug('email sent');        
    }
}