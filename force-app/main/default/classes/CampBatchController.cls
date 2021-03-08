public class CampBatchController {
    public String field {get;set;}
    public String value {get;set;}
    
    public void updateCamp() {
        ID jobId = Database.ExecuteBatch(new CampDescriptionBatch(field, value), 2);
    }
}