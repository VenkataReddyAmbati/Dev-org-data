public class newtdattestion 
{
  public Internal_Risk_Details__c attestation{get;set;}
    public String agrId {get;set;}
    public String rtId {get;set;}
    
    
    public newtdattestion(ApexPages.StandardController std)
    {
        attestation=(Internal_Risk_Details__c)std.getRecord();
        agrId=ApexPages.currentPage().getParameters().get('arrangementId');
    }
    
    public PageReference saveRecord()
    {
        
       // rtId=[Select Id from RecordType where SObjectType='Internal_Risk_Details__c' and Name='TD Attestation'].Id;
       
        Internal_Risk_Details__c attest=new Internal_Risk_Details__c();
        attest.td1__c=attestation.td1__c;
        attest.td2__c=attestation.td2__c;
        attest.td3__c=attestation.td3__c;
        attest.Arrangements__c=agrId;
       // attest.RecordTypeId=rtId;
        insert attest;
        PageReference pr =new PageReference('/'+agrId);
        return pr;
           
    }
}