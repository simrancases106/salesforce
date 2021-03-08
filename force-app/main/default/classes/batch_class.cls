public class batch_class implements Database.Batchable<SObject>{
    String field;
    String query;
    String value;
    //vscodechange
    public batch_class(String f, String q, String v) {
        field =f; query =q; value =v;
    }
    
    public Database.QueryLocator start(Database.BatchableContext con) {
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext con, List<Account> scope) {
        for(Account a: scope) {
            a.put(field,value);
        }
        Database.update(scope);
    }
    
    public void finish(Database.BatchableContext con) {
        
    }

}