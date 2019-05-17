trigger approverprocessValidation on arrangements__c (before update) {
    Set<Id> statusChangedRecords= new Set<Id>();
    for(arrangements__c arg:trigger.new)
    {
        if(trigger.oldMap.get(arg.id).Status__c=='Drafting' && arg.Status__c=='TQ QC Review')
        {
        
            statusChangedRecords.add(arg.id);
        }
    }
    if(statusChangedRecords.size()>0){
    List<arrangements__c> agrs=[select id,(select id from Internal_Risk_Details__r) from arrangements__c where id in: statusChangedRecords];
        for(arrangements__c arg:agrs )
        {
            
        }
    }
}