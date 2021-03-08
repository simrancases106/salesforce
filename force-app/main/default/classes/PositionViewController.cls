public class PositionViewController {
    
    private integer totalRecs = 0;
	private integer OffsetSize = 0;
	private integer LimitSize= 2;
    
    public PositionViewController() {
        totalRecs = [Select count() from Position__c];
    }
    
    public List<Position__c> getPositions() {
        List<Position__c> p = [Select Id, Name, Type__c, Job_Campaign__r.Name, Assignee__r.Name from Position__c 
                               limit :LimitSize OFFSET :OffsetSize];
        return p;
    }
    
    public void FirstPage() {
        OffsetSize = 0;
    }
    
    public void previous() {
        Offsetsize = OffsetSize - LimitSize;
    }
    
    public void next() {
        OffsetSize = OffsetSize + LimitSize;
    }
    
    public boolean getprev()
    {
        if(OffsetSize == 0)
        return true;
        else
        return false;
    }
    
    public boolean getnxt()
    {
        if((OffsetSize + LimitSize) > totalRecs)
        return true;
        else
        return false;
    }
}