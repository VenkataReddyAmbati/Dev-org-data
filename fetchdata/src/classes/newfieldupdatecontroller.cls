public class newfieldupdatecontroller 
{
    public Internal_Risk_Details__c irr{set;get;}
    public arrangements__c arr{set;get;}
    public string arrayid;
    public newfieldupdatecontroller(apexpages.StandardController cont)
    {
        irr=(Internal_Risk_Details__c)cont.getRecord();
        arrayid=apexpages.currentPage().getparameters().get('arrid');
        arr=[select id,status__c,Submission_date__c from arrangements__c where id=:arrayid];
        irr.arrangements__c=arr.Id;
        irr.internal_date__c=arr.Submission_date__c;
        
        
    }
    public pagereference saverecord()
    {
        Internal_Risk_Details__c irr1=new Internal_Risk_Details__c();
        irr1.Approver__c=irr.Approver__c;
        irr1.internal_date__c=irr.internal_date__c;
        irr1.arrangements__c=irr.arrangements__c;
       insert irr1;
        pagereference pr=new pagereference('/'+arrayid);
        return pr;
        
    }

}