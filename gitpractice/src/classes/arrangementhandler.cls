public class arrangementhandler {
public Id HSA_RecordTypeId = Schema.SObjectType.arrangements__c.getRecordTypeInfosByName().get('HSA_Record_Type').getRecordTypeId();
 public Id OthTra_RecordTypeId = Schema.SObjectType.arrangements__c.getRecordTypeInfosByName().get('Other_Transaction_type').getRecordTypeId();
    
    public void BeforeUpdate(Map < Id, arrangements__c > newMap) {
       
        
    } 
}