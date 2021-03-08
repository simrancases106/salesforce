@isTest
public class CandidateAfterTriggerTest {
    static testMethod void testUpdateCandidate() {
        String year = String.valueOf(System.today().year());
        Integer wage = 8;
        insert new Minimum_Wage__c(Name = year, MinWage__c = 8);
        List<Candidate__c> candidates = CandidateTestDataFactory.createCandidate(5, 'In Progress');
        
        for(Candidate__c c: candidates) {
            c.Status__c = 'Hired';
        }
        Test.startTest();
        update candidates;
        Test.stopTest();
        
        List<Candidate__c> cc = [Select MinWage__c from Candidate__c where Id in :candidates];
        for(Candidate__c c : cc) {
            System.assertEquals(wage, Integer.valueOf(c.MinWage__c));
        }
    }
}