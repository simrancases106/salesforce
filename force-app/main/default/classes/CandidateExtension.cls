public class CandidateExtension {
    public CandidateExtension(ApexPages.standardcontroller cc) {}
    
    public Position__c getCandidateParent() {
        String rid = ApexPages.currentPage().getParameters().get('id');
        system.debug('rid - '+rid);
        Candidate__c c = [Select Position__r.Name from Candidate__c where id = :rid];
        system.debug('candidate - '+c);
        return c.Position__r;
    }
}