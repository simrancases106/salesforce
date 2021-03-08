public class CandidateAfterTriggerHandler {
    public void updateCandidateMinWage(List<Candidate__c> candidates) {
        for(Candidate__c c: candidates) {
            if(c.Status__c == 'Hired') {
                String year = String.valueOf(System.today().year()); 
                Integer minWage = Integer.valueOf(Minimum_Wage__c.getInstance(year).MinWage__c);
                If(minWage != null) {
                	c.MinWage__c = minWage;
                }
            }
        }
    }
}