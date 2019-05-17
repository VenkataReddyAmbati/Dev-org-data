public class newinternalcontroller 
{
     public String agrId{get;set;}
    public arrangements__c agr {get;set;}
    public String recordTypeId{get;set;}
    public Internal_Risk_Details__c irr{set;get;}
    public newinternalcontroller()
    {
         //irr=(Internal_Risk_Details__c)cont.getRecord();
        agrId=ApexPages.currentPage().getParameters().get('arrangementId');
       // recordTypeId=[Select Id from RecordType where SObjectType='Internal_Risk_Details__c' and Name='internalriskdetails'].Id;
        agr=[Select Id,Submission_date__c from arrangements__c where id=:agrId];
        //irr.internal_date__c=agr.Submission_date__c;
        
        
    }
    
    public PageReference flowRedirection()
    {
       PageReference pr=new PageReference('/apex/newinternal');
       pr.getParameters().put('varArrangementId',agrId);
      // pr.getParameters().put('varRecordType',recordTypeId);
       pr.getParameters().put('retURL',agrId);
     
       return pr;
    }



}