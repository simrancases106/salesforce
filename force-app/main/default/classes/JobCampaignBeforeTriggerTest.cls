@isTest
public class JobCampaignBeforeTriggerTest {
	static testMethod void testDuplicateNameJobCreation() {        
		Job_Campaign__c obj = new Job_Campaign__c();
        obj.Name = 'Test Job';
        obj.Active__c = false;
        insert obj;
            
        Job_Campaign__c obj1 = new Job_Campaign__c();
        obj1.Name = 'Test Job';
        obj1.Active__c = false;
        try{
        	insert obj1;  
        }
        catch(Exception ex){
        	Boolean expectedExceptionThrown =  ex.getMessage().contains(Constants.error) ? true : false;
			System.assertEquals(expectedExceptionThrown, true);
        }   
    }
    
    static testMethod void testSuccessfulJobCreation() {        
		Job_Campaign__c obj1 = new Job_Campaign__c();
        obj1.Name = 'Test Job1';
        obj1.Active__c = true;
        Database.SaveResult result = Database.insert(obj1);  
        system.assert(result.isSuccess());
          
    }
}