public class CloneButtonVFController {
   

    private ApexPages.StandardController controller {get; set;}
    private TrailAppReddy__SBI_Arrangements__c SBIArrRecordQueried{get;set;}
    public TrailAppReddy__SBI_Arrangements__c SBIArrRecord {get;set;}

    public CloneButtonVFController(ApexPages.StandardController controller) {

        this.controller = controller;
        SBIArrRecord = (TrailAppReddy__SBI_Arrangements__c)controller.getRecord();
        SBIArrRecordQueried = [select Id,Name,TrailAppReddy__combined__c,TrailAppReddy__Date_time__c from TrailAppReddy__SBI_Arrangements__c where id =: SBIArrRecord.Id];
                      
    }

    public PageReference cloneOpportunity() {

         Savepoint sp = Database.setSavepoint();
         TrailAppReddy__SBI_Arrangements__c SBIArrCloned;
         try {
             SBIArrCloned = SBIArrRecordQueried.clone(false);
             insert SBIArrCloned;
         } catch (Exception e){
            Database.rollback(sp);
            ApexPages.addMessages(e);
            return null;
         }
        return new PageReference('/'+SBIArrCloned.id);

    }



}