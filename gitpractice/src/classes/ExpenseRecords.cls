public class ExpenseRecords {
   
   @AuraEnabled
    public static list<TrailAppReddy__Expense__c> fetchdata()
    {
       list<TrailAppReddy__Expense__c> exps=[select id,name,CreatedById,LastModifiedById,ownerId,RecordTypeId,TrailAppReddy__Date__c,TrailAppReddy__Client__c,TrailAppReddy__Amount__c,TrailAppReddy__Reimbursed__c from TrailAppReddy__Expense__c];
        return exps;
    }
    


}